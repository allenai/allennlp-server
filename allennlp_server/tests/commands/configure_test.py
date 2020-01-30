import io
import sys
from contextlib import redirect_stdout

from allennlp.commands import main
from allennlp.common.testing import AllenNlpTestCase


class TestConfigure(AllenNlpTestCase):
    def test_subcommand_plugin_is_available(self):
        # Test originally copied from
        # `allennlp_server.tests.commands.server_simple.TestSimpleServer.\
        # test_subcommand_plugin_is_available`.

        sys.argv = ["allennlp"]

        with io.StringIO() as buf, redirect_stdout(buf):
            main()
            output = buf.getvalue()

        self.assertIn("    configure", output)
