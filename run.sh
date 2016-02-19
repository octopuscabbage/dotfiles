function install_if_missing {
	echo "Installing $1 if not present"
	if hash $1 2>/dev/null; then
     		 echo "$1 installed"
	else
      		echo "$1 not installed"
      		sudo apt-get install $1
	fi
}

install_if_missing "emacs24"
install_if_missing "pylint"
install_if_missing "hdevtools"

git submodule update --init
mkdir ~/.emacs.d/snippets/
cp -r yasnippet-snippets/* ~/.emacs.d/snippets

echo "Copying Emacs"
cp -f .emacs ~/.emacs

echo "Copying vmrc..."
rm -f ~/.vimrc
cp .vimrc ~/.vimrc

echo "Copying .vim..."
rm -rf ~/.vim
cp -r .vim ~/.vim

echo "Copying .viminfo..."
rm -f ~/.viminfo
cp .viminfo ~/.viminfo

echo "Copying xmonad.hs..."
rm -f ~/.xmonad/xmonad.hs
cp xmonad.hs ~/.xmonad/xmonad.hs

echo "Installing plugins..."
vim +PluginInstall +qall

echo "Complete if no errors"
