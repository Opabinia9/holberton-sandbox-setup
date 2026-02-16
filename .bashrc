# work in progress, adding git status

source $HOME/.bash_aliases

function parse_git_dirty() {
        [[ $(git status --porcelain 2> /dev/null) ]] && echo "*";
}
function parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/";
}
prompt() {
        PS1=$(printf "\e[38;2;25;249;216m%*s\r%s\n%s" "$(tput cols)" '$(parse_git_branch)' '\u@sandbox:\w  jobs:\j' '>\e[0m');
}
PROMPT_COMMAND=prompt
