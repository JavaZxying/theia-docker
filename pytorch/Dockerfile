#FROM jupyter/minimal-notebook:latest
#
#ENV TZ='Asia/Shanghai'
#
#RUN mkdir -p $HOME/.jupyter/custom
#RUN conda activate cling
#RUN conda install xeus-cling -c conda-forge
#
#COPY --chown=jovyan:users [ "./src/jp_dataset_browser-0.1.0-py3-none-any.whl", "/opt" ]
#RUN pip install /opt/jp_dataset_browser-0.1.0-py3-none-any.whl
#
#COPY --chown=jovyan:users [ "./src/custom.css", "$HOME/.jupyter/custom" ]
#COPY --chown=jovyan:users [ "./src/custom.js", "$HOME/.jupyter/custom" ]
#COPY --chown=jovyan:users [ "./src/jupyter_notebook_config.py", "$HOME/.jupyter" ]
#
FROM jupyter/datascience-notebook:ubuntu-22.04

ENV TZ='Asia/Shanghai'

# Install PyTorch and related packages
RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia

# Install JupyterLab extensions
RUN conda install -c conda-forge jupyterlab && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyterlab-plotly && \
    jupyter labextension install plotlywidget && \
    jupyter labextension install @bokeh/jupyter_bokeh && \
    jupyter labextension install @pyviz/jupyterlab_pyviz && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @jupyterlab/git && \
    jupyter labextension install @jupyterlab/github && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_git && \
    jupyter lab clean && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging

COPY --chown=jovyan:users [ "./src/jp_dataset_browser-0.1.0-py3-none-any.whl", "/opt" ]
RUN pip install /opt/jp_dataset_browser-0.1.0-py3-none-any.whl

COPY --chown=jovyan:users [ "./src/custom.css", "$HOME/.jupyter/custom" ]
COPY --chown=jovyan:users [ "./src/custom.js", "$HOME/.jupyter/custom" ]
COPY --chown=jovyan:users [ "./src/jupyter_notebook_config.py", "$HOME/.jupyter" ]
