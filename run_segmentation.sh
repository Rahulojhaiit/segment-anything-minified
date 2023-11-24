#!/bin/bash
# $1: Model name e.g. (sam_vit_b.pth), $2: Model type, $3: Image filename $4: Device Arg
DEVICE_ARG=""
if [ ! -z "$4" ]; then
    DEVICE_ARG="--device $4"
fi

python scripts/amg.py --checkpoint /app/$1 --model-type $2 --input /app/data/$3 --output /app/data $DEVICE_ARG
