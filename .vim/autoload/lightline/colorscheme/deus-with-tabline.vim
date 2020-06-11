" =============================================================================
" Filename: autoload/lightline/colorscheme/deus.vim
" Author: nikersify
" License: MIT License
" Last Change: 2018/01/24 13:26:00
" =============================================================================

let s:term_red = 204
let s:term_green = 114
let s:term_yellow = 180
let s:term_blue = 39
let s:term_purple = 170
let s:term_white = 145
let s:term_black = 235
let s:term_grey = 236

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ '#292c33', '#00eeff', s:term_black, s:term_green, 'bold' ], [ '#00eeff', '#292c33', s:term_green, s:term_black ], [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ]]
let s:p.normal.right = [ [ '#292c33', '#00eeff', s:term_black, s:term_green ], [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ], [ '#00eeff', '#292c33', s:term_green, s:term_black ] ]
let s:p.inactive.right = [ [ '#292c33', '#7cffb7', s:term_black, s:term_blue], [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ] ]
let s:p.inactive.left = s:p.inactive.right[1:]
" her
let s:p.insert.left = [ [ '#292c33', '#7cffb7', s:term_black, s:term_blue, 'bold' ], [ '#7cffb7', '#292c33', s:term_blue, s:term_black ] ]
let s:p.insert.right = [ [ '#292c33', '#7cffb7', s:term_black, s:term_blue ], [ '#ABB2BF', '#3E4452', s:term_white, s:term_grey ], [ '#7cffb7', '#292c33', s:term_blue, s:term_black ] ]
let s:p.replace.left = [ [ '#292c33', '#aaaaff', s:term_black, s:term_red, 'bold' ], [ '#aaaaff', '#292c33', s:term_red, s:term_black ] ]
let s:p.replace.right = [ [ '#292c33', '#aaaaff', s:term_black, s:term_red, 'bold' ], s:p.normal.right[1], [ '#aaaaff', '#292c33', s:term_red, s:term_black ] ]
let s:p.visual.left = [ [ '#292c33', '#c678dd', s:term_black, s:term_purple, 'bold' ], [ '#c678dd', '#292c33', s:term_purple, s:term_black ] ]
let s:p.visual.right = [ [ '#292c33', '#c678dd', s:term_black, s:term_purple, 'bold' ], s:p.normal.right[1], [ '#c678dd', '#292c33', s:term_purple, s:term_black ] ]
let s:p.normal.middle = [ [ '#abb2bf', '#292c33', s:term_white, s:term_black ] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.replace.middle = s:p.normal.middle
let s:p.tabline.left = [ [ '#00eeff', '#292c33' ], [ '#abb2bf', '#3e4452' ], [ '#00eeff', '#292c33' ] ]
let s:p.tabline.tabsel = [ s:p.normal.left[0] ]
let s:p.tabline.middle = s:p.normal.middle
let s:p.tabline.right = [ [ '#292c33', '#00eeff', s:term_black, s:term_green ], [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ], [ '#00eeff', '#292c33', s:term_green, s:term_black ] ]
let s:p.normal.error = [ [ '#292c33', '#aaaaff', s:term_black, s:term_red ] ]
let s:p.normal.warning = [ [ '#292c33', '#00e6ff', s:term_black, s:term_yellow ] ]

let g:lightline#colorscheme#deus#palette = lightline#colorscheme#fill(s:p)


