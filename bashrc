source $HOME/.bash_aliases;

if [[ ! -f ~/.age ]]; then
	touch $HOME/.age;
fi
agefile=$HOME/.age;

###Colors
CYAN="\[\e[38;2;25;249;216m\]";
GREEN="\[\e[38;2;93;213;3m\]";
YELLOW="\[\e[38;2;211;173;3m\]";
BLUE="\[\e[38;2;0;172;253m\]";
AE="\[\e[0m\]";
MPC=$CYAN;

###VCS_PROMPT

VCS_F_BEHIND(){
	VCS_BEHIND=$(git rev-list --count HEAD..@{u});
	VCS_S_BEHIND="⇣"
	if [[ "$VCS_BEHIND" > 0 ]]; then
		VCS_P_BEHIND="${VCS_S_BEHIND}${VCS_BEHIND}";
		echo -n " " | cat - <(echo -n "${VCS_P_BEHIND}" | xargs) | tr -d '\n';
	fi
}

VCS_F_AHEAD(){
	VCS_AHEAD=$(git rev-list --count @{u}..HEAD);
	VCS_S_AHEAD="⇡"
	if [[ "$VCS_AHEAD" > 0 ]]; then
		VCS_P_AHEAD="${VCS_S_AHEAD}${VCS_AHEAD}";
		echo -n " " | cat - <(echo -n "${VCS_P_AHEAD}" | xargs) | tr -d '\n';
	fi
}

VCS_F_UNCOMMITED(){
	VCS_UNCOMMITED=$(git status --porcelain |sed 's/^ //'| grep ^"A" | wc -l);
	VCS_S_UNCOMMITED="+"
	if [[ "$VCS_UNCOMMITED" > 0 ]]; then
		VCS_P_UNCOMMITED="${VCS_S_UNCOMMITED}${VCS_UNCOMMITED}";
		echo -n " " | cat - <(echo -n "${VCS_P_UNCOMMITED}" | xargs) | tr -d '\n';
	fi
}

VCS_F_UNSTAGED(){
	VCS_UNSTAGED=$(git status --porcelain |sed 's/^ //'| grep ^M | wc -l);
	VCS_S_UNSTAGED="!"
	if [[ "$VCS_UNSTAGED" > 0 ]]; then
		VCS_P_UNSTAGED="${VCS_S_UNSTAGED}${VCS_UNSTAGED}";
		echo -n " " | cat - <(echo -n "${VCS_P_UNSTAGED}" | xargs) | tr -d '\n';
	fi
}

VCS_F_UNTRACKED(){
	VCS_UNTRACKED=$(git status --porcelain |sed 's/^ //'| grep ^"??" | wc -l);
	VCS_S_UNTRACKED="?"
	if [[ "$VCS_UNTRACKED" > 0 ]]; then
		VCS_P_UNTRACKED="${VCS_S_UNTRACKED}${VCS_UNTRACKED}";
		echo -n " " | cat - <(echo -n "${VCS_P_UNTRACKED}" | xargs) | tr -d '\n';
	fi
}

VCS_PROMPT(){
	VCS_BRANCH=$(git branch --show-current 2>/dev/null);
	if [ "$VCS_BRANCH" ]; then
		echo -n "($VCS_BRANCH$(VCS_F_BEHIND)$(VCS_F_AHEAD)$(VCS_F_UNCOMMITED)$(VCS_F_UNSTAGED)$(VCS_F_UNTRACKED))";
	fi
}

AGE()
{
	agefile=~/.age
	if [ "$1" == "RESET" ]; then
		touch $agefile;
	elif [ $(($(date +%s) - $(date +%s -r $agefile))) -gt "12600" ]; then
		echo -n "\n\[\e[38;5;231;48;2;210;15;57m\]SANDBOX OVER 3 AND A HALF HOURS OLD!!!\nenter 'AGE RESET' to reset this warning$AE";
	fi
}

###PROMPT
prompt() {
	L1="\u@sandbox:\w jobs:\j$(AGE)";
	R1="$(VCS_PROMPT)";
	L2="\n>$AE";
	PS1=$(printf "%s%*s%s%s%s" "$GREEN" "$(tput cols)" "$R1\r" "$MPC" "$L1" "$L2");
}
PROMPT_COMMAND=prompt

###tools
newtask() {
	touch $1;
	echo '#include "main.h"' >> $1;
	echo "" >> $1;
	echo "/**" >> $1;
	echo " * $2 -" >> $1;
	echo " */" >> $1;
	echo "$2" >> $1;
	echo "{" >> $1;
	echo "}" >> $1;
}

bettypush(){
	betty $1;
	read -p "all good? if yes enter commit message: " m;
	git commit -m "$m" &&
	git push;
}
