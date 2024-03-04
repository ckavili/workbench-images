FROM quay.io/modh/cuda-notebooks@sha256:d39aa8d91224f2c9265c18036149fbc8d3439f22ed7554f717752b0828494b7d

USER 0

RUN curl -L https://rpmfind.net/linux/centos-stream/9-stream/AppStream/x86_64/os/Packages/graphviz-2.44.0-26.el9.x86_64.rpm -o graphviz-2.44.0-26.el9.x86_64.rpm && \
    dnf install -y graphviz-2.44.0-26.el9.x86_64.rpm && \
    dnf clean all

USER 1001 

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt && \
    chmod -R g+w /opt/app-root/lib/python3.9/site-packages && \
    fix-permissions /opt/app-root -P
