import argparse
import io
from typing import Dict, Type

import pkg_resources
from allennlp.commands import create_parser
from allennlp.common.testing import AllenNlpTestCase


def get_available_plugins() -> Dict[str, Type]:
    return {
        entry_point.name: entry_point.load()
        for entry_point in pkg_resources.iter_entry_points("allennlp.plugins")
    }


def parser_help(parser: argparse.ArgumentParser) -> str:
    with io.StringIO() as file_:
        parser.print_help(file_)
        file_.seek(0)
        return file_.read()


class TestPlugin(AllenNlpTestCase):
    # Remember to install this package (`pip install -e .`) before running this file tests.

    def test_plugin_is_available(self):
        self.assertIn(
            "allennlp-server",
            get_available_plugins(),
            "allennlp-server plugin was not found as a registered plugin in allennlp.plugins",
        )

    def test_subcommands_are_available(self):
        parser = create_parser("allennlp")
        allennlp_command_help = parser_help(parser)

        for subcommand in {"configure", "serve"}:
            self.assertIn(
                "    " + subcommand,
                allennlp_command_help,
                f"Subcommand '{subcommand}' was not found in `allennlp --help`",
            )
