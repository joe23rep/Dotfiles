" Lightline -------------------------------------------------------------------------------------
"       _       _     _   _ _
"| |   (_) __ _| |__ | |_| (_)_ __   ___
"| |   | |/ _` | '_ \| __| | | '_ \ / _ \
"| |___| | (_| | | | | |_| | | | | |  __/
"|_____|_|\__, |_| |_|\__|_|_|_| |_|\___|
"         |___/

" Lightline shows the mode -> get rid of vim's default
set noshowmode

" Show second tabline on top
set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

" Custom Functions-----------------------------------------------------------------

" Show icon and change the /+ for unsaved changes to be within the same block with diff icon
function! FileNameWithIcon() abort
  let filename_with_icon = expand('%:t') !=# '' ? expand('%:t') : 'Txt'
  let modified = &modified ? '   ' : ''
  return WebDevIconsGetFileTypeSymbol() . ' ' . filename_with_icon . modified
endfunction


" Show filetype with icon and display an icon for unsaved changes
function! FileTypeWithIcon() abort
  let filetype_with_icon = expand(&ft) !=# '' ? expand(&ft) : 'Txt'
  let modified = &modified ? '   ' : ''
  return WebDevIconsGetFileTypeSymbol() . ' '
endfunction
" return WebDevIconsGetFileTypeSymbol() . ' '  . filetype_with_icon  . modified


" Fugitive Integration
function! Git_branch() abort
  if fugitive#head() !=# ''
    " return  fugitive#head() . "  "
    " return  fugitive#head() . "  "
    return  fugitive#head() . "  "
  else
    return " "
  endif
endfunction



" Define lightline look-----------------------------------------------------------

let g:lightline.active = {
      \ 'left': [ ['mode'], [ 'filetype_with_icon' ], ['git_branch'] ],
      \ 'right': [ ['lineinfo'],[ 'percent' ], [ 'unix_logo' ] ],
      \ }



let g:lightline.separator = { 'left': " ", 'right': " " }
let g:lightline.subseparator = { 'left': " ", 'right': " " }
let g:lightline.tabline_separator = { 'left': " ", 'right': " " }
let g:lightline.tabline_subseparator = { 'left': " ", 'right': " " }

" let g:lightline.separator = { 'left': " ", 'right': " " }
" let g:lightline.subseparator = { 'left': " ", 'right': " " }
" let g:lightline.tabline_separator = { 'left': " ", 'right': " " }
" let g:lightline.tabline_subseparator = { 'left': " ", 'right': " " }
"


" Tabline-------------------------------------------------------------------------

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo'], [ 'buffers' ] ],
            \ 'right': [ [ 'buffer' ], [ 'fileencoding' ] ]
            \ }


let g:lightline.tab = {
        \ 'active': ['filename_with_icon'],
        \ 'inactive': ['filename_with_icon']
        \ }


" Custom lightline components-----------------------------------------------------

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }


let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'filetype_with_icon': '%{FileTypeWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'unix_logo': "  ",
        \ 'filename_with_parent': '%t',
        \ 'buffer': 'buffers %n',
        \ 'git_branch': '%{Git_branch()}',
        \}


" Tabline Settings-------------------------------------------------------------------

" Enable bufferline
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Tabline Icons
let g:lightline#bufferline#enable_devicons = 0
let g:lightline#bufferline#filename_modifier = ':t'

" Tabline colors
let s:palette = g:lightline#colorscheme#deus#palette
let s:palette.tabline.tabsel = [ [ '#d6f4fd', '#3e4452', 252, 66, ] ]
" let s:palette.tabline.tabsel = [ [ '#d6f4fd', '#3e4452', 252, 66, 'bold' ] ]

unlet s:palette
