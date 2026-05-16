FROM runpod/worker-comfyui:5.8.4-base

RUN git clone https://github.com/city96/ComfyUI-GGUF.git /comfyui/custom_nodes/ComfyUI-GGUF && \
    cd /comfyui/custom_nodes/ComfyUI-GGUF && \
    pip install -r requirements.txt
