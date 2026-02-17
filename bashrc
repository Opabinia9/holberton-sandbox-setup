# work in progress, adding git status

source $HOME/.bash_aliases;

MPC="\[\e[38;2;25;249;216m\]";
AE="\[\e[0m\]";

function parse_git_dirty() {
        [[ $(git status --porcelain 2> /dev/null) ]] && echo "*";
}
function parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/";
}
prompt() {
	L1="\u@sandbox:\w jobs:\j";
	R1="$(parse_git_branch)";
	L2="\n>$AE";
        PS1=$(printf "%s%*s%s%s" "$MPC" "$(tput cols)" "$R1\r" "$L1" "$L2");
}
PROMPT_COMMAND=prompt
