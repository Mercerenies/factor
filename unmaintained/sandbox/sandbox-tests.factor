! Copyright (C) 2009 Maxim Savchenko
! See http://factorcode.org/license.txt for BSD license.

USING: kernel accessors continuations lexer vocabs vocabs.parser
       combinators.short-circuit sandbox tools.test ;

in: sandbox.tests

COMPILE< "sandbox.syntax" load-vocab drop COMPILE>
use: sandbox.syntax.private

: run-script ( x lines -- y )
    H{ { "kernel" "kernel" } { "math" "math" } { "sequences" "sequences" } }
    parse-sandbox call( x -- x! ) ;

[ 120 ]
[
    5
    {
        "! Simple factorial example"
        "APPLYING: kernel math sequences ;"
        "1 swap [ 1+ * ] each"
    } run-script
] unit-test

[
    5
    {
        "! Jailbreak attempt with use:"
        "use: io"
        "\"Hello world!\" print"
    } run-script
]
[
    {
        [ lexer-error? ]
        [ error>> condition? ]
        [ error>> error>> no-word-error? ]
        [ error>> error>> name>> "use:" = ]
    } 1&&
] must-fail-with

[
    5
    {
        "! Jailbreak attempt with unauthorized APPLY:"
        "APPLY: io"
        "\"Hello world!\" print"
    } run-script
]
[
    {
        [ lexer-error? ]
        [ error>> sandbox-error? ]
        [ error>> vocab>> "io" = ]
    } 1&&
] must-fail-with
