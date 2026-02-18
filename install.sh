#!/bin/bash

echo "WARNING: UNTESETED"
read -p "continue: y/n"
	echo "Hello and thank you for picking me :)";
	read -p "Please enter your username" UN;
	read -p "Please enter your name" NAME;
	read -p "Please enter your email" EMAIL;
	echo "hello, getting bashrc and saving your old one";
	if [[ -f ~/.bashrc ]]; then
		mv $HOME/.bashrc $HOME/.bashrc.bak;
	fi
	wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/.bashrc;

	echo "getting aliases and saving your old ones"
	if [[ -f $HOME/.bash_aliases ]]; then
		mv $HOME/.bash_aliases $HOME/.bash_aliases.bak;
	fi
	wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/.bash_aliases;

	echo "configuring git";
	git config --global user.email "$EMAIL";
	git config --global user.name "$NAME";
	git config --global credential.helper 'cache --timeout=7200';

	echo "and downloading your repops";
	if [ ! -d "$HOME/git-intro" ]; then
		git clone "https://github.com/$UN/git-intro.git";
	fi
	if [ ! -d "$HOME/holbertonschool-shell" ]; then
		git clone "https://github.com/$UN/holbertonschool-shell.git";
	fi
	if [ ! -d "$HOME/holbertonschool-low_level_programming" ]; then
		git clone "https://github.com/$UN/holbertonschool-low_level_programming.git";
	fi
	if [ ! -d "$HOME/sandbox_setup" ]; then
		git clone "https://github.com/$UN/holberton-sandbox-setup.git";
	fi

	source ~/.bashrc
