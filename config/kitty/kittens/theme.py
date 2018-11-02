""" Allows a user to select a theme from several conf files """
import sys
from os import listdir
from os.path import expanduser

from kitty.cmds import cmap, parse_subcommand_cli
from kitty.constants import version
from kitty.remote_control import encode_send, parse_rc_args
from kitty.key_encoding import ESCAPE, RELEASE, A, B, C, D, E, F, G, H

from kittens.tui.loop import Loop
from kittens.tui.handler import Handler
from kittens.tui.operations import styled

GLOBAL_OPTS = None


class Theme(Handler):
    """ Handles selecting parsing and changing themes """

    print_on_fail = None

    def __init__(self):
        self.global_opts = parse_rc_args(["kitty", "@set-colors", "-a", "-c"])[0]
        self.letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
        self.themes = listdir("/Users/Luke/.config/kitty/colors/")
        self.theme_dict = {}

        for i in range(len(self.themes)):
            self.theme_dict[self.letters[i]] = self.themes[i]

    def initialize(self):
        """ Set vars and call initial function """
        self.draw_screen()

    def draw_screen(self):
        """ Draws the UI """
        self.cmd.clear_screen()
        self.print(styled('Available Colorschemes:', bold=True, fg='gray', fg_intense=True))
        self.print()
        self.print(styled('~/.conf/kitty/colors/..', fg='gray'))
        self.print()
        for i in range(len(self.themes)):
            self.print(
                "  {} {}".format(
                    styled(self.letters[i], fg="green"),
                    styled(self.themes[i].split(".", 1)[0], fg="blue"),
                )
            )
        self.print()
        self.print("{} To quit".format(styled("ESC", fg="red")))

    def on_text(self, text, in_bracketed_paste=False):
        """ Detects if key press is a valid theme """
        text = text.upper()
        if text in "ABCDEFGH":
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
        theme_dir = expanduser("~/.config/kitty/colors")
        theme_path = "%s/%s" % (theme_dir, theme_name)
        cmdline = [set_colors.name, "-a", "-c", theme_path]
        opts, items = parse_subcommand_cli(set_colors, cmdline)
        payload = set_colors(self.global_opts, opts, items)
        send = {
            "cmd": set_colors.name,
            "version": version,
            "payload": payload,
            "no_response": False,
        }
        self.write(encode_send(send))


def main(args):
    """ Entry point of the script """
    loop = Loop()
    handler = Theme()
    loop.loop(handler)
    if handler.print_on_fail:
        print(handler.print_on_fail, file=sys.stderr)
        input("Press Enter to quit")
    raise SystemExit(loop.return_code)
