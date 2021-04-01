FROM python:3.8

WORKDIR /stage/allennlp-server

# Copy select files needed for installing requirements.
# We only copy what we need here so small changes to the repository does not trigger re-installation of the requirements.
COPY allennlp_server/version.py allennlp_server/version.py
COPY setup.py .
COPY README.md .
RUN pip install -e .
# TODO(epwalsh): In PyTorch 1.7, dataclasses is an unconditional dependency, when it should
# only be a conditional dependency for Python < 3.7.
# This has been fixed on PyTorch master branch, so we should be able to
# remove this check with the next PyTorch release.
# RUN pip uninstall -y dataclasses

# Now copy source files and re-install the package without dependencies.
COPY allennlp_server/ allennlp_server/
RUN pip install --no-deps -e .

EXPOSE 8000

ENTRYPOINT ["allennlp", "serve"]
