# This Dockerfile creates an environment suitable for downstream usage of AllenNLP.
# It creates an environment that includes a pip installation of allennlp-server.

FROM python:3.6-stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV PATH /usr/local/nvidia/bin/:$PATH
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

# Tell nvidia-docker the driver spec that we need as well as to
# use all available devices, which are mounted at /usr/local/nvidia.
# The LABEL supports an older version of nvidia-docker, the env
# variables a newer one.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
LABEL com.nvidia.volumes.needed="nvidia_driver"

WORKDIR /stage/allennlp-server

# Copy select files needed for installing requirements.
# We only copy what we need here so small changes to the repository does not trigger re-installation of the requirements.
COPY setup.cfg .
COPY setup.py .
COPY README.md .
RUN pip install -e .

COPY dev-requirements.txt dev-requirements.txt
RUN pip install -r dev-requirements.txt

COPY allennlp_server/ allennlp_server/

RUN pip install -e .

LABEL maintainer="allennlp-contact@allenai.org"

EXPOSE 8000
EXPOSE 8123
CMD ["/bin/bash"]
