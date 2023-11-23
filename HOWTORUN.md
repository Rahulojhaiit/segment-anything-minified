docker run -v "$(pwd)/foo:/app/data" segment-anything python scripts/amg.py --checkpoint /app/sam_vit_b.pth --model-type vit_b --input /app/data/dogs.jpg --output /app/data --device cpu
