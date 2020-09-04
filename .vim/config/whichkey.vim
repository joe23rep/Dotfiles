" Map leader to which_key
nnoremap <silent> <leader>wc :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader>wc :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Number
highlight default link WhichKeyDesc      Operator

" Single mappings
" let g:which_key_map['U'] = [ '<C-W>R'  , 'redo' ]
" let g:which_key_map['cc'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
" let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
" let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
" let g:which_key_map['Tab'] = [ 'Tab'                     , 'next buffer']
" let g:which_key_map['S-Tab'] = [ 'S-Tab'                     , 'previous buffer']
" let g:which_key_map['L'] = [ '$'                     , 'go to end of line']
" let g:which_key_map['H'] = [ '^'                     , 'go to start of line']
"

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" Define prefix dictionary
let g:which_key_map =  {}

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>s :w<CR>
let g:which_key_map.s = 'save-file'


nnoremap <silent> <leader>vs :vs<CR>
let g:which_key_map.vs = 'open vert split'


nnoremap <silent> <leader>hs :split<CR>
let g:which_key_map.hs = 'open horizontal split'


nnoremap <silent> <leader>nn :NERDTreeFind<CR>
let g:which_key_map.nn = 'open Nerdtree'


nnoremap <silent> <leader>q :q!<CR>
let g:which_key_map.q = 'quit w/o saving'


nnoremap <silent> <leader>ra :FloatermNew --height=0.7 --width=0.9 --wintype=floating --name=Ranger --position=center --autoclose=2 ranger --cmd="cd ~" <cr>
let g:which_key_map.ra = 'open Ranger'


nnoremap <silent> <leader>r :%s/<C-r><C-w>//g<Left><Left>
let g:which_key_map.r = 'replace word under cursor'


nnoremap <silent> <leader>sr :%s//g<left><left>
let g:which_key_map.sr = 'search and replace'


nnoremap <silent> <leader>nb :enew<CR>
let g:which_key_map.nb = 'new buffer'


nnoremap <silent> <leader>nh :let @/=""<CR>
let g:which_key_map.nh = 'remove Highlights'


nnoremap <silent> <leader>sf :source %<CR>
let g:which_key_map.sf = 'source current buffer'


nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
let g:which_key_map.w = 'clean whitespace'


nnoremap <silent> <leader>n :bn<CR>
let g:which_key_map.bn = 'next buffer'


nnoremap <silent> <leader>pi :PlugInstall<CR>
let g:which_key_map.pi = 'install plugins'


nnoremap <silent> <leader>gvv :GV<CR>
let g:which_key_map.gvv = 'open commit browser'





let g:which_key_map.qi = {
      \ 'name' : '+buffer' ,
      \ 'cb' : ['bd'        , 'delete-buffer']   ,
      \ 'nb' : ['enew'        , 'new-buffer']   ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.h = {
      \ 'name' : '+openFiles' ,
      \ 'v' : [':tabedit ~/.vimrc'        , 'open vimrc']   ,
      \ 't' : [':tabedit ~/.tmux.conf'        , 'open tmux.conf']   ,
      \ 'z' : [':tabedit ~/.zshrc'        , 'open zshrc']   ,
      \ }


" let g:which_key_map.p = {
"       \ 'name' : '+Coc' ,
"       \ 'gd' : ['<Plug>(coc-definition)'        , 'go to definition']   ,
"       \ 'gy' : ['<Plug>(coc-type-definition)'        , 'open type definition']   ,
"       \ 'gi' : ['<Plug>(coc-implementaion)'        , 'show implementation']   ,
"       \ 'gr' : ['<Plug>(coc-references)'        , 'show references']   ,
"
"       \ 'K' : [':call <SID>show_documentation'        , 'show docu in preview window']   ,
"       \ 'Ctrl l' : ['<Plug>(coc-snippets-expand)'        , 'trigger snippet expand']   ,
"       \ 'Ctrl j' : ['<Plug>(coc-snippets-select)'        , 'select text for placeholder']   ,
"      \ 'Ctrl k' : ['<C-k>'        , 'jump to next placeholder']   ,
"    \ 'Ctrl j' : ['<C-j>'        , 'jump to previous placeholder']   ,
"
"       \ }




let g:which_key_map.a = {
      \ 'name' : '+NormalMode' ,
      \ 'cc' : ['cc'        , 'comment current line']   ,
      \ 'gcc' : ['gcc'        , 'comment selected area']   ,
      \ 'L' : ['$'        , 'go to end of line']   ,
      \ 'H' : ['^'        , 'go to start of line']   ,
      \ 'J' : ['}'        , 'jump paragraph down']   ,
      \ 'K' : ['{'        , 'jump paragraph up']   ,
      \ 'U' : ['<C-R>'        , 'Redo']   ,
      \ 'Ctrl f' : ['/'        , 'search document']   ,
      \ 'Y' : ['y$'        , 'copy to end of line']   ,
      \ '+' : [':call Toggle'        , 'toggle Boolean values']   ,
      \ 'Ctrl n' : [':NERDTreeFind'        , 'open Nerdtree']   ,
      \ }


let g:which_key_map.l = {
     \ 'name' : '+Coc' ,
     \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

let g:which_key_map.F = {
      \ 'name' : '+FZF' ,
      \ 'fb' : [':Buffers'        , 'show-buffer']   ,
      \ 'm' : [':History'        , 'show latest copies']   ,
      \ 'mm' : [':Histroy/'     , 'show latest changed files']     ,
      \ 'C' : [':Colors' , 'show Vim Colorthemes'] ,
      \ 's' : [':Lines'   , 'search buffer']      ,
      \ 'f' : [':FloatermNew fzf'   , 'open fzf in Terminal']      ,
      \ 'rg' : [':Rg'   , 'rip grep search']      ,
      \ 'ff' : [':Files'   , 'search files in CWD']      ,
      \ }

let g:which_key_map.i = {
      \ 'name' : '+changeColortypes' ,
      \ 'tr' : [':ToRGB'        , 'convert to RGB']   ,
      \ 'th' : [':ToHex'        , 'convert to Hex']   ,
      \ 'ts' : [':ToHSLA'        , 'convert to HSLA']   ,
      \ 'tha' : [':ToHexAll'        , 'convert all to Hex']   ,
      \ 'tra' : [':ToRGBAll'        , 'convert all to RGB']   ,
      \ 'trb' : [':ToRGBAAll'        , 'convert all to RGBA']   ,
      \ 'ths' : [':ToHSLAAll'        , 'convert all to HSLA']   ,
      \ }


" Ignore List-----------------------------------------------------

nnoremap <leader>th :ToHex<CR>
let g:which_key_map.th = 'which_key_ignore'

nnoremap <leader>tha :ToHSLA<CR>
let g:which_key_map.tha = 'which_key_ignore'

nnoremap <leader>tr :ToRGB<CR>
let g:which_key_map.tr = 'which_key_ignore'

nnoremap <leader>tra :ToRGBA<CR>
let g:which_key_map.tra = 'which_key_ignore'

nnoremap <leader>nb :enew<CR>
let g:which_key_map.nb = 'which_key_ignore'

nnoremap <leader>b :bp<CR>
let g:which_key_map.b = 'which_key_ignore'

nnoremap <leader>bn :bp<CR>
let g:which_key_map.bn = 'which_key_ignore'

nnoremap <leader>n :bn<CR>
let g:which_key_map.n = 'which_key_ignore'

nnoremap <leader>bp :bp<CR>
let g:which_key_map.bp = 'which_key_ignore'

nnoremap <leader>f :FloatermNew fzf<CR>
let g:which_key_map.f = 'which_key_ignore'

nnoremap <leader>fb :Buffers<CR>
let g:which_key_map.fb = 'which_key_ignore'

nnoremap <leader>ff :Files<CR>
let g:which_key_map.ff = 'which_key_ignore'

nnoremap <leader>m :History<CR>
let g:which_key_map.m = 'which_key_ignore'

nnoremap <leader>mm :History/<CR>
let g:which_key_map.mm = 'which_key_ignore'

nnoremap <leader>rg :Rg<CR>
let g:which_key_map.rg = 'which_key_ignore'

nnoremap <leader>z :tabedit ~/.zshrc<CR>
let g:which_key_map.z = 'which_key_ignore'

nnoremap <leader>v :tabedit ~/.vimrc<CR>
let g:which_key_map.v = 'which_key_ignore'

nnoremap <leader>t :tabline ~/.tmux.conf<CR>
let g:which_key_map.t = 'which_key_ignore'

nnoremap <leader>trb :ToRGBAAll<CR>
let g:which_key_map.trb = 'which_key_ignore'

nnoremap <leader>ts :ToHSLA<CR>
let g:which_key_map.ts = 'which_key_ignore'

nnoremap <leader>ths :ToHSLAAll<CR>
let g:which_key_map.ths = 'which_key_ignore'

nnoremap <leader>c öö<CR>
let g:which_key_map.c = 'which_key_ignore'

nnoremap <leader>cb :bd<CR>
let g:which_key_map.cb = 'which_key_ignore'


" sub level

nnoremap <leader>_a :echom '_a'<CR>
" nnoremap <leader>_<space> :echom '_<space>'<CR>
" nnoremap <leader>_b :echom '_b'<CR>
" nnoremap <leader>_r :echom '_r'<CR>
" nnoremap <leader>_s :echom '_s'<CR>
" nnoremap <leader>__ :echom '__'<CR>
let g:which_key_map['_'] = { 'name': 'which_key_ignore' }
