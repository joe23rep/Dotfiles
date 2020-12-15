# Minimal zsh theme
# Requires Nerd Fonts for the icons

# Configuration
num_dirs=2 # Use 0 for full path
truncated_path="%F{blue}%$num_dirs~%f"
decoration="%F{red}%F{magenta}%F{cyan}%f"
background_jobs="%(1j.%F{green} %f.)"
non_zero_return_value="%(0?..%F{yellow}  %f)"

# Left part of prompt
PROMPT=' $truncated_path $decoration '
# Right part of prompt
RPROMPT='$background_jobs  $non_zero_return_value'
# Input in bold
zle_highlight=(default:bold)

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}  $EPS1"
    zle reset-prompt
}




