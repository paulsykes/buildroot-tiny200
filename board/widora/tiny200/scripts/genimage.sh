#!/bin/bash
set -e
SELFDIR=`dirname \`realpath ${0}\``

[ $# -eq 2 ] || {
    echo "SYNTAX: $0 <u-boot-with-spl image> <genimage.cfg>"
    echo "Given: $@"
    exit 1
}

${SELFDIR}/mknanduboot.sh ${1}/${2} ${1}/u-boot-sunxi-with-nand-spl.bin
support/scripts/genimage.sh ${1} -c board/widora/tiny200/genimage-sdcard.cfg
support/scripts/genimage.sh ${1} -c board/widora/tiny200/genimage-nor.cfg
support/scripts/genimage.sh ${1} -c board/widora/tiny200/genimage-nand.cfg
support/scripts/genimage.sh ${1} -c board/widora/tiny200/genimage-flasher.cfg
