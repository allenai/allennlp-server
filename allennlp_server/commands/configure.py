"""
The ``configure`` subcommand launches a webapp that helps you generate an AllenNLP configuration file.

    $ allennlp configure --help
    usage: allennlp configure [-h] [--host HOST] [-p PORT]
                              [--include-package INCLUDE_PACKAGE]

    Run a config explorer for allennlp.

    optional arguments:
      -h, --help            show this help message and exit
      --host HOST           interface to serve the wizard on (default = 127.0.0.1)
      -p PORT, --port PORT  port to serve the wizard on (default = 8123)
      --include-package INCLUDE_PACKAGE
                            additional packages to include
"""

import argparse

from allennlp.commands import Subcommand
from flask_cors import CORS
from gevent.pywsgi import WSGIServer

from allennlp_server.config_explorer import make_app


@Subcommand.register("configure")
class Configure(Subcommand):
    def add_subparser(self, parser: argparse._SubParsersAction) -> argparse.ArgumentParser:
        description = """Run a config explorer for allennlp."""
        subparser = parser.add_parser(
            self.name, description=description, help="Run a config explorer for allennlp.",
        )

        subparser.add_argument(
            "--host", type=str, default="127.0.0.1", help="interface to serve the wizard on",
        )

        subparser.add_argument(
            "-p", "--port", type=int, default=8123, help="port to serve the wizard on"
        )

        subparser.set_defaults(func=run_wizard)

        return subparser


def run_wizard(args: argparse.Namespace) -> None:
    app = make_app()
    CORS(app)

    http_server = WSGIServer((args.host, args.port), app)
    print(f"serving Config Explorer at http://{args.host}:{args.port}")
    http_server.serve_forever()
