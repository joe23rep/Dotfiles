" FZF ---------------------------------------------------------------------------------------
"   _____ __________    ____             __ _
"  |  ___|__  /  ___|  / ___|___  _ __  / _(_) __ _
"  | |_    / /| |_    | |   / _ \| '_ \| |_| |/ _` |
"  |  _|  / /_|  _|   | |__| (_) | | | |  _| | (_| |
"  |_|   /____|_|      \____\___/|_| |_|_| |_|\__, |
"                                             |___/
" Fzf statusbar config (lightline style)
function! s:fzf_statusline()
"     " setlocal statusline=%#fzf1#\ \ %#fzf2#fzf%#fzf3#
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


