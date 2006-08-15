! Copyright (C) 2004, 2006 Slava Pestov.
! See http://factorcode.org/license.txt for BSD license.
IN: compiler
USING: arrays assembler errors generic hashtables inference
kernel kernel-internals math namespaces sequences words ;

GENERIC: stack-reserve*

M: object stack-reserve* drop 0 ;

: stack-reserve ( node -- n )
    0 swap [ stack-reserve* max ] each-node ;

: intrinsic ( #call -- quot )
    node-param "intrinsic" word-prop ;

: if-intrinsic ( #call -- quot )
    node-param "if-intrinsic" word-prop ;

DEFER: #terminal?

PREDICATE: #merge #terminal-merge node-successor #terminal? ;

PREDICATE: #values #terminal-values node-successor #terminal? ;

PREDICATE: #call #terminal-call
    dup node-successor #if?
    over node-successor node-successor #terminal? and
    swap if-intrinsic and ;

UNION: #terminal
    POSTPONE: f #return #terminal-values #terminal-merge ;

: tail-call? ( -- ? )
    node-stack get [
        dup #terminal-call? swap node-successor #terminal? or
    ] all? ;

: generate-code ( node quot -- | quot: node -- )
    over stack-reserve %prologue call ; inline

: init-generator ( -- )
    V{ } clone relocation-table set
    V{ } clone literal-table set
    V{ } clone label-table set ;

: generate-1 ( word node quot -- | quot: node -- )
    #! Generate the code, then dump three vectors to pass to
    #! add-compiled-block.
    pick f save-xt [
        init-generator
        init-templates
        generate-code
        generate-labels
        relocation-table get
        literal-table get
    ] V{ } make
    code-format add-compiled-block save-xt ;
! 
GENERIC: generate-node ( node -- )

: generate-nodes ( node -- )
    [ node@ generate-node ] iterate-nodes end-basic-block ;

: generate ( word node -- )
    [ [ generate-nodes ] with-node-iterator ] generate-1 ;

! node
M: node generate-node drop iterate-next ;

! #label
: generate-call ( label -- next )
    end-basic-block
    tail-call? [ %jump f ] [ %call iterate-next ] if ;

M: #label generate-node
    dup node-param dup generate-call >r
    swap node-child generate r> ;

! #if
: end-false-branch ( label -- )
    tail-call? [ %return drop ] [ %jump-label ] if ;

: generate-if ( node label -- next )
    <label> [
        >r >r node-children first2 generate-nodes
        r> r> end-false-branch resolve-label generate-nodes
    ] keep resolve-label iterate-next ;

M: #if generate-node
    [
        end-basic-block
        <label> dup %jump-t
    ] H{
        { +input { { f "flag" } } }
    } with-template generate-if ;

! #call
: [with-template] ( quot template -- quot )
    2array >quotation [ with-template ] append ;

: define-intrinsic ( word quot template -- | quot: -- )
    [with-template] "intrinsic" set-word-prop ;

: define-if-intrinsic ( word quot template -- | quot: label -- )
    [with-template] "if-intrinsic" set-word-prop ;

: if>boolean-intrinsic ( label -- )
    "end" define-label
    f 0 <int-vreg> load-literal
    "end" get %jump-label
    resolve-label
    t 0 <int-vreg> load-literal
    "end" get resolve-label
    0 <int-vreg> phantom-d get phantom-push
    compute-free-vregs ;

: do-if-intrinsic ( node -- next )
    [ <label> dup ] keep if-intrinsic call
    >r node-successor dup #if? [
        r> generate-if node-successor
    ] [
        drop r> if>boolean-intrinsic iterate-next
    ] if ;

M: #call generate-node
    {
        { [ dup if-intrinsic ] [ do-if-intrinsic ] }
        { [ dup intrinsic ] [ intrinsic call iterate-next ] }
        { [ t ] [ node-param generate-call ] }
    } cond ;

! #call-label
M: #call-label generate-node
    node-param generate-call ;

! #dispatch
: dispatch-head ( node -- label/node )
    #! Output the jump table insn and return a list of
    #! label/branch pairs.
    [ end-basic-block %dispatch ] H{
        { +input { { f "n" } } }
        { +scratch { { f "scratch" } } }
    } with-template
    node-children [ <label> dup %target 2array ] map ;

: dispatch-body ( label/node -- )
    <label> swap [
        first2 resolve-label generate-nodes end-basic-block
        dup %jump-label
    ] each resolve-label ;

M: #dispatch generate-node
    #! The parameter is a list of nodes, each one is a branch to
    #! take in case the top of stack has that type.
    dispatch-head dispatch-body iterate-next ;

! #push
UNION: immediate fixnum POSTPONE: f ;

: generate-push ( node -- )
    >#push<
    dup length ?fp-scratch + 0 ensure-vregs
    [ f spec>vreg [ load-literal ] keep ] map
    phantom-d get phantom-append ;

M: #push generate-node
    generate-push iterate-next ;

! #shuffle
: phantom-shuffle-input ( n phantom -- seq )
    2dup length <= [
        cut-phantom
    ] [
        [ phantom-locs ] keep [ length head-slice* ] keep
        [ append ] keep delete-all
    ] if ;

: phantom-shuffle-inputs ( shuffle -- locs locs )
    dup shuffle-in-d length phantom-d get phantom-shuffle-input
    swap shuffle-in-r length phantom-r get phantom-shuffle-input ;

: adjust-shuffle ( shuffle -- )
    dup shuffle-in-d length neg phantom-d get adjust-phantom
    shuffle-in-r length neg phantom-r get adjust-phantom ;

: shuffle-vregs# ( shuffle -- n )
    dup shuffle-in-d swap shuffle-in-r additional-vregs ;

: phantom-shuffle ( shuffle -- )
    dup shuffle-vregs# 0 ensure-vregs
    [ phantom-shuffle-inputs ] keep
    [ shuffle* ] keep adjust-shuffle
    (template-outputs) ;

M: #shuffle generate-node
    node-shuffle phantom-shuffle iterate-next ;

! #return
M: #return generate-node drop end-basic-block %return f ;

! These constants must match vm/memory.h
: card-bits 7 ;
: card-mark HEX: 80 ;

! These constants must match vm/layouts.h
: float-offset 8 float-tag - ;
: string-offset 3 cells object-tag - ;
