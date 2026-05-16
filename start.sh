#!/bin/bash

echo "Activate persistent venv"

source /runpod-volume/venv/bin/activate

echo "Link custom nodes"

mkdir -p /comfyui/custom_nodes

for dir in /runpod-volume/custom_nodes/*; do
    name=$(basename "$dir")

    ln -sf "$dir" "/comfyui/custom_nodes/$name"
done

echo "Start ComfyUI worker"

python /start.py
