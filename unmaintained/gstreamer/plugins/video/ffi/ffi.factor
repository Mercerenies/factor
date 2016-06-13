! Copyright (C) 2010 Anton Gorenko.
! See http://factorcode.org/license.txt for BSD license.
USING: alien alien.c-types alien.libraries combinators kernel
system
gobject-introspection glib.ffi gobject.ffi gstreamer.ffi ;
in: gstreamer.video.ffi

COMPILE<
"gstreamer.video" {
    { [ os winnt? ] [ drop ] }
    { [ os macosx? ] [ drop ] }
    { [ os unix? ] [ "libgstvideo-0.10.so" cdecl add-library ] }
} cond
COMPILE>

IMPLEMENT-STRUCTS: GstVideoRectangle ;

gir: vocab:gstreamer/video/GstVideo-0.10.gir

