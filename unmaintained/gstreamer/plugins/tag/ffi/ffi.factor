! Copyright (C) 2010 Anton Gorenko.
! See http://factorcode.org/license.txt for BSD license.
USING: alien alien.libraries combinators kernel system
gobject-introspection glib.ffi gstreamer.ffi ;
in: gstreamer.tag.ffi

COMPILE<
"gstreamer.tag" {
    { [ os winnt? ] [ drop ] }
    { [ os macosx? ] [ drop ] }
    { [ os unix? ] [ "libgsttag-0.10.so" cdecl add-library ] }
} cond
COMPILE>

gir: vocab:gstreamer/tag/GstTag-0.10.gir

