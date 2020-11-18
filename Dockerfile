# This Dockerfile creates an environment suitable for downstream usage of AllenNLP.
# It creates an environment that includes a pip installation of allennlp-server.

FROM allennlp/allennlp:latest

WORKDIR /stage/allennlp-server

# Copy select files needed for installing requirements.
# We only copy what we need here so small changes to the repository does not trigger re-installation of the requirements.
COPY setup.cfg .
COPY setup.py .
COPY README.md .
RUN pip install -e .
# TODO(epwalsh): In PyTorch 1.7, dataclasses is an unconditional dependency, when it should
# only be a conditional dependency for Python < 3.7.
# This has been fixed on PyTorch master branch, so we should be able to
# remove this check with the next PyTorch release.
RUN pip uninstall -y dataclasses

COPY allennlp_server/ allennlp_server/

RUN pip install --no-deps -e .

EXPOSE 8000
