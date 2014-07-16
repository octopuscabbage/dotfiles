echo "Copying vmrc..."
rm -f ~/.vimrc
cp .vimrc ~/.vimrc

echo "Copying .vim..."
rm -rf ~/.vim
cp -r .vim ~/.vim

echo "Copying .viminfo..."
rm -f ~/.viminfo
cp .viminfo ~/.viminfo

echo "Installing tmux"
sudo apt-get install tmux

echo "Copying tmux conf..."
rm -rf ~/.tmux.conf
cp .tmux.conf ~/.tmux.conf


echo "Installing plugins..."
vim +PluginInstall +qall

echo "Complete if no errors"
