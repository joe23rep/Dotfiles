

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


" Sourcing ----------------------------------------------------------------------------------
"  ____                       _
" / ___|  ___  _   _ _ __ ___(_)_ __   __ _
" \___ \ / _ \| | | | '__/ __| | '_ \ / _` |
"  ___) | (_) | |_| | | | (__| | | | | (_| |
" |____/ \___/ \__,_|_|  \___|_|_| |_|\__, |
"                                     |___/

" Config Files
source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/whichkey.vim
source ~/.config/nvim/config/keybindings.vim
source ~/.config/nvim/config/toggle.vim
source ~/.config/nvim/config/lightline.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/floaterm.vim
source ~/.config/nvim/config/plugconfig.vim

" Colorizer
lua require'plug-colorizer'




" Colors ------------------------------------------------------------------------------------
"   ____      _
"  / ___|___ | | ___  _ __ ___
" | |   / _ \| |/ _ \| '__/ __|
" | |__| (_) | | (_) | |  \__ \
"  \____\___/|_|\___/|_|  |___/

set termguicolors
colorscheme gruvbox-neon3

" Floaterm Colors
hi FloatermBorder guibg=black guifg=#c2c2ff

" Gitgutter Colors
highlight GitGutterAdd    guifg=#c473fa
highlight GitGutterChange guifg=#00c1e5
highlight GitGutterDelete guifg=#34ffbc


