# RUN THIS FROM THE DOTFILE FOLDER

# brew = false


# if [[ $* == *--brew* ]]; then
#     $brew = true
# fi

#zsh setup
dotpath=`pwd`
cd ~
#insall oh_my_zsh
# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# symlinks
ln -sf $dotpath/.zshrc .
ln -sf $dotpath/.gitconfig .

# osx stuff