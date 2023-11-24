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

3. To run the Docker container and process an image, use the following command format:

docker run -v "$(pwd)/{image_folder_name}:/app/data" segment-anything ./run_segmentation.sh {model_path} {model_name} {image_name} {device}

Where:

- `{image_folder_name}` is the name of the folder in your current working directory containing the images (e.g. 'foo').
- `{model_path}` is the path to the model file being used (e.g. 'sam_vit_b.pth').
- `{model_name}` is the name of the model (e.g. 'vit_b').
- `{image_name}` is the filename of the image inside the `{image_folder_name}` on which the model will perform segmentation.(e.g. 'dogs.jpg')
- `{device}` is the optional device parameter, and empty parameter sets default to 'cuda', value 'cpu' can be used where CUDA is not available.

Here's an example command (I am using `cpu` because my host machine, apple M1 doesn't support CUDA.):

```
docker run -v "$(pwd)/foo:/app/data" segment-anything ./run_segmentation.sh sam_vit_b.pth vit_b dogs.jpg cpu
```

The name of the model checkpoint and path can be changed as needed. I have tested the script against base model, sam_vit_b.pth resulting in output generation in around 3 minutes,(the other large and huge models were crashing my system due to memory limitations of my host machine)
The docker image size for base model is 1.51 GB
