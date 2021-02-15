#!/bin/bash

system_type=$(uname -s)
distro=$(lsb_release -si)

ohmyzsh() {
	echo "install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "install zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "install zsh-autosuggestions"	
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	source ~/.zshrc
}

init_ubuntu_env() {
	echo "apt update"
	sudo apt-get update
	sudo apt-get -y upgrade
	echo
	echo "install zsh"
	sudo apt-get install -y zsh
	ohmyzsh
}

main() {
	if [ "$distro" == "Ubuntu" ]; then
		init_ubuntu_env
	fi
}

main
