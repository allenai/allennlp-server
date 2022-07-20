<div align="center">
    <br>
    <a href="https://github.com/allenai/allennlp">
    <img src="https://raw.githubusercontent.com/allenai/allennlp/main/docs/img/allennlp-logo-dark.png" width="400"/>
    </a>
    <br>
    <br>
    <p>
    A demo server for AllenNLP models.
    </p>
    <hr/>
</div>
<p align="center">
    <a href="https://github.com/allenai/allennlp-server/actions">
        <img alt="Build" src="https://github.com/allenai/allennlp-server/workflows/CI/badge.svg?event=push&branch=master">
    </a>
    <a href="https://pypi.org/project/allennlp-server/">
        <img alt="PyPI" src="https://img.shields.io/pypi/v/allennlp-server">
    </a>
    <a href="https://github.com/agururajvais/allennlp-server/blob/master/LICENSE">
        <img alt="License" src="https://img.shields.io/github/license/allenai/allennlp-server?color=blue&cachedrop">
    </a>
    <br/>
</p>
<br/>

<div align="center">
❗️ To file an issue, please open a ticket on <a href="https://github.com/allenai/allennlp/issues/new/choose">allenai/allennlp</a> and tag it with "Server". ❗️
</div>

##  Installation

### From PyPI

`allennlp-server` is available on PyPI. To install with `pip`, just run

```bash
pip install allennlp-server
```

Note that the `allennlp-server` package is tied to the [`allennlp` core package](https://pypi.org/project/allennlp) and [`allennlp-models` package](https://pypi.org/project/allennlp-models). Therefore when you install the server package you will get the latest compatible version of `allennlp` and `allennlp-models` (if you haven't already installed `allennlp` or `allennlp-models`). For example,

```bash
pip install allennlp-server
pip freeze | grep allennlp
# > allennlp==2.2.0
# > allennlp-models==2.2.0
# > allennlp-server==1.0.0
```

### From source

You can install AllenNLP Server by cloning our git repository:

```bash
git clone https://github.com/allenai/allennlp-server
```

Create a Python 3.8 virtual environment, and install AllenNLP Server in `editable` mode by running:

```bash
pip install --editable .
```

## Running AllenNLP Server

AllenNLP Server is a plugin for AllenNLP which adds a "serve" subcommand:

```bash
allennlp serve --help
```
