#!/bin/bash
# $1: Model name e.g. (sam_vit_b.pth), $2: Model type, $3: Image filename
# --device cpu is added for M1 chip without CUDA support
python scripts/amg.py --checkpoint /app/$1 --model-type $2 --input /app/data/$3 --output /app/data --device cpu
