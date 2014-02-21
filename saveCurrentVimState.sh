rm -rf savedvim/.vimrc
cp ~/.vimrc savedvim/.vimrc

rm -rf savedvim/.vim
cp -r ~/.vim savedvim/.vim

rm -rf savedvim/.viminfo
cp ~/.viminfo savedvim/.viminfo

echo "Complete if no errors"
