""" Allows a user to select a theme from several conf files """
import sys
import string
from os.path import join, expanduser
import glob

from kitty.cli import parse_args
from kitty.cmds import cmap, parse_subcommand_cli
from kitty.constants import version
from kitty.remote_control import encode_send, parse_rc_args
from kitty.key_encoding import ESCAPE, RELEASE

from kittens.tui.loop import Loop
from kittens.tui.handler import Handler
from kittens.tui.operations import styled

GLOBAL_OPTS = None


class Theme(Handler):
    """ Handles selecting parsing and changing themes """

    print_on_fail = None

    def __init__(self, opts):
        self.opts = opts
        self.global_opts = parse_rc_args(["kitty", "@set-colors", "-a", "-c"])[0]
        self.letters = join(string.digits, string.ascii_uppercase)
        self.themes = self.listdir_nohidden(self.opts.theme_path)
        self.available_letters = self.letters[: len(self.themes)]
        self.theme_dict = {}

        for i in range(len(self.themes)):
            self.theme_dict[self.letters[i]] = self.themes[i]

    def listdir_nohidden(self, path):
        """ Get theme dir files, excluding hidden files """
        return glob.glob(join(expanduser(path), "*"))

    def initialize(self):
        """ Set vars and call initial function """
        self.draw_screen()

    def draw_screen(self):
        """ Draws the UI """
        self.cmd.clear_screen()
        self.print(
            styled("Available Colorschemes:", bold=True, fg="gray", fg_intense=True)
        )
        self.print()
        self.print(styled(self.opts.theme_path, fg="gray"))
        self.print()
        for i in range(len(self.themes)):
            self.print(
                "  {} {}".format(
                    styled(self.letters[i], fg="green"),
                    styled(self.themes[i].split("/")[-1].split(".")[0], fg="blue"),
                )
            )
        self.print()
        self.print("{} To quit".format(styled("ESC", fg="red")))

    def on_text(self, text, in_bracketed_paste=False):
        """ Detects if key press is a valid theme """
        text = text.upper()
        if text in self.available_letters:
            self.pick_theme(key=text)

    def on_key(self, key_event):
        """ Listen for key events """
        if key_event.type is RELEASE:
            return
        if key_event.key is ESCAPE:
            self.quit_loop(0)

    def pick_theme(self, key):
        """ Delegate key press to theme name """
        self.change_theme(self.theme_dict[key])

    def change_theme(self, theme_name):
        """ Performs the theme change """
        set_colors = cmap["set-colors"]
        cmdline = [set_colors.name, "-a", "-c", theme_name]
        opts, items = parse_subcommand_cli(set_colors, cmdline)
        payload = set_colors(self.global_opts, opts, items)
        send = {
            "cmd": set_colors.name,
            "version": version,
            "payload": payload,
            "no_response": False,
        }
        self.write(encode_send(send))


OPTIONS = r"""
--theme_path
default=~/.config/kitty/colors/
type=str
""".format


def main(args):
    """ Entry point of the script """
    msg = "Choose a theme"
    try:
        args, items = parse_args(args[1:], OPTIONS, "", msg, "theme_picker")
    except SystemExit as e:
        if e.code != 0:
            print(e.args[0], file=sys.stderr)
            input("Press ESC to quit")
        return
    loop = Loop()
    handler = Theme(args)
    loop.loop(handler)
    if handler.print_on_fail:
        print(handler.print_on_fail, file=sys.stderr)
        input("Press Enter to quit")
    raise SystemExit(loop.return_code)
