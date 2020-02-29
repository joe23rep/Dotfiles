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

let s:p.normal.left = [ [ '#2c323d', '#00eeff', s:term_black, s:term_green, 'bold' ], [ '#d6f4fd', '#3e4452', s:term_green, s:term_black ], [ '#00eeff', '#2c323d', s:term_white, s:term_grey ]]
let s:p.normal.right = [ [ '#2c323d', '#00eeff', s:term_black, s:term_green ], [ '#d6f4fd', '#3e4452', s:term_white, s:term_grey ], [ '#00eeff', '#2c323d', s:term_green, s:term_black ] ]
let s:p.inactive.right = [ [ '#2c323d', '#00eeff', s:term_black, s:term_blue], [ '#d6f4fd', '#3e4452', s:term_white, s:term_grey ] ]
let s:p.inactive.left = s:p.inactive.right[1:]
" her
let s:p.insert.left = [ [ '#2c323d', '#9500ff', s:term_black, s:term_blue, 'bold' ], [ '#d6f4fd', '#3e4452', s:term_blue, s:term_black ] ]
let s:p.insert.right = [ [ '#2c323d', '#9500ff', s:term_black, s:term_blue ], [ '#d6f4fd', '#3E4452', s:term_white, s:term_grey ], [ '#9500ff', '#2c323d', s:term_blue, s:term_black ] ]
let s:p.replace.left = [ [ '#2c323d', '#9500ff', s:term_black, s:term_red, 'bold' ], [ '#d6f4fd', '#3e4452', s:term_red, s:term_black ] ]
let s:p.replace.right = [ [ '#2c323d', '#9500ff', s:term_black, s:term_red, 'bold' ], s:p.normal.right[1], [ '#9500ff', '#2c323d', s:term_red, s:term_black ] ]
let s:p.visual.left = [ [ '#2c323d', '#ff00ff', s:term_black, s:term_purple, 'bold' ], [ '#d6f4fd', '#3e4452', s:term_purple, s:term_black ] ]
let s:p.visual.right = [ [ '#2c323d', '#ff00ff', s:term_black, s:term_purple, 'bold' ], s:p.normal.right[1], [ '#ff00ff', '#2c323d', s:term_purple, s:term_black ] ]
let s:p.normal.middle = [ [ '#d6f4fd', '#2c323d', s:term_white, s:term_black ] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.replace.middle = s:p.normal.middle
let s:p.tabline.left = [ [ '#2c323d', '#00eeff' ], [ '#d6f4fd', '#2c323d' ], [ '#d6f4fd', '#3e4452' ] ]
let s:p.tabline.tabsel = [ s:p.normal.left[0] ]
let s:p.tabline.middle = s:p.normal.middle
let s:p.tabline.right = [ [ '#2c323d', '#00eeff', s:term_black, s:term_green ], [ '#d6f4fd', '#3e4452', s:term_white, s:term_grey ], [ '#00eeff', '#2c323d', s:term_green, s:term_black ] ]
let s:p.normal.error = [ [ '#2c323d', '#9500ff', s:term_black, s:term_red ] ]
let s:p.normal.warning = [ [ '#2c323d', '#00e6ff', s:term_black, s:term_yellow ] ]

let g:lightline#colorscheme#deus#palette = lightline#colorscheme#fill(s:p)

 " Dark variant
  " let s:fg    = [ '#abb2bf', 145 ]
  " let s:bg    = [ '#282c34', 235 ]
  " let s:gray1 = [ '#5c6370', 241 ]
  " let s:gray2 = [ '#2c323d', 235 ]
  " let s:gray3 = [ '#3e4452', 240 ]
  "

