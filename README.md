

## AllenNLP Config Explorer and Simple Server

This contains a config explorer for interactively building allennlp configuration files, as well as a simple demo server for serving a model.

## Usage

```
# Install the requirements
pip install -r requirements.txt
# Run the webapp to view the configuration demo
python configure.py

python server_simple.py --help
usage: server_simple.py [-h] --archive-path ARCHIVE_PATH --predictor PREDICTOR
                        [--weights-file WEIGHTS_FILE]
                        [--cuda-device CUDA_DEVICE] [-o OVERRIDES]
                        [--static-dir STATIC_DIR] [--title TITLE]
                        [--field-name FIELD_NAME] [--port PORT]
                        [--include-package INCLUDE_PACKAGE]

```
