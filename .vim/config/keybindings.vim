
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

 " <TAB>: completion.
 imap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

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


" Bracey--------------------------------------------------------

nmap <leader>br      :Bracey<CR>

" Nerdtree -----------------------------------------------------

" Bind Ctrl n to open nerdtree
nmap <C-n>      :NERDTreeToggle /home/joe/<CR>
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

" Open Commits of current file
nmap <leader>gv  :GV!<CR>


" Vim Auto Save -------------------------------------------------

" Toggle Auto save
" nmap <leader>as :AutoSaveToggle<CR>

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


" Which Key-------------------------------------------------------

nnoremap <silent> <leader>wc :WhichKey '<Space>'<CR>


" Floaterm--------------------------------------------------------

nmap <leader>lg :FloatermNew  cd ~/Dots && lazygit<CR>
nmap <leader>rr :FloatermNew ranger <cr>


" Coc Mappings----------------------------------------------------

"Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Explorer
nmap <space>e :CocCommand explorer --preset floatingRightside<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


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
" map <leader>sc :setlocal spell! spelllang=en_us<CR>

" Switch buffers
map <leader>b :bp<CR>
map <leader>n :bn<CR>

" Switch to previous used buffer
map <leader>bb :b#<CR>

" Close buffer
map <leader>cb :bd<CR>

" Load files via shortcuts
nmap <leader>v :tabedit ~/Dots/.vimrc<CR>
nmap <leader>z :tabedit ~/Dots/.zshrc<CR>
nmap <leader>t :tabedit ~/Dots/.tmux.conf<CR>
nmap <leader>g :tabedit ~/Dots/.vim/colors/gruvbox-neon3.vim<CR>


" Map splits
" nmap <leader>vs :vs<CR>
nmap <leader>hs :split<CR>

" Clean trailing whitespace
nmap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Map search and replace
nmap <leader>s :%s//g<left><left>

" Map search word under cursor and replace it
nmap <leader>r :%s/<C-r><C-w>//g<Left><Left>

" Stop showing Search highlights
nmap <leader>c :let @/=""<cr>

" Plug install shortcut
nmap <leader>pi :PlugInstall<CR>

"Open new empty buffer
nmap <leader>nb :enew<CR>

" source current buffer
nmap <leader>sf :source %<cr>

" open Jumplist
nmap <Leader>j :call GotoJump()<CR>


" Open Ranger inside Floaterm
nmap <leader>rr :FloatermNew ranger <cr>
" nmap <leader>rr :FloatermNew --height=0.7 --width=0.9 --wintype=floating --name=Ranger --position=center --autoclose=2 ranger --cmd="cd ~" <cr>

" Switch to certain Buffer
nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader>7 :b7<CR>
nmap <leader>8 :b8<CR>


" Github----------------------------------------------------------------


nmap <leader>ga :Git add<cr>
nmap <leader>gc :Git commit<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gd :Git diff<cr>
nmap <leader>gr :Git remove<cr>

