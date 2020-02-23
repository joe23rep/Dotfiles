

"  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
" | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
" | | ____   ____  | || |     _____    | || | ____    ____ | || |  _______     | || |     ______   | |
" | ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| || | |_   __ \    | || |   .' ___  |  | |
" | |  \ \   / /   | || |      | |     | || |  |   \/   |  | || |   | |__) |   | || |  / .'   \_|  | |
" | |   \ \ / /    | || |      | |     | || |  | |\  /| |  | || |   |  __ /    | || |  | |         | |
" | |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | || |  _| |  \ \_  | || |  \ `.___.'\  | |
" | |     \_/      | || |    |_____|   | || ||_____||_____|| || | |____| |___| | || |   `._____.'  | |
" | |              | || |              | || |              | || |              | || |              | |
" | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
"  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

" Plugins+ General----------------------------------------------------------------------
"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmux-plugins/vim-tmux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'KabbAmine/vCoolor.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim' "gc to comment out multiple lines- cc to comment single line
Plug 'mengelbrecht/lightline-bufferline'
Plug 'lambdalisue/vim-manpager'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'c0r73x/colorizer'
Plug 'SirVer/ultisnips' "Ctrl a to launch ultisnips
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'lifepillar/vim-cheat40'
Plug 'amix/open_file_under_cursor.vim' "gf to open file under cursor
Plug 'maxbrunsfeld/vim-yankstack' "meta p to go backwards in paste history / meta Shift p to go forward
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mattn/emmet-vim'
" Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"
nmap <F8> :TagbarToggle<CR>

" General Config-----------------------------------------------------------------------------
"   ____                           _    ____             __ _
"  / ___| ___ _ __   ___ _ __ __ _| |  / ___|___  _ __  / _(_) __ _
" | |  _ / _ \ '_ \ / _ \ '__/ _` | | | |   / _ \| '_ \| |_| |/ _` |
" | |_| |  __/ | | |  __/ | | (_| | | | |__| (_) | | | |  _| | (_| |
"  \____|\___|_| |_|\___|_|  \__,_|_|  \____\___/|_| |_|_| |_|\__, |
"                                                             |___/

" Set compatibility to Vim only. should be first, because it changes other options as a side effect
set nocompatible

" Turn on syntax highlighting
syntax on

" Avoid slow rendering for long lines
set synmaxcol=128

" Faster syntax hl
syntax sync minlines=64

" Enable mouse mode
set mouse=a

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Correct colors with dark background
set background=dark

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Allow switching between buffers without saving
set hidden

" Always show Statusbar
set laststatus=2

"stops suggestion window being to wide
set linebreak

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number relativenumber

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Enable autocompletion
set wildmode=longest,list,full
set wildoptions=pum

" Highlight matching search patterns
set hlsearch

" Searches before hitting ENTER
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Window splitting
set splitbelow splitright

" Automatically remove whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Automatically switch vim to CWD
autocmd BufEnter * lcd %:p:h

" Visual autocomplete for command menu
set wildmenu

" Redraw screen only when need too
set lazyredraw

" Show matching parenthesis
set showmatch

" Remove the pause when leaving insert mode
set ttimeoutlen=10

" Search down into subfolders
set path+=**

" Cmd line height
set cmdheight=2

" Fix vulnerabilities
set nomodeline

" Show command key pressed
set showcmd

" Show current position
set ruler

" Disable swapfiles
set noswapfile

" No back up -use git
set nobackup
set nowritebackup

" Autoread a file if its changed on the outside
set autoread

" Blink cursor on error, instead of beeping
set visualbell

" Width that a <TAB> character displays as
set tabstop=4

" Convert <TAB> key-presses to spaces
set expandtab

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Backspace after pressing <TAB> will remove up to this many spaces
set softtabstop=4

" Copy indent from current line when starting a new line
set autoindent

" Allow changes to buffers
set modifiable

" Even better autoindent (e.g. add indent after '{')
set smartindent

" Set indentline character
let g:indentLine_char = '⎟' "┊│┊

" No signcolumn bg
highlight clear signcolumn

" Add cursorline when entering insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul


" Change cursor behaviour when entering insert mode
let &t_SI.="\e[6 q" "SI = INSERT mode // steady bar
let &t_SR.="\e[4 q" "SR = REPLACE mode // underline
let &t_EI.="\e[4 q" "SR = NORMAL mode // underline


" Make sure vim returns to the line u closed the document on
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" Stops the auto-commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Colors----------------------------------------------------------------------------
"   ____      _
"  / ___|___ | | ___  _ __ ___
" | |   / _ \| |/ _ \| '__/ __|
" | |__| (_) | | (_) | |  \__ \
"  \____\___/|_|\___/|_|  |___/

set termguicolors
" colorscheme necro-gre
colorscheme gruvbox-neon
" colorscheme nord2

" Keybinds--------------------------------------------------------------------------
"  _  __            ____  _           _
" | |/ /___ _   _  | __ )(_)_ __   __| |___
" | ' // _ \ | | | |  _ \| | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|___/
"           |___/

" Normal Mode-------------------------------------------------

" Move vertically by visual line
nmap j gj
nmap k gk

" Map cc to comment out current line
nmap cc gcc

" Center next search entry
nmap n nzzzv
nmap N Nzzzv

nmap <C-Left> :bp<CR>
nmap <C-Right> :bn<CR>

" Pressing enter now adds a line without going in insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map Space to toggle folds
nmap ,, za

" Map Ctrl S to safe
nmap <C-s> :w<CR>

" Map Ctrl q to safe and quit
nmap <C-q> :wq<CR>

" Or just Space to enter insert mode.
nmap <Space><Space> i

" Map Ctrl+ vim keys to go to end or beginning of a line
nmap <C-l> $
nmap <C-h> ^

" Map U to redo
nmap U <C-R>

" Map J/K to jump between paragraphs
nmap J }
nmap K {

" Ctrl f to search
nmap <C-f> /

" Insert Mode--------------------------------------------------

" On gvim and Linux console Vim, you can use Alt-Space.
imap <M-Space> <Esc>

" Ctrl o to go one line up/ down while staying in insert mode
imap <C-o> <Esc>o
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

" Map Ctrl+ vim keys to go to end or beginning of a line
imap <C-l> <right>
imap <C-h> <left>
imap <C-k> <up>
imap <C-j> <down>

" Copy and Paste-----------------------------------------------

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nmap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Copy and paste to system clipboard (requires gvim installed)
vmap <C-y> "*y :let @+=@*<CR>
nmap <C-p> "+P
imap <C-p> <esc>"+P


" Escape mappings----------------------------------------------
imap jk <esc>
imap kj <esc>

" Toggle Boolean Values----------------------------------------
nmap + :call Toggle()<CR>
vmap + <esc>:call Toggle()<CR>

" Ultisnips----------------------------------------------------

" Change snippets trigger key
" Let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsExpandTrigger="<C-Space>"


" Nerdtree-----------------------------------------------------

" Bind Ctrl n to open nerdtree
nmap <C-n> :NERDTreeToggle <CR>
vmap <C-n> <esc>:NERDTreeToggle <CR>
imap <C-n> <esc>:NERDTreeToggle <CR>


" Auto Close Tag-----------------------------------------------

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Open_file_under_cursor---------------------------------------

" Override vim commands 'gf', '^Wf', '^W^F'
nmap gf :call GotoFile("")<CR>

" Multiple Cursors---------------------------------------------
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-ö>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Leader Keys-------------------------------------------------------------------------------------
"   _                   _             _  __
"  | |    ___  __ _  __| | ___ _ __  | |/ /___ _   _ ___
"  | |   / _ \/ _` |/ _` |/ _ \ '__| | ' // _ \ | | / __|
"  | |__|  __/ (_| | (_| |  __/ |    | . \  __/ |_| \__ \
"  |_____\___|\__,_|\__,_|\___|_|    |_|\_\___|\__, |___/
"                                              |___/

" Set space as leader
let mapleader = " "

" Map , as local leader
let maplocalleader = ','

" Open nerdtree in cwd
nmap <leader>nn :NERDTreeFind<CR>

" Map leader q to quit without saving
nmap <leader>q :q!<CR>

" Spellcheck
map <leader>sc :setlocal spell! spelllang=en_us<CR>

" Open FZF using leader fzf
nmap <silent> <leader>f :FZF<CR>
nmap <silent> <leader>ff :FZF ~<CR>
nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>fv :Vim<CR>
map <leader>m :History<CR>

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
nmap <leader>vs :vs ene<CR>
nmap <leader>hs :split ene<CR>

" Clean trailing whitespace
nmap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Map search and replace and move cursor between //
nmap <leader>sr :%s//g<left><left>

" Map search word under cursor and replace it
nmap <leader>r :%s/<C-r><C-w>//g<Left><Left>

" Stop showing Search highlights
nmap <leader>nh :noh<cr>

" Plug install shortcut
nmap <leader>pi :PlugInstall<CR>

" Toggle goyo
nmap <leader>g :Goyo<CR>

"Open new empty buffer
nmap <leader>nb :enew<CR>

" Basic file system commands
nmap <leader>to :!touch<Space>
nmap <leader>mk :!mkdir<Space>

" Cheatsheet
nmap  <leader>vc :<c-u>Cheat40<cr>
" <unique>

" Yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" source current buffer
nmap <leader>sf :source %<cr>


" Vim Auto Closetag--------------------------------------------------------------------------
"
"      _         _           ____ _                  _____
"     / \  _   _| |_ ___    / ___| | ___  ___  ___  |_   _|_ _  __ _
"    / _ \| | | | __/ _ \  | |   | |/ _ \/ __|/ _ \   | |/ _` |/ _` |
"   / ___ \ |_| | || (_) | | |___| | (_) \__ \  __/   | | (_| | (_| |
"  /_/   \_\__,_|\__\___/   \____|_|\___/|___/\___|   |_|\__,_|\__, |
"                                                              |___/

" Filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" Filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" Filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" Filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" Integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Tagbar enable CSS---------------------------------------------------------------------------

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" Tmux----------------------------------------------------------------------------------------
"   _____ __  __ _   ___  __
"  |_   _|  \/  | | | \ \/ /
"    | | | |\/| | | | |\  /
"    | | | |  | | |_| |/  \
"    |_| |_|  |_|\___//_/\_\

" Allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif


" FZF-----------------------------------------------------------------------------------------
"   _____ __________    ____             __ _
"  |  ___|__  /  ___|  / ___|___  _ __  / _(_) __ _
"  | |_    / /| |_    | |   / _ \| '_ \| |_| |/ _` |
"  |  _|  / /_|  _|   | |__| (_) | | | |  _| | (_| |
"  |_|   /____|_|      \____\___/|_| |_|_| |_|\__, |
"                                             |___/
" Fzf statusbar config (lightline style)
function! s:fzf_statusline()
  setlocal statusline=%#fzf1#\ \ %#fzf2#fzf%#fzf3#\
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Colors for fzf statusbar
hi fzf1 guifg=#292c33  guibg=#00eeff
hi fzf2 guifg=#292c33  guibg=#00eeff
hi fzf3 guifg=#00eeff  guibg=#292c33

" Add vim directory for shortcutting
command! -bang Vim call fzf#vim#files('~/.vim', <bang>0)


" Sourcing-------------------------------------------------------------------------------------
"  ____                       _
" / ___|  ___  _   _ _ __ ___(_)_ __   __ _
" \___ \ / _ \| | | | '__/ __| | '_ \ / _` |
"  ___) | (_) | |_| | | | (__| | | | | (_| |
" |____/ \___/ \__,_|_|  \___|_|_| |_|\__, |
"                                     |___/

source ~/.vim/config/coc.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/toggle.vim
source ~/.vim/config/lightline.vim






