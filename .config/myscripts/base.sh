#!/bin/bash

system_type=$(uname -s)
distro=$(lsb_release -si)

ohmyzsh() {
	echo "install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
	echo "install zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "install zsh-autosuggestions"	
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

nodejs() {
	echo "set npm registry"
	npm config set registry https://registry.npm.taobao.org

	# echo "install n"
	# curl -L https://git.io/n-install | bash
}

setupvim() {
	vim +PlugInstall +qall
}

init_ubuntu_env() {
	echo "apt update"
	sudo apt-get update
	sudo apt-get -y upgrade
	echo
	echo "install some package"
	sudo apt-get install -y vim wget lsb-core curl zsh nodejs npm python3-venv python3-pip tmux mosh clangd

	ohmyzsh
	nodejs
	setupvim
	
	ssh-keygen -q -t rsa -b 4096 -N '' <<< ""$'\n'"y" 2>&1 >/dev/null
	yadm remote set-url origin git@github.com:wuxiaobai24/dotfiles.git
}

main() {
	if [ "$distro" == "Ubuntu" ]; then
		init_ubuntu_env
	fi
}

main
