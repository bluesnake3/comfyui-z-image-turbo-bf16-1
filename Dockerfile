FROM runpod/worker-comfyui:5.8.4-base

COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
