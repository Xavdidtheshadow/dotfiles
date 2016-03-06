#! /bin/bash -ex

brew update

brew install autojump jq youtube-dl node

brew cask update
brew tap caskroom/fonts
brew tap caskroom/versions

brew cask install $(cat casks.txt | tr '\n' ' ')

