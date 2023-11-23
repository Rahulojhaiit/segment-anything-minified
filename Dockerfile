FROM python:3.8

WORKDIR /app

COPY segment_anything/ segment_anything/
COPY setup.py .
COPY scripts/ scripts/
# COPY sam_vit_l.pth .
COPY sam_vit_b.pth .
# COPY sam_vit_h.pth .
RUN pip install --no-cache-dir .[all]
RUN pip install torch torchvision
RUN apt-get update && apt-get install -y libgl1





