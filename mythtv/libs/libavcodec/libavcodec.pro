######################################################################
# Automatically generated by qmake (1.03a) Thu Aug 15 18:00:09 2002
######################################################################

TEMPLATE = lib
TARGET = avcodec
CONFIG += thread staticlib warn_off

include ( ../../settings.pro )
include ( ../../config.mak )

!exists( ../../config.mak ) {
    error(Please run the configure script first)
}

INCLUDEPATH = ../../

QMAKE_CFLAGS_RELEASE = $$OPTFLAGS -DHAVE_AV_CONFIG_H -I.. -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE
QMAKE_CFLAGS_DEBUG = -g -DHAVE_AV_CONFIG_H -I.. -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE

# Input
SOURCES += common.c utils.c mem.c allcodecs.c mpegvideo.c h263.c jrevdct.c
SOURCES += jfdctfst.c mpegaudio.c ac3enc.c mjpeg.c resample.c dsputil.c
SOURCES += motion_est.c imgconvert.c imgresample.c msmpeg4.c mpeg12.c
SOURCES += h263dec.c svq1.c rv10.c mpegaudiodec.c pcm.c simple_idct.c
SOURCES += ratecontrol.c adpcm.c eval.c jfdctint.c dv.c error_resilience.c
SOURCES += wmadec.c fft.c mdct.c mace.c huffyuv.c opts.c cyuv.c
SOURCES += golomb.c h264.c raw.c indeo3.c asv1.c vp3.c 4xm.c cabac.c
SOURCES += ffv1.c ra144.c ra288.c vcr1.c cljr.c roqvideo.o dpcm.o
SOURCES += interplayvideo.o

contains( CONFIG_AC3, yes ) {
    SOURCES += a52dec.c
    !contains( CONFIG_A52BIN, yes ) {
        SOURCES += liba52/bit_allocate.c liba52/bitstream.c liba52/downmix.c
        SOURCES += liba52/imdct.c liba52/parse.c liba52/crc.c liba52/resample.c
    }
}

using_xvmc {
    SOURCES += xvmcvideo.c
    DEFINES += HAVE_XVMC
}

using_viahwslice {
    SOURCES += viaslice.c
    DEFINES += HAVE_VIASLICE
}

contains( AMR_NV, yes) {
    SOURCES += amr.c
}

contains( CONFIG_MP3LAME, yes ) {
    SOURCES += mp3lameaudio.c
    LIBS += -lmp3lame
}

contains( CONFIG_FAAD, yes) {
    SOURCES += faad.c
    LIBS += -lfaad
}
    
contains( CONFIG_VORBIS, yes ) {
     SOURCES += oggvorbis.c
}

contains( TARGET_GPROF, yes ) {
    QMAKE_CFLAGS_RELEASE += -p
    QMAKE_LFLAGS_RELEASE += -p
}

contains( TARGET_MMX, yes ) {
    SOURCES += i386/fdct_mmx.c i386/cputest.c i386/dsputil_mmx.c
    SOURCES += i386/mpegvideo_mmx.c i386/idct_mmx.c i386/motion_est_mmx.c
    SOURCES += i386/simple_idct_mmx.c i386/fft_sse.c
#    contains( TARGET_BUILTIN_VECTOR, yes ) {
#        QMAKE_CFLAGS_RELEASE += -msse
#        QMAKE_CFLAGS_DEBUG += -msse
#    }
}

#contains( CONFIG_PP, yes ) {
#    SOURCES += libpostproc/postprocess.c
#}

contains( TARGET_ARCH_ARMV4L, yes ) {
    SOURCES += armv4l/jrevdct_arm.S armv4l/dsputil_arm.c
}

contains( HAVE_MLIB, yes ) {
    OBJS += mlib/dsputil_mlib.c
    QMAKE_CFLAGS_RELEASE += $$MLIB_INC
}

contains( TARGET_ARCH_ALPHA, yes ) {
    OBJS += alpha/dsputil_alpha.c alpha/mpegvideo_alpha.c 
    OBJS += alpha/motion_est_alpha.c alpha/dsputil_alpha_asm.S
    QMAKE_CFLAGS_RELEASE += -fforce-addr -freduce-all-givs
}

contains( TARGET_ARCH_POWERPC, yes ) {
    OBJS += ppc/dsputil_ppc.c ppc/mpegvideo_ppc.c
}

contains( TARGET_ARCH_ALTIVEC, yes ) {
    OBJS += ppc/dsputil_altivec.c ppc/mpegvideo_altivec.c ppc/idct_altivec.c
    QMAKE_CFLAGS_RELEASE += -faltivec
}
