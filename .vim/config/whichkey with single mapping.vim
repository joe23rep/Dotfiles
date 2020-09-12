
"
"  _    _  _      _        _      _
" | |  | || |    (_)      | |    | |
" | |  | || |__   _   ___ | |__  | | __ ___  _   _
" | |/\| || '_ \ | | / __|| '_ \ | |/ // _ \| | | |
" \  /\  /| | | || || (__ | | | ||   <|  __/| |_| |
"  \/  \/ |_| |_||_| \___||_| |_||_|\_\\___| \__, |
"                                             __/ |
"                                            |___/

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler



" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>


" " Create map to add keys to
let g:which_key_map =  {}
" " Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100



" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Function
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Number
highlight default link WhichKeyDesc      Operator


" " Register which key map
call which_key#register('<Space>', "g:which_key_map")
"
" " Define prefix dictionary
let g:which_key_map =  {}




" " ______             __  _        ___  ___                      _
" " | ___ \           / _|(_)       |  \/  |                     (_)
" " | |_/ /_ __  ___ | |_  _ __  __ | .  . |  __ _  _ __   _ __   _  _ __    __ _  ___
" " |  __/| '__|/ _ \|  _|| |\ \/ / | |\/| | / _` || '_ \ | '_ \ | || '_ \  / _` |/ __|
" " | |   | |  |  __/| |  | | >  <  | |  | || (_| || |_) || |_) || || | | || (_| |\__ \
" " \_|   |_|   \___||_|  |_|/_/\_\ \_|  |_/ \__,_|| .__/ | .__/ |_||_| |_| \__, ||___/
" "                                                | |    | |                __/ |
" "                                                |_|    |_|               |___/
"
"
"
" Buffer Mappings-------------------------------------------------------

let g:which_key_map.h = {
      \ 'name' : '+Buffer' ,
      \ 'cb' : ['bd'        , 'delete-buffer']   ,
      \ 'nb' : ['enew'        , 'new-buffer']   ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'b' : ['bprevious' , 'previous-buffer'] ,
      \ 'fb' : ['Buffers'   , 'fzf-buffer']      ,
      \ 'bb' : [':b#'   , 'go to last changed buffer']      ,
      \ '1' : [':b1'   , 'go to buffer 1']      ,
      \ '2' : [':b2'   , 'go to buffer 2']      ,
      \ }


" Open Files Mappings---------------------------------------------------

let g:which_key_map.O = {
      \ 'name' : '+openFiles' ,
      \ 'v' : [':tabedit ~/.Dots/.vimrc'        , 'open vimrc']   ,
      \ 't' : [':tabedit ~/Dots/.tmux.conf'        , 'open tmux.conf']   ,
      \ 'z' : [':tabedit ~/Dots/.zshrc'        , 'open zshrc']   ,
      \ 'gg' : [':tabedit ~/Dots/.vim/colors/gruvbox-neon3.vim'        , 'open gruvbox-neon3']   ,
      \ 'c' : [':tabedit ~/Dots/.vim/config/coc.vim'        , 'open coc.vim']   ,
      \ 'w' : [':tabedit ~/Dots/.vim/config/whichkey.vim'        , 'open whichkey.vim']   ,
      \ 'f' : [':tabedit ~/Dots/.vim/config/fzf.vim'        , 'open fzf.vim']   ,
      \ 'g' : [':tabedit ~/Dots/.vim/config/general.vim'        , 'open general.vim']   ,
      \ 'l' : [':tabedit ~/Dots/.vim/config/lightline.vim'        , 'open lightline.vim']   ,
      \ 'p' : [':tabedit ~/Dots/.vim/config/plugins.vim'        , 'open plugins.vim']   ,
      \ 'n' : [':tabedit ~/Dots/.vim/config/nerdtree.vim'        , 'open nerdtree.vim']   ,
      \ 'tt' : [':tabedit ~/Dots/.vim/config/toggle.vim'        , 'open toggle.vim']   ,
      \ 'ff' : [':tabedit ~/Dots/.vim/config/floaterm.vim'        , 'open floaterm.vim']   ,
      \ 'k' : [':tabedit ~/Dots/.vim/config/keybindings.vim'        , 'open keybindings.vim']   ,
      \ 'cc' : [':tabedit ~/Dots/.vim/coc-settings.json'        , 'open coc-settings.json']   ,
      \ }


" Normal Mode Mappings--------------------------------------------------

let g:which_key_map.N = {
      \ 'name' : '+NormalMode' ,
      \ 'e' : ['e'        , 'go to end of word']   ,
      \ 'f' : ['f'        , 'find char after cursor in line']   ,
      \ 'm' : ['m'        , 'mark current line and position']   ,
      \ 'o' : ['o'        , 'go line below /in Insert mode']   ,
      \ 'O' : ['O'        , 'go line above /in Insert mode']   ,
      \ 'M' : ['M'        , 'go to middle of screen']   ,
      \ 'S' : ['S'        , 'deletes line and /in Insert mode']   ,
      \ 'n' : ['n'        , 'repeat last search']   ,
      \ 'C' : ['C'        , 'Change to end of line']   ,
      \ 'c' : ['c'        , 'Insert mode/ overrides text']   ,
      \ 'cc' : ['cc'        , 'comment current line']   ,
      \ 'gc' : ['gc'        , 'comment selected area']   ,
      \ 'jk' : ['jk'        , 'esc']   ,
      \ 'L' : ['$'        , 'go to end of line']   ,
      \ 'H' : ['^'        , 'go to start of line']   ,
      \ 'J' : ['}'        , 'jump paragraph down']   ,
      \ 'K' : ['{'        , 'jump paragraph up']   ,
      \ 'U' : ['<C-R>'        , 'Redo']   ,
      \ 'Ctrl f' : ['/'        , 'search document']   ,
      \ 'Ctrl o' : ['<C-o>'        , 'go to previous worked line']   ,
      \ 'Ctrl i' : ['<C-i>'        , 'go back to last line']   ,
      \ 'Y' : ['y$'        , 'copy to end of line']   ,
      \ '+' : [':call Toggle'        , 'toggle Boolean values']   ,
      \ }


" Coc Mappings----------------------------------------------------------

let g:which_key_map.B = {
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


" FZF Mappings----------------------------------------------------------

let g:which_key_map.F = {
      \ 'name' : '+FZF' ,
      \ 'fb' : [':Buffers'        , 'show-buffer']   ,
      \ 'm' : [':History'        , 'show latest copies']   ,
      \ 'mm' : [':Histroy/'     , 'show latest changed files']     ,
      \ 'C' : [':Colors' , 'choose Vim colorthemes'] ,
      \ 's' : [':Lines'   , 'search buffer']      ,
      \ 'f' : [':FloatermNew fzf'   , 'open fzf in Terminal']      ,
      \ 'rg' : [':Rg'   , 'search for words in document']      ,
      \ 'ff' : [':Files'   , 'search files in CWD']      ,
      \ }


" Change Colors Mappings------------------------------------------------

let g:which_key_map.M = {
      \ 'name' : '+CycleColors' ,
      \ 'tr' : [':ToRGB'        , 'convert to RGB']   ,
      \ 'th' : [':ToHex'        , 'convert to Hex']   ,
      \ 'ts' : [':ToHSLA'        , 'convert to HSLA']   ,
      \ 'tha' : [':ToHexAll'        , 'convert all to Hex']   ,
      \ 'tra' : [':ToRGBAll'        , 'convert all to RGB']   ,
      \ 'trb' : [':ToRGBAAll'        , 'convert all to RGBA']   ,
      \ 'ths' : [':ToHSLAAll'        , 'convert all to HSLA']   ,
      \ }


" Git Mappings----------------------------------------------------------

let g:which_key_map.G = {
      \ 'name' : '+Git' ,
      \ 'a' : [':Git add'        , 'add']   ,
      \ 'c' : [':Git commit'        , 'commit']   ,
      \ 'p' : [':Git push'     , 'push']     ,
      \ 'd' : [':Git diff' , 'diff'] ,
      \ 'l' : [':Git log'   , 'show log']      ,
      \ 'R' : [':GRemove'   , 'remove commit']      ,
      \ 'gv' : [':GV'   , 'open commit browser']      ,
      \ 'gh' : [':GV!'   , 'list commits of current file']      ,
      \ }

" Plugin Mappings------------------------------------------------------


let g:which_key_map.p = {
      \ 'name' : '+Plugins' ,
      \ 'i' : [':PlugInstall'        , 'Plug install']   ,
      \ 'u' : [':PlugUpdate'        , 'Plug update']   ,
      \ 'g' : [':PlugUpgrade'        , 'Plug upgrade']   ,
      \ 'c' : [':PlugClean'        , 'Plug clean']   ,
      \ }

" Terminal Mappings------------------------------------------------------


let g:which_key_map.l = {
      \ 'name' : '+Terminal' ,
      \ 'g' : [':FloatermNew lazygit '        , 'Lazygit']   ,
      \ 'r' : [':FloatermNew ranger'        , 'Ranger']   ,
      \ }


nmap <leader>lg :FloatermNew lazygit<CR>


"  _____  _                _        ___  ___                      _
" /  ___|(_)              | |       |  \/  |                     (_)
" \ `--.  _  _ __    __ _ | |  ___  | .  . |  __ _  _ __   _ __   _  _ __    __ _  ___
"  `--. \| || '_ \  / _` || | / _ \ | |\/| | / _` || '_ \ | '_ \ | || '_ \  / _` |/ __|
" /\__/ /| || | | || (_| || ||  __/ | |  | || (_| || |_) || |_) || || | | || (_| |\__ \
" \____/ |_||_| |_| \__, ||_| \___| \_|  |_/ \__,_|| .__/ | .__/ |_||_| |_| \__, ||___/
"                    __/ |                         | |    | |                __/ |
"                   |___/                          |_|    |_|               |___/


" let g:which_key_map.f = { 'name' : '+file' }
"



nnoremap <leader>a :AutoSaveToggle<CR>
let g:which_key_map.a = 'Toggle autosave'

nnoremap <silent> <leader>vs :vs<CR>
let g:which_key_map.vs = 'open vert split'


nnoremap <Leader>j :call GotoJump()<CR>
let g:which_key_map.j = 'open Jump List'

" nnoremap <silent> <leader>hs :split<CR>
" let g:which_key_map.hs = 'open horizontal split'


nnoremap <silent> <leader>nn :NERDTreeFind<CR>
let g:which_key_map.nn = 'open Nerdtree'


nnoremap <leader>r :%s/<C-r><C-w>//g<Left><Left>
let g:which_key_map.r = 'replace word u/ cursor global'


nnoremap <silent> <leader>sr :%s//g<left><left>
let g:which_key_map.sr = 'search and replace /global'
"
"
" nnoremap <silent> <leader>nb :enew<CR>
" let g:which_key_map.nb = 'new buffer'
"
"
" nnoremap <silent> <leader>n :bn<CR>
" let g:which_key_map.bn = 'next buffer'

nnoremap <silent> <leader>c :let @/=""<CR>
let g:which_key_map.c = 'remove search Highlights'


nnoremap <silent> <leader>sf :source %<CR>
let g:which_key_map.sf = 'source current buffer'


nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
let g:which_key_map.w = 'clean trailing whitespace'



nnoremap <silent> <leader>br :Bracey<CR>
let g:which_key_map.br = 'open Live Server'


nnoremap <silent> <leader>gv :GV!<CR>
let g:which_key_map.gv = 'open commit browser'



"  _____                                  _      _       _
" |_   _|                                | |    (_)     | |
"   | |   __ _  _ __    ___   _ __  ___  | |     _  ___ | |_
"   | |  / _` || '_ \  / _ \ | '__|/ _ \ | |    | |/ __|| __|
"  _| |_| (_| || | | || (_) || |  |  __/ | |____| |\__ \| |_
"  \___/ \__, ||_| |_| \___/ |_|   \___| \_____/|_||___/ \__|
"         __/ |
"        |___/

let g:which_key_map.e = 'which_key_ignore'

let g:which_key_map.gvv = 'which_key_ignore'

let g:which_key_map.th = 'which_key_ignore'

let g:which_key_map.tha = 'which_key_ignore'

let g:which_key_map.tr = 'which_key_ignore'

let g:which_key_map.tra = 'which_key_ignore'

let g:which_key_map.nb = 'which_key_ignore'

let g:which_key_map.b = 'which_key_ignore'

let g:which_key_map.bn = 'which_key_ignore'

let g:which_key_map.n = 'which_key_ignore'

let g:which_key_map.bp = 'which_key_ignore'

let g:which_key_map.f = 'which_key_ignore'

let g:which_key_map.fb = 'which_key_ignore'

let g:which_key_map.ff = 'which_key_ignore'

let g:which_key_map.m = 'which_key_ignore'

let g:which_key_map.mm = 'which_key_ignore'

let g:which_key_map.rg = 'which_key_ignore'

let g:which_key_map.z = 'which_key_ignore'

let g:which_key_map.g = 'which_key_ignore'

let g:which_key_map.v = 'which_key_ignore'

let g:which_key_map.t = 'which_key_ignore'

let g:which_key_map.trb = 'which_key_ignore'

let g:which_key_map.ts = 'which_key_ignore'

let g:which_key_map.ths = 'which_key_ignore'

let g:which_key_map.cb = 'which_key_ignore'

let g:which_key_map.1 = 'which_key_ignore'

let g:which_key_map.2 = 'which_key_ignore'

let g:which_key_map.3 = 'which_key_ignore'

let g:which_key_map.4 = 'which_key_ignore'

let g:which_key_map.5 = 'which_key_ignore'

let g:which_key_map.6 = 'which_key_ignore'

let g:which_key_map.7 = 'which_key_ignore'

let g:which_key_map.8 = 'which_key_ignore'

let g:which_key_map.hs = 'which_key_ignore'

let g:which_key_map.bb = 'which_key_ignore'

let g:which_key_map.ga = 'which_key_ignore'

let g:which_key_map.ga = 'which_key_ignore'

let g:which_key_map.gc = 'which_key_ignore'

let g:which_key_map.gp = 'which_key_ignore'

let g:which_key_map.q = 'which_key_ignore'

let g:which_key_map.gd = 'which_key_ignore'

let g:which_key_map.gr = 'which_key_ignore'

let g:which_key_map.C = 'which_key_ignore'

let g:which_key_map.rr = 'which_key_ignore'

let g:which_key_map.as = 'which_key_ignore'

let g:which_key_map.s = 'which_key_ignore'


" nnoremap <leader>_B :echom '_B'<CR>
" nnoremap <leader>_h :echom '_h'<CR>
" nnoremap <leader>_p :echom '_p'<CR>
" " nnoremap <leader>_n :echom '_b'<CR>
" nnoremap <leader>__ :echom '__'<CR>
" let g:which_key_map['_'] = { 'name': 'which_key_ignore' }


"---------------------------------------------------------------------------
" to delete prefix and prefix items:
"
let g:which_key_map._ = {'name' : 'which_key_ignore'}
let g:which_key_map._.B = 'which_key_ignore'
let g:which_key_map._.h = 'which_key_ignore'
let g:which_key_map._.p = 'which_key_ignore'
let g:which_key_map._.b = 'which_key_ignore'
let g:which_key_map._._ = 'which_key_ignore'

