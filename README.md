# Segment Anything Model Docker Setup

## Model Checkpoints

Before using the model, download and rename the model checkpoints. Place them in the base directory:

- For the ViT-H model: `sam_vit_h.pth` - [Download here](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth)
- For the ViT-L model: `sam_vit_l.pth` - [Download here](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_l_0b3195.pth)
- For the ViT-B model: `sam_vit_b.pth` - [Download here](https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth)

Copy the required model into the Docker image as specified in the Dockerfile.

## Running the Docker Container

1. Ensure Docker is operational on your system.
2. Build the Docker image:

```
   docker build -t segment-anything .
```

3. Run the model using the Docker container. Here's an example command (I am using `--device cpu` as apple M1 doesn't support CUDA.):

```
docker run -v "$(pwd)/foo:/app/data" segment-anything python scripts/amg.py --checkpoint /app/sam_vit_b.pth --model-type vit_b --input /app/data/dogs.jpg --output /app/data --device cpu
```

The name of the model checkpoint and path can be changed as needed. I have tested the script against base model on my system (the other large and huge models were crashing my system due to memory limitations of my host machine)
