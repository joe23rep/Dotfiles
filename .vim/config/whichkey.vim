
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




" ______             __  _        ___  ___                      _
" | ___ \           / _|(_)       |  \/  |                     (_)
" | |_/ /_ __  ___ | |_  _ __  __ | .  . |  __ _  _ __   _ __   _  _ __    __ _  ___
" |  __/| '__|/ _ \|  _|| |\ \/ / | |\/| | / _` || '_ \ | '_ \ | || '_ \  / _` |/ __|
" | |   | |  |  __/| |  | | >  <  | |  | || (_| || |_) || |_) || || | | || (_| |\__ \
" \_|   |_|   \___||_|  |_|/_/\_\ \_|  |_/ \__,_|| .__/ | .__/ |_||_| |_| \__, ||___/
"                                                | |    | |                __/ |
"                                                |_|    |_|               |___/



" Buffer Mappings-------------------------------------------------------

let g:which_key_map.B = {
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


" Buffer Mappings-------------------------------------------------------

let g:which_key_map._ = {
      \ 'name' : '+Comments' ,
      \ 'gc' : ['gc'        , 'comment selected section']   ,
      \ 'cc' : ['cc'        , 'comment current line']   ,
      \ }


" Open Files Mappings---------------------------------------------------

let g:which_key_map.O = {
      \ 'name' : '+openFiles' ,
      \ 'v' : [':tabedit ~/.Dots/.vimrc'        , 'open vimrc']   ,
      \ 't' : [':tabedit ~/Dots/.tmux.conf'        , 'open tmux.conf']   ,
      \ 'z' : [':tabedit ~/Dots/.zshrc'        , 'open zshrc']   ,
      \ 'g' : [':tabedit ~/Dots/.vim/colors/gruvbox-neon3.vim'        , 'open gruvbox-neon3']   ,
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
      \ 'Ctrl U' : ['<C-U>'        , 'go to last changed line']   ,
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
      \ 'Y' : ['y$'        , 'copy to end of line']   ,
      \ '+' : [':call Toggle'        , 'toggle Boolean values']   ,
      \ 'Ctrl n' : [':NERDTreeFind'        , 'open Nerdtree']   ,
      \ }


" Coc Mappings----------------------------------------------------------

let g:which_key_map.C = {
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

let g:which_key_map.Z = {
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

" Terminal Mappings------------------------------------------------------


let g:which_key_map.h = {
      \ 'name' : '+Terminal' ,
      \ 'a' : [':FloatermNew lazygit'        , 'Lazygit']   ,
      \ 's' : [':FloatermNew ranger'        , 'Ranger']   ,
      \ }

" Plugin Mappings------------------------------------------------------


let g:which_key_map.p = {
      \ 'name' : '+Plugins' ,
      \ 'i' : [':PlugInstall'        , 'Plug install']   ,
      \ 'u' : [':PlugUpdate'        , 'Plug update']   ,
      \ 'g' : [':PlugUpgrade'        , 'Plug upgrade']   ,
      \ 'c' : [':PlugClean'        , 'Plug clean']   ,
      \ }




"  _____  _                _        ___  ___                      _
" /  ___|(_)              | |       |  \/  |                     (_)
" \ `--.  _  _ __    __ _ | |  ___  | .  . |  __ _  _ __   _ __   _  _ __    __ _  ___
"  `--. \| || '_ \  / _` || | / _ \ | |\/| | / _` || '_ \ | '_ \ | || '_ \  / _` |/ __|
" /\__/ /| || | | || (_| || ||  __/ | |  | || (_| || |_) || |_) || || | | || (_| |\__ \
" \____/ |_||_| |_| \__, ||_| \___| \_|  |_/ \__,_|| .__/ | .__/ |_||_| |_| \__, ||___/
"                    __/ |                         | |    | |                __/ |
"                   |___/                          |_|    |_|               |___/


let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>s :w<CR>
let g:which_key_map.s = 'save-file'


nnoremap <leader>a :AutoSaveToggle<CR>
let g:which_key_map.a = 'Toggle autosave'

nnoremap <silent> <leader>vs :vs<CR>
let g:which_key_map.vs = 'open vert split'


nnoremap <silent> <leader>hs :split<CR>
let g:which_key_map.hs = 'open horizontal split'


nnoremap <silent> <leader>nn :NERDTreeFind<CR>
let g:which_key_map.nn = 'open Nerdtree'


nnoremap <silent> <leader>q :q!<CR>
let g:which_key_map.q = 'quit w/o saving'


nnoremap <leader>r :%s/<C-r><C-w>//g<Left><Left>
let g:which_key_map.r = 'replace word u/ cursor global'


nnoremap <silent> <leader>sr :%s//g<left><left>
let g:which_key_map.sr = 'search and replace global'


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

nnoremap <space>e :CocCommand explorer --preset floatingRightside<CR>
let g:which_key_map.e = 'Explorer'


"  _____                                  _      _       _
" |_   _|                                | |    (_)     | |
"   | |   __ _  _ __    ___   _ __  ___  | |     _  ___ | |_
"   | |  / _` || '_ \  / _ \ | '__|/ _ \ | |    | |/ __|| __|
"  _| |_| (_| || | | || (_) || |  |  __/ | |____| |\__ \| |_
"  \___/ \__, ||_| |_| \___/ |_|   \___| \_____/|_||___/ \__|
"         __/ |
"        |___/


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

nnoremap <C-s> :w<CR>
let g:which_key_map.s = 'which_key_ignore'

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

nnoremap <leader>g :tabedit ~/.vim/colors/gruvbox-neon3.vim<CR>
let g:which_key_map.g = 'which_key_ignore'

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

nnoremap <leader>1 :b1<CR>
let g:which_key_map.1 = 'which_key_ignore'

nnoremap <leader>2 :b2<CR>
let g:which_key_map.2 = 'which_key_ignore'

nnoremap <leader>3 :b3<CR>
let g:which_key_map.3 = 'which_key_ignore'

nnoremap <leader>4 :b4<CR>
let g:which_key_map.4 = 'which_key_ignore'

nnoremap <leader>5 :b5<CR>
let g:which_key_map.5 = 'which_key_ignore'

nnoremap <leader>6 :b6<CR>
let g:which_key_map.6 = 'which_key_ignore'

nnoremap <leader>7 :b7<CR>
let g:which_key_map.7 = 'which_key_ignore'

nnoremap <leader>8 :b8<CR>
let g:which_key_map.8 = 'which_key_ignore'

nnoremap <leader>hs :split<CR>
let g:which_key_map.hs = 'which_key_ignore'

nnoremap <leader>bb :b#<CR>
let g:which_key_map.bb = 'which_key_ignore'

nnoremap <leader>ga :Git add<CR>
let g:which_key_map.ga = 'which_key_ignore'

nnoremap <leader>ga :Git add<CR>
let g:which_key_map.ga = 'which_key_ignore'

nnoremap <leader>gc :Git commit<CR>
let g:which_key_map.gc = 'which_key_ignore'

nnoremap <leader>gp :Git push<CR>
let g:which_key_map.gp = 'which_key_ignore'

nnoremap <leader>gd :Git diff<CR>
let g:which_key_map.gd = 'which_key_ignore'

nnoremap <leader>gr :Git remove<CR>
let g:which_key_map.gr = 'which_key_ignore'

nnoremap <leader>C :Colors<CR>
let g:which_key_map.C = 'which_key_ignore'

nnoremap <silent> <leader>rr :FloatermNew --height=0.7 --width=0.9 --wintype=floating --name=Ranger --position=center --autoclose=2 ranger --cmd="cd ~" <cr>
let g:which_key_map.rr = 'which_key_ignore'

nnoremap <leader>as :AutoSaveToggle<CR>
let g:which_key_map.as = 'which_key_ignore'

nnoremap <leader>_a :echom '_a'<CR>
nnoremap <leader>_b :echom '_b'<CR>
nnoremap <leader>_p :echom '_b'<CR>
nnoremap <leader>_r :echom '_b'<CR>
nnoremap <leader>_n :echom '_b'<CR>
nnoremap <leader>__ :echom '_b'<CR>
let g:which_key_map['_'] = { 'name': 'which_key_ignore' }
