FROM jupyter/minimal-notebook:ubuntu-22.04

ENV TZ='Asia/Shanghai'

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install JupyterLab extensions
RUN pip install jupyterlab

COPY --chown=jovyan:users [ "./src/jp_dataset_browser-0.1.0-py3-none-any.whl", "/opt" ]

RUN pip install /opt/jp_dataset_browser-0.1.0-py3-none-any.whl

COPY --chown=jovyan:users [ "./src/custom.css", "$HOME/.jupyter/custom" ]
COPY --chown=jovyan:users [ "./src/custom.js", "$HOME/.jupyter/custom" ]
COPY --chown=jovyan:users [ "./src/jupyter_notebook_config.py", "$HOME/.jupyter" ]
