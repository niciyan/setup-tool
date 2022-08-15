#!/bin/bash
PWD=`pwd`
SCRIPT_DIR=$(cd $(dirname $0); pwd)

CHECK_GIT=`which git`
if [ -z "$CHECK_GIT" ]
then
	echo "git does not exist."
	echo "exitting..."
	exit 0
else
	echo "git check ok"
fi

CHECK_CURL=`which curl`
if [ -z "$CHECK_CURL" ]
then
	echo "curl does not exist."
	echo "exitting..."
	exit 0
else
	echo "curl check ok"
fi

CHECK_VIM=`which vim`
if [ -z "$CHECK_VIM" ]
then
	echo "vim does not exist."
	echo "exitting..."
	exit 0
else
	echo "vim check ok"
fi

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.bashrc

# install vim settigns
mkdir ~/.vim
cd ~/.vim
git clone https://github.com/niciyan/dotfiles.git
cd dotfiles
sh link.sh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd $SCRIPT_DIR
# vim -s plug-install.vim -cqa
echo "you need to open vim and run :PlugInstall for installing plugins."


# return to cwd
cd $PWD
