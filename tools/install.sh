#!/usr/bin/env bash

DEBUG_FLAG=1

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

info () {
	echo ${YELLOW}"info: $@"${RESET} >&2
}

debug () {
    if [ $DEBUG_FLAG == 1 ];
    then
        echo ${GREEN}"debug: $@"${RESET} >&2
    fi
}

apt_install_depedencies(){

    local -a deplist=(
        git
        zsh
    )

	for dep in ${deplist[@]}
	do
        debug $dep
        command_exists $dep|| {
            info "$dep is not installed"
            apt-cache madison $dep
            sudo apt install $dep
        }
	done

}

dl_install_depedencies(){
# install fzf
# install oh-my-zsh
    local -A deplist=(
        ["oh-my-zsh"]="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    )

    for dep in ${!deplist[@]};
    do
        echo $dep --- "${deplist[$dep]}"
        $(curl -fsSL ${deplist[$dep]})
    done
}


script_install(){

    local -A deplist=(
        ["oh-my-zsh"]="bash oh-my-zsh/install.sh"
        ["zplug"]="git clone --depth 1 https://github.com/zplug/zplug ~/.zplug"
        ["fzf"]="git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
    )

    for dep in ${!deplist[@]};
    do
        debug $dep --- "${deplist[$dep]}"
        eval ${deplist[$dep]}
    done
}

install(){
    apt_install_depedencies
    # dl_install_depedencies
    script_install
}

main() {
    setup_color

    install
}

main $@
