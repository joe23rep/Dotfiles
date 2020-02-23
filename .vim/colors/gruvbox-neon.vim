" -----------------------------------------------------------------------------
" File: gruvbox-neon.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvbox-neon
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvbox-neon-neon'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvbox-neon_bold')
  let g:gruvbox-neon_bold=1
endif
if !exists('g:gruvbox-neon_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvbox-neon_italic=1
  else
    let g:gruvbox-neon_italic=0
  endif
endif
if !exists('g:gruvbox-neon_undercurl')
  let g:gruvbox-neon_undercurl=1
endif
if !exists('g:gruvbox-neon_underline')
  let g:gruvbox-neon_underline=1
endif
if !exists('g:gruvbox-neon_inverse')
  let g:gruvbox-neon_inverse=1
endif

if !exists('g:gruvbox-neon_guisp_fallback') || index(['fg', 'bg'], g:gruvbox-neon_guisp_fallback) == -1
  let g:gruvbox-neon_guisp_fallback='NONE'
endif

if !exists('g:gruvbox-neon_improved_strings')
  let g:gruvbox-neon_improved_strings=0
endif

if !exists('g:gruvbox-neon_improved_warnings')
  let g:gruvbox-neon_improved_warnings=0
endif

if !exists('g:gruvbox-neon_termcolors')
  let g:gruvbox-neon_termcolors=256
endif

if !exists('g:gruvbox-neon_invert_indent_guides')
  let g:gruvbox-neon_invert_indent_guides=0
endif

if exists('g:gruvbox-neon_contrast')
  echo 'g:gruvbox-neon_contrast is deprecated; use g:gruvbox-neon_contrast_light and g:gruvbox-neon_contrast_dark instead'
endif

if !exists('g:gruvbox-neon_contrast_dark')
  let g:gruvbox-neon_contrast_dark='medium'
endif

if !exists('g:gruvbox-neon_contrast_light')
  let g:gruvbox-neon_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#000000', 234]     " 29-32-33
let s:gb.dark0       = ['#000000', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#0c0d10', 236]     " 50-48-47
let s:gb.dark1       = ['#0c0d10', 237]     " 60-56-54
let s:gb.dark2       = ['#292c33', 239]     " 80-73-69
let s:gb.dark3       = ['#292c33', 241]     " 102-92-84
let s:gb.dark4       = ['#616e88', 243]     " 124-111-100
let s:gb.dark4_256   = ['#616e88', 243]     " 124-111-100

let s:gb.gray_245    = ['#616e88', 245]     " 146-131-116
let s:gb.gray_244    = ['#616e88', 244]     " 146-131-116

let s:gb.light0_hard = ['#d4fdf6', 230]     " 249-245-215
let s:gb.light0      = ['#d4faf4', 229]     " 253-244-193
let s:gb.light0_soft = ['#d4feff', 228]     " 242-229-188
let s:gb.light1      = ['#d4fdf6', 223]     " 235-219-178
let s:gb.light2      = ['#d4faf4', 250]     " 213-196-161
let s:gb.light3      = ['#d4feff', 248]     " 189-174-147
let s:gb.light4      = ['#d4fafd', 246]     " 168-153-132
let s:gb.light4_256  = ['#d4f4fd', 246]     " 168-153-132

let s:gb.bright_red     = ['#8400ff', 167]     " 251-73-52
let s:gb.bright_green   = ['#00eeff', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#00ff9b', 214]     " 250-189-47
let s:gb.bright_blue    = ['#adffff', 109]     " 131-165-152
let s:gb.bright_purple  = ['#aaaaff', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#3daee9', 108]     " 142-192-124
let s:gb.bright_orange  = ['#9eddff', 208]     " 254-128-25

let s:gb.neutral_red    = ['#a040ff', 124]     " 204-36-29
let s:gb.neutral_green  = ['#0bffef', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#1affa0', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#c6fffb', 66]      " 69-133-136
let s:gb.neutral_purple = ['#c2c2ff', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#4cb2e9', 72]      " 104-157-106
let s:gb.neutral_orange = ['#b0e1ff', 166]     " 214-93-14

let s:gb.faded_red      = ['#b265ff', 88]      " 157-0-6
let s:gb.faded_green    = ['#41e1ff', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#34ffbc', 136]     " 181-118-20
let s:gb.faded_blue     = ['#cefffe', 24]      " 7-102-120
let s:gb.faded_purple   = ['#cfcdff', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#58b2e9', 66]      " 66-123-88
let s:gb.faded_orange   = ['#c9ebff', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvbox-neon_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvbox-neon_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvbox-neon_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvbox-neon_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvbox-neon_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:gruvbox-neon_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:gruvbox-neon_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:gruvbox-neon_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:gruvbox-neon_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:gruvbox-neon_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvbox-neon_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvbox-neon_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvbox-neon_number_column')
  let s:number_column = get(s:gb, g:gruvbox-neon_number_column)
endif

let s:sign_column = s:bg0

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvbox-neon_sign_column')
    let s:sign_column = get(s:gb, g:gruvbox-neon_sign_column)
  endif
endif

let s:color_column = s:bg0
if exists('g:gruvbox-neon_color_column')
  let s:color_column = get(s:gb, g:gruvbox-neon_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvbox-neon_vert_split')
  let s:vert_split = get(s:gb, g:gruvbox-neon_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvbox-neon_invert_signs')
  if g:gruvbox-neon_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvbox-neon_invert_selection')
  if g:gruvbox-neon_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvbox-neon_invert_tabline')
  if g:gruvbox-neon_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvbox-neon_italicize_comments')
  if g:gruvbox-neon_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvbox-neon_italicize_strings')
  if g:gruvbox-neon_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox-neon_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox-neon_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" gruvbox-neon Hi Groups: {{{

" memoize common hi groups
call s:HL('gruvbox-neonFg0', s:fg0)
call s:HL('gruvbox-neonFg1', s:fg1)
call s:HL('gruvbox-neonFg2', s:fg2)
call s:HL('gruvbox-neonFg3', s:fg3)
call s:HL('gruvbox-neonFg4', s:fg4)
call s:HL('gruvbox-neonGray', s:gray)
call s:HL('gruvbox-neonBg0', s:bg0)
call s:HL('gruvbox-neonBg1', s:bg1)
call s:HL('gruvbox-neonBg2', s:bg2)
call s:HL('gruvbox-neonBg3', s:bg3)
call s:HL('gruvbox-neonBg4', s:bg4)

call s:HL('gruvbox-neonRed', s:red)
call s:HL('gruvbox-neonRedBold', s:red, s:none, s:bold)
call s:HL('gruvbox-neonGreen', s:green)
call s:HL('gruvbox-neonGreenBold', s:green, s:none, s:bold)
call s:HL('gruvbox-neonYellow', s:yellow)
call s:HL('gruvbox-neonYellowBold', s:yellow, s:none, s:bold)
call s:HL('gruvbox-neonBlue', s:blue)
call s:HL('gruvbox-neonBlueBold', s:blue, s:none, s:bold)
call s:HL('gruvbox-neonPurple', s:purple)
call s:HL('gruvbox-neonPurpleBold', s:purple, s:none, s:bold)
call s:HL('gruvbox-neonAqua', s:aqua)
call s:HL('gruvbox-neonAquaBold', s:aqua, s:none, s:bold)
call s:HL('gruvbox-neonOrange', s:orange)
call s:HL('gruvbox-neonOrangeBold', s:orange, s:none, s:bold)

call s:HL('gruvbox-neonRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('gruvbox-neonGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('gruvbox-neonYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('gruvbox-neonBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('gruvbox-neonPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('gruvbox-neonAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox-neon/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:green, s:bg1)
endif

hi! link NonText gruvbox-neonBg2
hi! link SpecialKey gruvbox-neonBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory gruvbox-neonGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title gruvbox-neonGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg gruvbox-neonYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg gruvbox-neonYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question gruvbox-neonOrangeBold
" Warning messages
hi! link WarningMsg gruvbox-neonRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvbox-neon_improved_strings == 0
  hi! link Special gruvbox-neonOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement gruvbox-neonRed
" if, then, else, endif, swicth, etc.
hi! link Conditional gruvbox-neonRed
" for, do, while, etc.
hi! link Repeat gruvbox-neonRed
" case, default, etc.
hi! link Label gruvbox-neonRed
" try, catch, throw
hi! link Exception gruvbox-neonRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword gruvbox-neonRed

" Variable name
hi! link Identifier gruvbox-neonBlue
" Function name
hi! link Function gruvbox-neonGreenBold

" Generic preprocessor
hi! link PreProc gruvbox-neonAqua
" Preprocessor #include
hi! link Include gruvbox-neonAqua
" Preprocessor #define
hi! link Define gruvbox-neonAqua
" Same as Define
hi! link Macro gruvbox-neonAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit gruvbox-neonAqua

" Generic constant
hi! link Constant gruvbox-neonPurple
" Character constant: 'c', '/n'
hi! link Character gruvbox-neonPurple
" String constant: "this is a string"
if g:gruvbox-neon_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean gruvbox-neonPurple
" Number constant: 234, 0xff
hi! link Number gruvbox-neonPurple
" Floating point constant: 2.3e10
hi! link Float gruvbox-neonPurple

" Generic type
hi! link Type gruvbox-neonYellow
" static, register, volatile, etc
hi! link StorageClass gruvbox-neonOrange
" struct, union, enum, etc.
hi! link Structure gruvbox-neonAqua
" typedef
hi! link Typedef gruvbox-neonYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvbox-neon_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:gruvbox-neon_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}

" Coc: {{{

hi! link CocErrorSign gruvbox-neonRedSign
hi! link CocHintSign gruvbox-neonAquaSign
hi! link CocInfoSign gruvbox-neonYellowSign
hi! link CocWarningSign gruvbox-neonBlueSign
"
"}}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#00eeff'], ['magenta', '#adffff'],
      \ ['red',  '#8400ff'], ['166',     '#00ff9b']
    \ ]
endif

let g:rainbow_guifgs = [ '#00ff9b', '#8400ff', '#adffff', '#00eeff' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd gruvbox-neonGreenSign
hi! link GitGutterChange gruvbox-neonAquaSign
hi! link GitGutterDelete gruvbox-neonRedSign
hi! link GitGutterChangeDelete gruvbox-neonAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile gruvbox-neonGreen
hi! link gitcommitDiscardedFile gruvbox-neonRed

" }}}
" Signify: {{{

hi! link SignifySignAdd gruvbox-neonGreenSign
hi! link SignifySignChange gruvbox-neonAquaSign
hi! link SignifySignDelete gruvbox-neonRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign gruvbox-neonRedSign
hi! link SyntasticWarningSign gruvbox-neonYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   gruvbox-neonBlueSign
hi! link SignatureMarkerText gruvbox-neonPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl gruvbox-neonBlueSign
hi! link ShowMarksHLu gruvbox-neonBlueSign
hi! link ShowMarksHLo gruvbox-neonBlueSign
hi! link ShowMarksHLm gruvbox-neonBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch gruvbox-neonYellow
hi! link CtrlPNoEntries gruvbox-neonRed
hi! link CtrlPPrtBase gruvbox-neonBg2
hi! link CtrlPPrtCursor gruvbox-neonBlue
hi! link CtrlPLinePre gruvbox-neonBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket gruvbox-neonFg3
hi! link StartifyFile gruvbox-neonFg1
hi! link StartifyNumber gruvbox-neonBlue
hi! link StartifyPath gruvbox-neonGray
hi! link StartifySlash gruvbox-neonGray
hi! link StartifySection gruvbox-neonYellow
hi! link StartifySpecial gruvbox-neonBg2
hi! link StartifyHeader gruvbox-neonOrange
hi! link StartifyFooter gruvbox-neonBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign gruvbox-neonRedSign
hi! link ALEWarningSign gruvbox-neonYellowSign
hi! link ALEInfoSign gruvbox-neonBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail gruvbox-neonAqua
hi! link DirvishArg gruvbox-neonYellow

" }}}
" Netrw: {{{

hi! link netrwDir gruvbox-neonAqua
hi! link netrwClassify gruvbox-neonAqua
hi! link netrwLink gruvbox-neonGray
hi! link netrwSymLink gruvbox-neonFg1
hi! link netrwExe gruvbox-neonYellow
hi! link netrwComment gruvbox-neonGray
hi! link netrwList gruvbox-neonBlue
hi! link netrwHelpCmd gruvbox-neonAqua
hi! link netrwCmdSep gruvbox-neonFg3
hi! link netrwVersion gruvbox-neonGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir gruvbox-neonAqua
hi! link NERDTreeDirSlash gruvbox-neonAqua

hi! link NERDTreeOpenable gruvbox-neonOrange
hi! link NERDTreeClosable gruvbox-neonOrange

hi! link NERDTreeFile gruvbox-neonFg1
hi! link NERDTreeExecFile gruvbox-neonYellow

hi! link NERDTreeUp gruvbox-neonGray
hi! link NERDTreeCWD gruvbox-neonGreen
hi! link NERDTreeHelp gruvbox-neonFg1

hi! link NERDTreeToggleOn gruvbox-neonGreen
hi! link NERDTreeToggleOff gruvbox-neonRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded gruvbox-neonGreen
hi! link diffRemoved gruvbox-neonRed
hi! link diffChanged gruvbox-neonAqua

hi! link diffFile gruvbox-neonOrange
hi! link diffNewFile gruvbox-neonYellow

hi! link diffLine gruvbox-neonBlue

" }}}
" Html: {{{

hi! link htmlTag gruvbox-neonBlue
hi! link htmlEndTag gruvbox-neonBlue

hi! link htmlTagName gruvbox-neonAquaBold
hi! link htmlArg gruvbox-neonAqua

hi! link htmlScriptTag gruvbox-neonPurple
hi! link htmlTagN gruvbox-neonFg1
hi! link htmlSpecialTagName gruvbox-neonAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar gruvbox-neonOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag gruvbox-neonBlue
hi! link xmlEndTag gruvbox-neonBlue
hi! link xmlTagName gruvbox-neonBlue
hi! link xmlEqual gruvbox-neonBlue
hi! link docbkKeyword gruvbox-neonAquaBold

hi! link xmlDocTypeDecl gruvbox-neonGray
hi! link xmlDocTypeKeyword gruvbox-neonPurple
hi! link xmlCdataStart gruvbox-neonGray
hi! link xmlCdataCdata gruvbox-neonPurple
hi! link dtdFunction gruvbox-neonGray
hi! link dtdTagName gruvbox-neonPurple

hi! link xmlAttrib gruvbox-neonAqua
hi! link xmlProcessingDelim gruvbox-neonGray
hi! link dtdParamEntityPunct gruvbox-neonGray
hi! link dtdParamEntityDPunct gruvbox-neonGray
hi! link xmlAttribPunct gruvbox-neonGray

hi! link xmlEntity gruvbox-neonOrange
hi! link xmlEntityPunct gruvbox-neonOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation gruvbox-neonOrange
hi! link vimBracket gruvbox-neonOrange
hi! link vimMapModKey gruvbox-neonOrange
hi! link vimFuncSID gruvbox-neonFg3
hi! link vimSetSep gruvbox-neonFg3
hi! link vimSep gruvbox-neonFg3
hi! link vimContinue gruvbox-neonFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword gruvbox-neonBlue
hi! link clojureCond gruvbox-neonOrange
hi! link clojureSpecial gruvbox-neonOrange
hi! link clojureDefine gruvbox-neonOrange

hi! link clojureFunc gruvbox-neonYellow
hi! link clojureRepeat gruvbox-neonYellow
hi! link clojureCharacter gruvbox-neonAqua
hi! link clojureStringEscape gruvbox-neonAqua
hi! link clojureException gruvbox-neonRed

hi! link clojureRegexp gruvbox-neonAqua
hi! link clojureRegexpEscape gruvbox-neonAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen gruvbox-neonFg3
hi! link clojureAnonArg gruvbox-neonYellow
hi! link clojureVariable gruvbox-neonBlue
hi! link clojureMacro gruvbox-neonOrange

hi! link clojureMeta gruvbox-neonYellow
hi! link clojureDeref gruvbox-neonYellow
hi! link clojureQuote gruvbox-neonYellow
hi! link clojureUnquote gruvbox-neonYellow

" }}}
" C: {{{

hi! link cOperator gruvbox-neonPurple
hi! link cStructure gruvbox-neonOrange

" }}}
" Python: {{{

hi! link pythonBuiltin gruvbox-neonOrange
hi! link pythonBuiltinObj gruvbox-neonOrange
hi! link pythonBuiltinFunc gruvbox-neonOrange
hi! link pythonFunction gruvbox-neonAqua
hi! link pythonDecorator gruvbox-neonRed
hi! link pythonInclude gruvbox-neonBlue
hi! link pythonImport gruvbox-neonBlue
hi! link pythonRun gruvbox-neonBlue
hi! link pythonCoding gruvbox-neonBlue
hi! link pythonOperator gruvbox-neonRed
hi! link pythonException gruvbox-neonRed
hi! link pythonExceptions gruvbox-neonPurple
hi! link pythonBoolean gruvbox-neonPurple
hi! link pythonDot gruvbox-neonFg3
hi! link pythonConditional gruvbox-neonRed
hi! link pythonRepeat gruvbox-neonRed
hi! link pythonDottedName gruvbox-neonGreenBold

" }}}
" CSS: {{{

hi! link cssBraces gruvbox-neonBlue
hi! link cssFunctionName gruvbox-neonYellow
hi! link cssIdentifier gruvbox-neonOrange
hi! link cssClassName gruvbox-neonGreen
hi! link cssColor gruvbox-neonBlue
hi! link cssSelectorOp gruvbox-neonBlue
hi! link cssSelectorOp2 gruvbox-neonBlue
hi! link cssImportant gruvbox-neonGreen
hi! link cssVendor gruvbox-neonFg1

hi! link cssTextProp gruvbox-neonAqua
hi! link cssAnimationProp gruvbox-neonAqua
hi! link cssUIProp gruvbox-neonYellow
hi! link cssTransformProp gruvbox-neonAqua
hi! link cssTransitionProp gruvbox-neonAqua
hi! link cssPrintProp gruvbox-neonAqua
hi! link cssPositioningProp gruvbox-neonYellow
hi! link cssBoxProp gruvbox-neonAqua
hi! link cssFontDescriptorProp gruvbox-neonAqua
hi! link cssFlexibleBoxProp gruvbox-neonAqua
hi! link cssBorderOutlineProp gruvbox-neonAqua
hi! link cssBackgroundProp gruvbox-neonAqua
hi! link cssMarginProp gruvbox-neonAqua
hi! link cssListProp gruvbox-neonAqua
hi! link cssTableProp gruvbox-neonAqua
hi! link cssFontProp gruvbox-neonAqua
hi! link cssPaddingProp gruvbox-neonAqua
hi! link cssDimensionProp gruvbox-neonAqua
hi! link cssRenderProp gruvbox-neonAqua
hi! link cssColorProp gruvbox-neonAqua
hi! link cssGeneratedContentProp gruvbox-neonAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces gruvbox-neonFg1
hi! link javaScriptFunction gruvbox-neonAqua
hi! link javaScriptIdentifier gruvbox-neonRed
hi! link javaScriptMember gruvbox-neonBlue
hi! link javaScriptNumber gruvbox-neonPurple
hi! link javaScriptNull gruvbox-neonPurple
hi! link javaScriptParens gruvbox-neonFg3
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" }}}
" YAJS: {{{

hi! link javascriptImport gruvbox-neonAqua
hi! link javascriptExport gruvbox-neonAqua
hi! link javascriptClassKeyword gruvbox-neonAqua
hi! link javascriptClassExtends gruvbox-neonAqua
hi! link javascriptDefault gruvbox-neonAqua

hi! link javascriptClassName gruvbox-neonYellow
hi! link javascriptClassSuperName gruvbox-neonYellow
hi! link javascriptGlobal gruvbox-neonYellow

hi! link javascriptEndColons gruvbox-neonFg1
hi! link javascriptFuncArg gruvbox-neonFg1
hi! link javascriptGlobalMethod gruvbox-neonFg1
hi! link javascriptNodeGlobal gruvbox-neonFg1
hi! link javascriptBOMWindowProp gruvbox-neonFg1
hi! link javascriptArrayMethod gruvbox-neonFg1
hi! link javascriptArrayStaticMethod gruvbox-neonFg1
hi! link javascriptCacheMethod gruvbox-neonFg1
hi! link javascriptDateMethod gruvbox-neonFg1
hi! link javascriptMathStaticMethod gruvbox-neonFg1

" hi! link javascriptProp gruvbox-neonFg1
hi! link javascriptURLUtilsProp gruvbox-neonFg1
hi! link javascriptBOMNavigatorProp gruvbox-neonFg1
hi! link javascriptDOMDocMethod gruvbox-neonFg1
hi! link javascriptDOMDocProp gruvbox-neonFg1
hi! link javascriptBOMLocationMethod gruvbox-neonFg1
hi! link javascriptBOMWindowMethod gruvbox-neonFg1
hi! link javascriptStringMethod gruvbox-neonFg1

hi! link javascriptVariable gruvbox-neonOrange
" hi! link javascriptVariable gruvbox-neonRed
" hi! link javascriptIdentifier gruvbox-neonOrange
" hi! link javascriptClassSuper gruvbox-neonOrange
hi! link javascriptIdentifier gruvbox-neonOrange
hi! link javascriptClassSuper gruvbox-neonOrange

" hi! link javascriptFuncKeyword gruvbox-neonOrange
" hi! link javascriptAsyncFunc gruvbox-neonOrange
hi! link javascriptFuncKeyword gruvbox-neonAqua
hi! link javascriptAsyncFunc gruvbox-neonAqua
hi! link javascriptClassStatic gruvbox-neonOrange

hi! link javascriptOperator gruvbox-neonRed
hi! link javascriptForOperator gruvbox-neonRed
hi! link javascriptYield gruvbox-neonRed
hi! link javascriptExceptions gruvbox-neonRed
hi! link javascriptMessage gruvbox-neonRed

hi! link javascriptTemplateSB gruvbox-neonAqua
hi! link javascriptTemplateSubstitution gruvbox-neonFg1

" hi! link javascriptLabel gruvbox-neonBlue
" hi! link javascriptObjectLabel gruvbox-neonBlue
" hi! link javascriptPropertyName gruvbox-neonBlue
hi! link javascriptLabel gruvbox-neonFg1
hi! link javascriptObjectLabel gruvbox-neonFg1
hi! link javascriptPropertyName gruvbox-neonFg1

hi! link javascriptLogicSymbols gruvbox-neonFg1
hi! link javascriptArrowFunc gruvbox-neonYellow

hi! link javascriptDocParamName gruvbox-neonFg4
hi! link javascriptDocTags gruvbox-neonFg4
hi! link javascriptDocNotation gruvbox-neonFg4
hi! link javascriptDocParamType gruvbox-neonFg4
hi! link javascriptDocNamedParamType gruvbox-neonFg4

hi! link javascriptBrackets gruvbox-neonFg1
hi! link javascriptDOMElemAttrs gruvbox-neonFg1
hi! link javascriptDOMEventMethod gruvbox-neonFg1
hi! link javascriptDOMNodeMethod gruvbox-neonFg1
hi! link javascriptDOMStorageMethod gruvbox-neonFg1
hi! link javascriptHeadersMethod gruvbox-neonFg1

hi! link javascriptAsyncFuncKeyword gruvbox-neonRed
hi! link javascriptAwaitFuncKeyword gruvbox-neonRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword gruvbox-neonAqua
hi! link jsExtendsKeyword gruvbox-neonAqua
hi! link jsExportDefault gruvbox-neonAqua
hi! link jsTemplateBraces gruvbox-neonAqua
hi! link jsGlobalNodeObjects gruvbox-neonFg1
hi! link jsGlobalObjects gruvbox-neonFg1
hi! link jsFunction gruvbox-neonAqua
hi! link jsFuncParens gruvbox-neonFg3
hi! link jsParens gruvbox-neonFg3
hi! link jsNull gruvbox-neonPurple
hi! link jsUndefined gruvbox-neonPurple
hi! link jsClassDefinition gruvbox-neonYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved gruvbox-neonAqua
hi! link typeScriptLabel gruvbox-neonAqua
hi! link typeScriptFuncKeyword gruvbox-neonAqua
hi! link typeScriptIdentifier gruvbox-neonOrange
hi! link typeScriptBraces gruvbox-neonFg1
hi! link typeScriptEndColons gruvbox-neonFg1
hi! link typeScriptDOMObjects gruvbox-neonFg1
hi! link typeScriptAjaxMethods gruvbox-neonFg1
hi! link typeScriptLogicSymbols gruvbox-neonFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects gruvbox-neonFg1
hi! link typeScriptParens gruvbox-neonFg3
hi! link typeScriptOpSymbols gruvbox-neonFg3
hi! link typeScriptHtmlElemProperties gruvbox-neonFg1
hi! link typeScriptNull gruvbox-neonPurple
hi! link typeScriptInterpolationDelimiter gruvbox-neonAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword gruvbox-neonAqua
hi! link purescriptModuleName gruvbox-neonFg1
hi! link purescriptWhere gruvbox-neonAqua
hi! link purescriptDelimiter gruvbox-neonFg4
hi! link purescriptType gruvbox-neonFg1
hi! link purescriptImportKeyword gruvbox-neonAqua
hi! link purescriptHidingKeyword gruvbox-neonAqua
hi! link purescriptAsKeyword gruvbox-neonAqua
hi! link purescriptStructure gruvbox-neonAqua
hi! link purescriptOperator gruvbox-neonBlue

hi! link purescriptTypeVar gruvbox-neonFg1
hi! link purescriptConstructor gruvbox-neonFg1
hi! link purescriptFunction gruvbox-neonFg1
hi! link purescriptConditional gruvbox-neonOrange
hi! link purescriptBacktick gruvbox-neonOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp gruvbox-neonFg3
hi! link coffeeSpecialOp gruvbox-neonFg3
hi! link coffeeCurly gruvbox-neonOrange
hi! link coffeeParen gruvbox-neonFg3
hi! link coffeeBracket gruvbox-neonOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter gruvbox-neonGreen
hi! link rubyInterpolationDelimiter gruvbox-neonAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier gruvbox-neonRed
hi! link objcDirective gruvbox-neonBlue

" }}}
" Go: {{{

hi! link goDirective gruvbox-neonAqua
hi! link goConstants gruvbox-neonPurple
hi! link goDeclaration gruvbox-neonRed
hi! link goDeclType gruvbox-neonBlue
hi! link goBuiltins gruvbox-neonOrange

" }}}
" Lua: {{{

hi! link luaIn gruvbox-neonRed
hi! link luaFunction gruvbox-neonAqua
hi! link luaTable gruvbox-neonOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp gruvbox-neonFg3
hi! link moonExtendedOp gruvbox-neonFg3
hi! link moonFunction gruvbox-neonFg3
hi! link moonObject gruvbox-neonYellow

" }}}
" Java: {{{

hi! link javaAnnotation gruvbox-neonBlue
hi! link javaDocTags gruvbox-neonAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen gruvbox-neonFg3
hi! link javaParen1 gruvbox-neonFg3
hi! link javaParen2 gruvbox-neonFg3
hi! link javaParen3 gruvbox-neonFg3
hi! link javaParen4 gruvbox-neonFg3
hi! link javaParen5 gruvbox-neonFg3
hi! link javaOperator gruvbox-neonOrange

hi! link javaVarArg gruvbox-neonGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter gruvbox-neonGreen
hi! link elixirInterpolationDelimiter gruvbox-neonAqua

hi! link elixirModuleDeclaration gruvbox-neonYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition gruvbox-neonFg1
hi! link scalaCaseFollowing gruvbox-neonFg1
hi! link scalaCapitalWord gruvbox-neonFg1
hi! link scalaTypeExtension gruvbox-neonFg1

hi! link scalaKeyword gruvbox-neonRed
hi! link scalaKeywordModifier gruvbox-neonRed

hi! link scalaSpecial gruvbox-neonAqua
hi! link scalaOperator gruvbox-neonFg1

hi! link scalaTypeDeclaration gruvbox-neonYellow
hi! link scalaTypeTypePostDeclaration gruvbox-neonYellow

hi! link scalaInstanceDeclaration gruvbox-neonFg1
hi! link scalaInterpolation gruvbox-neonAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 gruvbox-neonGreenBold
hi! link markdownH2 gruvbox-neonGreenBold
hi! link markdownH3 gruvbox-neonYellowBold
hi! link markdownH4 gruvbox-neonYellowBold
hi! link markdownH5 gruvbox-neonYellow
hi! link markdownH6 gruvbox-neonYellow

hi! link markdownCode gruvbox-neonAqua
hi! link markdownCodeBlock gruvbox-neonAqua
hi! link markdownCodeDelimiter gruvbox-neonAqua

hi! link markdownBlockquote gruvbox-neonGray
hi! link markdownListMarker gruvbox-neonGray
hi! link markdownOrderedListMarker gruvbox-neonGray
hi! link markdownRule gruvbox-neonGray
hi! link markdownHeadingRule gruvbox-neonGray

hi! link markdownUrlDelimiter gruvbox-neonFg3
hi! link markdownLinkDelimiter gruvbox-neonFg3
hi! link markdownLinkTextDelimiter gruvbox-neonFg3

hi! link markdownHeadingDelimiter gruvbox-neonOrange
hi! link markdownUrl gruvbox-neonPurple
hi! link markdownUrlTitleDelimiter gruvbox-neonGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType gruvbox-neonYellow
" hi! link haskellOperators gruvbox-neonOrange
" hi! link haskellConditional gruvbox-neonAqua
" hi! link haskellLet gruvbox-neonOrange
"
hi! link haskellType gruvbox-neonFg1
hi! link haskellIdentifier gruvbox-neonFg1
hi! link haskellSeparator gruvbox-neonFg1
hi! link haskellDelimiter gruvbox-neonFg4
hi! link haskellOperators gruvbox-neonBlue
"
hi! link haskellBacktick gruvbox-neonOrange
hi! link haskellStatement gruvbox-neonOrange
hi! link haskellConditional gruvbox-neonOrange

hi! link haskellLet gruvbox-neonAqua
hi! link haskellDefault gruvbox-neonAqua
hi! link haskellWhere gruvbox-neonAqua
hi! link haskellBottom gruvbox-neonAqua
hi! link haskellBlockKeywords gruvbox-neonAqua
hi! link haskellImportKeywords gruvbox-neonAqua
hi! link haskellDeclKeyword gruvbox-neonAqua
hi! link haskellDeriving gruvbox-neonAqua
hi! link haskellAssocType gruvbox-neonAqua

hi! link haskellNumber gruvbox-neonPurple
hi! link haskellPragma gruvbox-neonPurple

hi! link haskellString gruvbox-neonGreen
hi! link haskellChar gruvbox-neonGreen

" }}}
" Json: {{{

hi! link jsonKeyword gruvbox-neonGreen
hi! link jsonQuote gruvbox-neonGreen
hi! link jsonBraces gruvbox-neonFg1
hi! link jsonString gruvbox-neonFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! gruvbox-neonHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! gruvbox-neonHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
