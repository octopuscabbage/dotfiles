echo "Downloading exuberant-ctags..."
sudo apt-get install exuberant-ctags || {echo "Run this script as sudo!"}

echo "Linking vmrc..."
rm -f ~/.vimrc
cp .vimrc ~/.vimrc

echo "Linking .vim..."
rm -rf ~/.vim
cp -r .vim ~/.vim

echo "Linking .viminfo..."
rm -f ~/.viminfo
cp .viminfo ~/.viminfo

echo "Complete if no errors"
