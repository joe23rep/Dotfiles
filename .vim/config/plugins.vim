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
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'amix/open_file_under_cursor.vim' "gf to open file under cursor
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-paste-easy'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/CSSMinister'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
" Plug 'lilydjwg/colorizer'
" Plug 'haya14busa/incsearch.vim'
" Plug 'rstacruz/sparkup'
" Plug 'SirVer/ulisnips' "Ctrl <Space> to launch ultisnips
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/vim-easy-align'
" Plug 'articicestudio/nord-vim'


call plug#end()


" Brief help
" :PlugInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate		- updates plugins
" :PlugUpgrade		- upgrades vim-plug
" :PlugClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"


