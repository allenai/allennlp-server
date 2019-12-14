# This Dockerfile creates an environment suitable for downstream usage of AllenNLP.
# It creates an environment that includes a pip installation of allennlp.

FROM python:3.6.8-stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /stage/allennlp

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY server_simple.py server_simple.py
COPY config_explorer.py config_explorer.py
COPY config_explorer.html config_explorer.html

LABEL maintainer="allennlp-contact@allenai.org"


ENTRYPOINT ["/bin/bash"]
