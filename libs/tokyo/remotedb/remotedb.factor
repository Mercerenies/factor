! Copyright (C) 2009 Bruno Deferrari
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel tokyo.alien.tcrdb tokyo.assoc-functor ;
in: tokyo.remotedb

COMPILE< "tcrdb" "remotedb" define-tokyo-assoc-api COMPILE>

: <tokyo-remotedb> ( host port -- tokyo-remotedb )
    [ tcrdbnew dup ] 2dip tcrdbopen drop
    tokyo-remotedb new [ handle<< ] keep ;
