FROM quay.io/modh/cuda-notebooks:cuda-jupyter-tensorflow-ubi8-python-3.8-2023a-20231030-3e71410	

RUN pip install pip==22.3.1 setuptools==65.3.0

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    chmod -R g+w /opt/app-root/lib/python3.9/site-packages && \
    fix-permissions /opt/app-root -P
