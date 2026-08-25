# AlphaOS Shell Theme

ALPHA_GREEN='\[\e[38;5;114m\]'
ALPHA_CYAN='\[\e[38;5;81m\]'
ALPHA_PURPLE='\[\e[38;5;141m\]'
ALPHA_RED='\[\e[38;5;203m\]'
ALPHA_RESET='\[\e[0m\]'

export LS_COLORS='di=1;38;5;81:ln=38;5;141:ex=1;38;5;114:*.tar=38;5;220:*.gz=38;5;220:*.zip=38;5;220:*.xz=38;5;220:*.7z=38;5;220:*.iso=38;5;203:*.png=38;5;213:*.jpg=38;5;213:*.jpeg=38;5;213:*.svg=38;5;213'

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'

alpha_git_branch() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)

    if [ -n "$branch" ]; then
        printf ' %s[%s]%s' \
            "$ALPHA_PURPLE" \
            "$branch" \
            "$ALPHA_RESET"
    fi
}

alpha_prompt() {
    local status=$?
    local path='\[\e[1;38;5;81m\]\w\[\e[0m\]'

    if [ "$status" -eq 0 ]; then
        PS1="${ALPHA_GREEN}\u${ALPHA_RESET}@${ALPHA_CYAN}\h${ALPHA_RESET}:${path}$(alpha_git_branch)\n${ALPHA_GREEN}➜${ALPHA_RESET} "
    else
        PS1="${ALPHA_GREEN}\u${ALPHA_RESET}@${ALPHA_CYAN}\h${ALPHA_RESET}:${path}$(alpha_git_branch) ${ALPHA_RED}[${status}]${ALPHA_RESET}\n${ALPHA_RED}➜${ALPHA_RESET} "
    fi
}

PROMPT_COMMAND=alpha_prompt
