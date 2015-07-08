#!/sbin/sh
#
# This leverages the loki_patch utility created by djrbliss
# See here for more information on loki: https://github.com/djrbliss/loki
#

export C=/tmp/loki_tmpdir

image=$1

mkdir -p $C
dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=$C/aboot.img
/tmp/loki/loki_patch $image $C/aboot.img /tmp/$image.img $C/$image.lok || exit 1
/tmp/loki/loki_flash $image $C/$image.lok || exit 1
rm -rf $C
rm -rf /tmp/loki
exit 0
