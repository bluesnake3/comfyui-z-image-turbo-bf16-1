#!/bin/bash

echo "Install runtime python packages"

if [ -f "/runpod-volume/requirements.txt" ]; then
    pip install -r /runpod-volume/requirements.txt
fi

echo "Link custom nodes"

mkdir -p /comfyui/custom_nodes

for dir in /runpod-volume/custom_nodes/*; do
    if [ -d "$dir" ]; then

        name=$(basename "$dir")

        ln -sf "$dir" "/comfyui/custom_nodes/$name"
    fi
done

echo "Start worker"

python /start.py
