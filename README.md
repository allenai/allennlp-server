# AllenNLP Config Explorer and Simple Server

This repo contains a config explorer for interactively building AllenNLP configuration files, as well as a simple demo server for serving a model.  To file an issue, please open a ticket on https://github.com/allenai/allennlp and tag it with "Server".

## Installation

### Installing from source

You can also install AllenNLP Server by cloning our git repository:

```bash
git clone https://github.com/allenai/allennlp-server
```

Create a Python 3.7 virtual environment, and install AllenNLP Server in `editable` mode by running:

```bash
pip install --editable .
```

## Running AllenNLP Server

AllenNLP Server is a plugin for AllenNLP, so new subcommands will be added to it.

To run the configuration explorer, see:

```bash
allennlp configure --help
```

To run the simple demo server, see:

```bash
allennlp serve --help
```
