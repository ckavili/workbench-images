FROM quay.io/modh/cuda-notebooks@sha256:d39aa8d91224f2c9265c18036149fbc8d3439f22ed7554f717752b0828494b7d

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    chmod -R g+w /opt/app-root/lib/python3.9/site-packages && \
    fix-permissions /opt/app-root -P
