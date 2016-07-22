#! /bin/bash -ex

# RUN THIS FROM THE DOTFILE FOLDER

sudo -v

# zsh setup
DOTPATH=$(pwd)
# not 2.3 yet becuase middleman failed with it
RUBY_VERSION='2.2.5'
cd ~

# make sure i can always write to local
chown -R "$USER" /usr/local

#insall oh_my_zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# better ruby version
curl -sSL https://get.rvm.io | bash -s stable
rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default

# install brew
if [ ! "$(which brew)" ]; then
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ./"$DOTPATH"/brew_installs.sh
fi

# symlinks
ln -sf "$DOTPATH"/dots/.* .

cd "$DOTPATH"
gem install bundler
bundle install

# install subl - use root instead of ~
# don't actually need this, the zsh sublime plugin handles it
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# sublime setup
cd ~/Library/Application\ Support/Sublime\ Text\ 3
rm -rf Packages
rm -rf Insalled\ Packages
ln -s "$DOTPATH"/ST3/Packages .
ln -s "$DOTPATH"/ST3/Installed\ Packages .
cd ~
