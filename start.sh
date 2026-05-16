#!/bin/bash

mkdir -p /comfyui/custom_nodes

for dir in /runpod-volume/custom_nodes/*; do
    name=$(basename "$dir")

    ln -sf "$dir" "/comfyui/custom_nodes/$name"
done

python /start.py
