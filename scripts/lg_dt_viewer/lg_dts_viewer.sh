#guilbert.lee@lge.com Mon 28 Jan 2013
#lg dts viewer

#!/bin/sh

DTS_PATH=$1
WORK_PATH=${0%/*}

if [ "$DTS_PATH" = "" ]
then
    echo "usage : ./lg_dts_viewer.sh [dts path]"

    echo "dts path : path of dts file"
    echo "ex(in Kernel root) :  ./scripts/lg_dt_viewer/\
lg_dts_viewer.sh arch/arm/boot/dts/msm8x26-lgps14/msm8x26-lgps14.dts"
    exit
fi

DTS_NAME=${DTS_PATH##*/}

if [ "$DTS_NAME" = "" ]
then
   echo "usage : Invaild DTS path, Cannot find *.dts file"
   exit
fi

OUT_PATH=${DTS_NAME/%.dts/}
OUT_PATH=out_$OUT_PATH
if [ ! -d "$OUT_PATH" ] ; then
	mkdir $OUT_PATH
fi

${WORK_PATH}/lg_dtc -o $OUT_PATH/$DTS_NAME\
 -D -I dts -O dts -H specific -s ./$DTS_PATH
${WORK_PATH}/lg_dtc -o $OUT_PATH/$DTS_NAME.2\
 -D -I dts -O dts -H specific2 -s ./$DTS_PATH
