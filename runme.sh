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
