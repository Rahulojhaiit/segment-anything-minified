The model checkpoint to be used should be downloaded at put in the base folder first and renamed to:

- `sam_vit_h.pth`: [ViT-H SAM model.](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth)\*\*
- `sam_vit_l.pth`: [ViT-L SAM model.](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_l_0b3195.pth)
- `sam_vit_b.pth`: [ViT-B SAM model.](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth)

Accordingly the Model is to be copied in Image via docker configuration (see DockerFile).

Next Step:

1. Ensure docker is running
2. docker build -t segment-anything .
3. Run the script below (I am using --device cpu because my local machine with apple M1 doesn't support CUDA.)
   The name of the model checkpoint and path can be changed as per use. I have tested the script against base model on my system (the other large and huge models were crashing my system due to memory limitations)

docker run -v "$(pwd)/foo:/app/data" segment-anything python scripts/amg.py --checkpoint /app/sam_vit_b.pth --model-type vit_b --input /app/data/dogs.jpg --output /app/data --device cpu
