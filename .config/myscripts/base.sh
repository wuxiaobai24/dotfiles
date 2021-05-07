#!/bin/bash

# Exit if a command fail.
set -e

system_type=$(uname -s)
distro=$(lsb_release -si)

ohmyzsh() {
	echo "install oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
	echo "install zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "install zsh-autosuggestions"	
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
}

nodejs() {
	echo "set npm registry"
	npm config set registry https://registry.npm.taobao.org

	# echo "install n"
	# curl -L https://git.io/n-install | bash
}

setupvim() {
	echo "setup vim plug"
	vim +PlugInstall +qall
}

setupfont() {
	echo "setup font"
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts
	axel -n 4 https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
	unzip SourceCodePro.zip
	fc-cache -vf ~/.local/share/fonts
	cd - 
}

init_ubuntu_env() {
	echo "apt update"
	sudo apt-get update
	sudo apt-get -y upgrade
	echo "install some package"
	sudo apt-get install -y vim wget lsb-core curl zsh nodejs npm python3-venv python3-pip tmux mosh clangd htop fontconfig axel unzip lua5.3

	#ohmyzsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

	
	nodejs
	setupvim
	setupfont
	
	ssh-keygen -q -t rsa -b 4096 -N '' <<< ""$'\n'"y" 2>&1 >/dev/null
	yadm remote set-url origin git@github.com:wuxiaobai24/dotfiles.git
}

function init_arch_env() {
	echo "pacman update"
	sudo pacman -Syyu
	sudo pacman -S yay zsh tmux
	yay -S nodejs-n
	ohmyzsh
}

main() {
	if [ "$distro" == "Ubuntu" ]; then
		init_ubuntu_env
	fi
	if [ "$distro" == "Arch" ]; then
		init_arch_env
	fi
}

main
