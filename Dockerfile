# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.4-base

# build-time tokens for gated downloads — never baked into final image.
# pass via: docker build --build-arg HF_TOKEN=$HF_TOKEN ...
ARG HF_TOKEN=""

# 1. 기존 comfy-cli 설치 방식 대신, 수동으로 깃허론 클론하고 요구 패키지를 확실하게 설치!
RUN git clone https://github.com/city96/ComfyUI-GGUF.git /comfyui/custom_nodes/ComfyUI-GGUF && \
    cd /comfyui/custom_nodes/ComfyUI-GGUF && \
    pip install -r requirements.txt

# 2. 용량과 빌드 시간을 잡아먹던 'RUN BACKOFFS...' 모델 다운로드 5줄은 모두 삭제했습니다.
# (네트워크 볼륨에 있는 모델을 그대로 사용합니다)
