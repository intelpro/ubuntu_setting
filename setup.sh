sudo apt-get update

cp bashrc ~/.bashrc
cp viminfo ~/.viminfo
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc

cp -R vim ~/.vim

# Install zsh
sudo apt-get -y install zsh
sudo apt-get -y install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
rm -rf ~/.zshrc
cp zshrc ~/.zshrc
chsh -s `which zsh`
