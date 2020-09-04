" Keybindings -------------------------------------------------------------------------------
"  _  __            ____  _           _
" | |/ /___ _   _  | __ )(_)_ __   __| |___
" | ' // _ \ | | | |  _ \| | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|___/
"           |___/

"---------------------------------------------------------------
" Normal Mode
"---------------------------------------------------------------

" Move vertically by visual line
nmap j gj
nmap k gk

" Map cc to comment out current line
nmap cc gcc

" Tab / Shift Tab to switch buffers
nmap <S-Tab>  :bp<CR>
nmap <Tab> :bn<CR>

" Pressing enter now adds a line without going in insert mode
nmap <CR>  o<Esc>

" Map Ctrl S to safe
nmap <C-s> :w<CR>

" Map Ctrl q to safe and quit
nmap <C-q> :wq<CR>

" Ctrl A to select all
nmap <C-a> ggVG

" Press Space twice to enter insert mode.
nmap <Space><Space> i

" Map H+L to go to end or beginning of a line
nmap L $
nmap H ^

" Map J/K to jump between paragraphs
nmap J }
nmap K {

" Map redo
nmap U <C-R>
nmap <C-z> <C-R>

" Ctrl f to search
nmap <C-f> /

" Move lines in and out + up and down
" nmap <C-h> <<
" nmap <C-l> >>
" nmap <C-k> :move-2<cr>
" nmap <C-j> :move+<cr>


"---------------------------------------------------------------
" Insert Mode
"---------------------------------------------------------------

" On gvim and Linux console Vim, you can use Alt-Space.
imap <M-Space> <esc>

" Ctrl o to add one line down while staying in insert mode
imap <C-o> <esc>o

" double öö to add one line down while staying in insert mode
imap öö <esc>o

" Map Ctrl S to safe
imap <C-s> <esc>:w<CR>

" Map Ctrl q to safe and quit
imap <C-q> <esc>:wq<CR>

" Auto close brackets --needs inoremap
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Map Ctrl+ vim keys to move normal in insert mode
imap <C-l> <right>
imap <C-h> <left>
imap <C-k> <up>
imap <C-j> <down>


"--------------------------------------------------------------
" Visual Mode
"--------------------------------------------------------------

" Move lines
xmap <silent> <C-k> :call Move_up()<CR>
xmap <silent> <C-j> :call Move_down()<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv


" Copy and Paste -----------------------------------------------

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nmap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Copy and paste to system clipboard (requires gvim installed)
vmap <C-y> "*y :let @+=@*<CR>
nmap <C-p> "+P
imap <C-p> <esc>"+P
nmap Y y$


" Escape mappings ----------------------------------------------
imap jk <esc>
vmap jk <esc>
cmap jk <C-c>
imap kj <esc>
vmap kj <esc>
cmap kj <C-c>


"---------------------------------------------------------------
" Plugin Mappings
"---------------------------------------------------------------

" Toggle Boolean Values ----------------------------------------
nmap +      :call Toggle()<CR>
vmap + <esc>:call Toggle()<CR>


" Ultisnips ----------------------------------------------------

" Change snippets trigger key
" let g:UltiSnipsExpandTrigger="<C-Space>"
" let g:UltiSnipsJumpForwardTrigger="<TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"


" Nerdtree -----------------------------------------------------

" Bind Ctrl n to open nerdtree
" nmap <C-n>      :NERDTreeToggle /home/joe/<CR>
nmap <C-n>      :NERDTreeFind<CR>
vmap <C-n> <esc>:NERDTreeFind<CR>
imap <C-n> <esc>:NERDTreeFind<CR>
nmap <leader>nn :NERDTreeFind<CR>


" Auto Close Tag -----------------------------------------------

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


" Open_file_under_cursor ---------------------------------------

" Override vim commands 'gf', '^Wf', '^W^F'
nmap gf :call GotoFile("")<CR>


" Tagbar -------------------------------------------------------

nmap <C-t> :TagbarToggle<CR>
vmap <C-t> :TagbarToggle<CR>


" Goyo ---------------------------------------------------------

nmap <leader>g :Goyo<CR>


" FZF ----------------------------------------------------------

" nmap <silent> <expr> <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nmap <silent> <leader>fb    :Buffers<CR>
nmap <silent> <leader>m     :History<CR>
nmap <silent> <leader>mm    :History/<CR>
nmap <silent> <leader>C     :Colors<CR>
nmap <silent> <leader>s     :Lines<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>ff :Files<CR>
nmap <leader>f :FloatermNew fzf<CR>

" GV ------------------------------------------------------------

" Open Commit Browser
nmap <leader>gvv :GV<CR>

" Open Commits of current file
nmap <leader>gv  :GV!<CR>


" Vim Auto Save -------------------------------------------------

" Toggle Auto save
nmap <leader>as :AutoSaveToggle<CR>

" Gitgutter -----------------------------------------------------

" Switch between last changed Parts
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" CSS Minister----------------------------------------------------

" Cycle threw Colortypes
nmap <leader>tr :ToRGB<CR>
nmap <leader>th :ToHex<CR>
nmap <leader>ts :ToHSLA<CR>
nmap <leader>tha :ToHexAll<CR>
nmap <leader>tra :ToRGBAll<CR>
nmap <leader>trb :ToTGBAAll<CR>
nmap <leader>ths :ToHSLAAll<CR>

" :ToHexAll <format>
" :ToRGBAll <format>
" :ToRGBAAll <format>
" :ToHSLAll <format>
" :ToHSLAAll <format>
" :ToHexAll rgba would change all rgba in the document to hex

" Which Key-------------------------------------------------------

nnoremap <silent> <leader>wc :WhichKey '<Space>'<CR>


" Leader Key Mappings ----------------------------------------------------------------------
"   _                   _             _  __
"  | |    ___  __ _  __| | ___ _ __  | |/ /___ _   _ ___
"  | |   / _ \/ _` |/ _` |/ _ \ '__| | ' // _ \ | | / __|
"  | |__|  __/ (_| | (_| |  __/ |    | . \  __/ |_| \__ \
"  |_____\___|\__,_|\__,_|\___|_|    |_|\_\___|\__, |___/
"                                              |___/

" Map leader q to quit without saving
nmap <leader>q :q!<CR>

" Spellcheck
map <leader>sc :setlocal spell! spelllang=en_us<CR>

" Switch buffers
map <leader>b :bp<CR>
map <leader>n :bn<CR>

" Close buffer
map <leader>cb :bd<CR>

" Load files via shortcuts
nmap <leader>v :tabedit ~/.vimrc<CR>
nmap <leader>z :tabedit ~/.zshrc<CR>
nmap <leader>t :tabedit ~/.tmux.conf<CR>

" Map color Highlighting
nmap <leader>ch :ColorHighlight<CR>

" Map splits
nmap <leader>vs :vs<CR>
nmap <leader>hs :split<CR>

" Clean trailing whitespace
nmap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Map search and replace
nmap <leader>sr :%s//g<left><left>

" Map search word under cursor and replace it
nmap <leader>r :%s/<C-r><C-w>//g<Left><Left>

" Stop showing Search highlights
nmap <leader>nh :let @/=""<cr>

" Plug install shortcut
nmap <leader>pi :PlugInstall<CR>

"Open new empty buffer
nmap <leader>nb :enew<CR>

" source current buffer
nmap <leader>sf :source %<cr>

" Open Ranger inside Floaterm
nmap <leader>ra :FloatermNew --height=0.7 --width=0.9 --wintype=floating --name=Ranger --position=center --autoclose=2 ranger --cmd="cd ~" <cr>

