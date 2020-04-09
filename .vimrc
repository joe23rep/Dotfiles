
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

" Plugins -----------------------------------------------------------------------------------
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
Plug 'SirVer/ultisnips' "Ctrl a to launch ultisnips
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'lifepillar/vim-cheat40'
Plug 'amix/open_file_under_cursor.vim' "gf to open file under cursor
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rstacruz/sparkup'
Plug 'roxma/vim-paste-easy'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/gv.vim'
Plug '907th/vim-auto-save'
Plug 'lilydjwg/colorizer'
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'mattn/emmet-vim '
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/vim-easy-align'


call plug#end()


" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"


" Sourcing ----------------------------------------------------------------------------------
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


" General Config ----------------------------------------------------------------------------
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

" Set editor layout
set textwidth=79
set formatoptions=tcqrn1
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Allow switching between buffers without saving
set hidden

" Always show Statusbar
set laststatus=2

" Stops suggestion window being to wide
set linebreak

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number relativenumber

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

" Keep the cursor on the same column
set nostartofline

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

" Enable Folding
set foldmethod=manual

" make sure folds are automatically loaded
set viewoptions=folds,cursor
set sessionoptions=folds

" Keep the cursor on the same column
set nostartofline

" Speed up scrolling in Vim
set ttyfast

" Set indentline character
let g:indentLine_char = '⎟' "┊│┊

" Set space as leader
let mapleader = " "

" Map , as local leader
let maplocalleader = ','

" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1

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


" Enable saving Folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end


" Visual select mode move lines
function! s:Visual()
    return visualmode() == 'V'
endfunction

function! Move_up() abort range
    let l:at_top=a:firstline ==1
    if s:Visual() && !l:at_top
        '<,'>move '<-2
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
endfunction

function! Move_down() abort range
    let l:at_bottom=a:lastline == line ('$')
    if s:Visual() && !l:at_bottom
        '<,'>move '>+1
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
endfunction


" SaveMacro / LoadMacro
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)


" Colors ------------------------------------------------------------------------------------
"   ____      _
"  / ___|___ | | ___  _ __ ___
" | |   / _ \| |/ _ \| '__/ __|
" | |__| (_) | | (_) | |  \__ \
"  \____\___/|_|\___/|_|  |___/

set termguicolors
colorscheme gruvbox-neon2


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

" Ctrl + arrows to switchbuf
nmap <C-Left>  :bp<CR>
nmap <C-Right> :bn<CR>

" Pressing enter now adds a line without going in insert mode
nmap <CR>  o<Esc>

" Map Space to toggle folds
nmap <tab> za

" Map Ctrl S to safe
nmap <C-s> :w<CR>

" Map Ctrl q to safe and quit
nmap <C-q> :wq<CR>

" Ctrl A to select all
nmap <C-a> ggVG

" Or just Space to enter insert mode.
nmap <Space><Space> i

" Map H+L to go to end or beginning of a line
nmap L $
nmap H ^

" Map J/K to jump between paragraphs
nmap J }
nmap K {

" Map U to redo
nmap U <C-R>

" Ctrl f to search
nmap <C-f> /

" Move lines in and out + up and down
nmap <C-h> <<
nmap <C-l> >>
nmap <C-k> :move-2<cr>
nmap <C-j> :move+<cr>


"---------------------------------------------------------------
" Insert Mode
"---------------------------------------------------------------

" On gvim and Linux console Vim, you can use Alt-Space.
imap <M-Space> <esc>

" Ctrl o to go one line down while staying in insert mode
imap öö       <esc>o
imap <C-o>    <esc>o

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


"--------------------------------------------------------------
" Visual Mode
"--------------------------------------------------------------

" Move lines
xmap <silent> <C-k> :call Move_up()<CR>
xmap <silent> <C-j> :call Move_down()<CR>
xmap <silent> <C-h> <gv
xmap <silent> <C-l> >gv

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
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"


" Nerdtree -----------------------------------------------------

" Bind Ctrl n to open nerdtree
nmap <C-n>      :NERDTreeToggle /home/joe/<CR>
vmap <C-n> <esc>:NERDTreeToggle /home/joe/<CR>
imap <C-n> <esc>:NERDTreeToggle /home/joe/<CR>
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


" Cheatsheet ---------------------------------------------------

nmap <leader>cs :<c-u>Cheat40<cr>


" Goyo ---------------------------------------------------------

nmap <leader>g :Goyo<CR>


" FZF ----------------------------------------------------------

nmap <silent> <expr> <Leader>f (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nmap <silent> <leader>fb    :Buffers<CR>
nmap <silent> <leader>m     :History<CR>
nmap <silent> <leader>mm    :History/<CR>
nmap <silent> <leader>C     :Colors<CR>
nmap <silent> <leader>s     :Lines<CR>
nmap <silent> <leader>sb    :Lines<CR>
nmap <silent> <leader>ma    :Marks<CR>
nmap <silent> <leader>us    :Snippets<CR>

" Incsearch -----------------------------------------------------

nmap /      <Plug>(incsearch-forward)
nmap <C-f>  <Plug>(incsearch-forward)
nmap ?      <Plug>(incsearch-backward)
nmap n      <Plug>(incsearch-nohl-n)
nmap N      <Plug>(incsearch-nohl-N)
nmap *      <Plug>(incsearch-nohl-*)
nmap #      <Plug>(incsearch-nohl-#)
nmap g*     <Plug>(incsearch-nohl-g*)
nmap g#     <Plug>(incsearch-nohl-g#)


" GV ------------------------------------------------------------

" Open Commit Browser
nmap <leader>gvv :GV<CR>

" Open Commits of current file
nmap <leader>gv  :GV!<CR>


" Vim Auto Save -------------------------------------------------

" Toggle Auto save
nmap <leader>as :AutoSaveToggle<CR>


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

" Open new line above current line
nmap <leader>O O<esc>

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
nmap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

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


" Vim Auto Closetag -------------------------------------------------------------------------
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

" Tagbar ------------------------------------------------------------------------------------

" Enable CSS
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" Hexokinase Colors--------------------------------------------------------------------------

" Neovim default
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
" let g:Hexokinase_highlighters = [ 'virtual' ]

" make hexokinase change colors as i type
let g:Hexokinase_refreshEvents = [ 'TextChanged', 'InsertLeave']

" Set which Colortypes should be considered
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'


" Vim Auto Save -----------------------------------------------------------------------------

" set to safe after changes in normal and insert mode
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]

" This will run :TagsGenerate after each save
let g:auto_save_postsave_hook = 'TagsGenerate'


" Tmux --------------------------------------------------------------------------------------
"   _____ __  __ _   ___  __
"  |_   _|  \/  | | | \ \/ /
"    | | | |\/| | | | |\  /
"    | | | |  | | |_| |/  \
"    |_| |_|  |_|\___//_/\_\

" Allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" FZF ---------------------------------------------------------------------------------------
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


" " Add vim directory for shortcutting
command! -bang Vim call fzf#vim#files('~/.vim', <bang>0)

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif


" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  if a:fullscreen
    let options = fzf#vim#with_preview(options)
  endif
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Important Stuff (needs to be loaded last) -----------------------------------------------
"   ___                            _              _
"  |_ _|_ __ ___  _ __   ___  _ __| |_ __ _ _ __ | |_
"   | || '_ ` _ \| '_ \ / _ \| '__| __/ _` | '_ \| __|
"   | || | | | | | |_) | (_) | |  | || (_| | | | | |_
"  |___|_| |_| |_| .__/ \___/|_|   \__\__,_|_| |_|\__|
"                |_|

" Stop Auto Commenting new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



