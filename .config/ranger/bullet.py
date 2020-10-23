from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *


class Default(ColorScheme):
    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                fg = blue
                attr = bold | underline
            else:
                attr = normal
            if context.empty or context.error:
                fg = black
            if context.border:
                attr = normal
                fg = default
            if context.media:
                if context.image:
                    fg = white
                else:
                    fg = yellow
            if context.container:
                attr |= normal
                fg = green
            if context.directory:
                attr |= normal
                fg = magenta
                # fg = blue
            elif context.executable and not \
                any((context.media, context.container,
                     context.fifo, context.socket)):
                attr |= bold
                fg = blue
                # fg = green
            if context.socket:
                fg = black
            if context.fifo or context.device:
                fg = blue
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and white or blue
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (blue, white):
                    fg = black
                else:
                    fg = green
            if not context.selected and (context.cut or context.copied):
                fg = black
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= normal
                if context.marked:
                    attr |= underline
                    fg = white
            if context.badinfo:
                if attr & reverse:
                    bg = blue
                else:
                    fg = blue

        elif context.in_titlebar:
            attr |= normal
            if context.hostname:
                attr |= normal
                fg = blue
            elif context.directory:
                fg = green
            elif context.tab:
                if context.good:
                    bg = white
            elif context.link:
                fg = green

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = white
                elif context.bad:
                    fg = blue
            if context.marked:
                attr |= bold | reverse
                fg = yellow
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = blue

        if context.text:
            if context.highlight:
                attr |= bold

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= normal

        return fg, bg, attr
