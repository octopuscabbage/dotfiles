echo "Linking vmrc..."
rm -f ~/.vimrc
cp .vimrc ~/.vimrc

echo "Linking .vim..."
rm -rf ~/.vim
cp -r .vim ~/.vim

echo "Linking .viminfo..."
rm -f ~/.viminfo
cp .viminfo ~/.viminfo


echo "Installing plugins..."
vim +PluginInstall +qall

echo "Complete if no errors"
