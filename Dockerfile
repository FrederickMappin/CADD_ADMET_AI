FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Create conda environment and install dependencies
RUN conda create -y -n admet_ai python=3.10 && \
    /bin/bash -c "source activate admet_ai && pip install admet-ai"

# Set the PATH so the environment is available in subsequent commands
ENV PATH ="/opt/conda/envs/admet_ai/bin:$PATH"

# Copy your application code into the container (assuming `admet_predict` is part of the repo)
COPY . /app

# Set the entrypoint to ensure the conda environment is activated
ENTRYPOINT ["/bin/bash", "-c", "source activate admet_ai && exec \"$@\"", "--"]