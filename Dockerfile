# This Dockerfile creates an environment suitable for downstream usage of AllenNLP.
# It creates an environment that includes a pip installation of allennlp.

FROM python:3.6.10-stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /stage/allennlp

# Copy select files needed for installing requirements.
# We only copy what we need here so small changes to the repository does not trigger re-installation of the requirements.
COPY setup.py .
COPY README.md .
RUN pip install -e .

COPY dev-requirements.txt dev-requirements.txt
RUN pip install -r requirements.txt

COPY allennlp_server allennlp-server/

RUN pip install -e .

LABEL maintainer="allennlp-contact@allenai.org"


ENTRYPOINT ["python", "configure.py"]
