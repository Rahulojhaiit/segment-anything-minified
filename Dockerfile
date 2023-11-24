FROM python:3.8-slim

WORKDIR /app

COPY segment_anything/ segment_anything/
COPY scripts/ scripts/
COPY setup.py run_segmentation.sh ./
RUN chmod +x run_segmentation.sh

# COPY WHICHEVER MODEL THERE IS TO BE USED IN THE DOCKER

COPY sam_vit_b.pth .
# COPY sam_vit_l.pth .
# COPY sam_vit_h.pth .

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir .[all] torch torchvision






