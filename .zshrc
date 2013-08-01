# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

##~ PATH STUFF ~## 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

##~ EDITORS ~##
alias zshconfig="subl ~/.zshrc"
alias gitconfig="subl ~/.gitconfig"
alias mate="subl"

##~ OSX ~##
alias zhide="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder"
alias zshow="defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder"

##~ BLACK PEARL ~##
alias gi="cd ~/Documents/Docs/CompCreation/Git"
alias db="~/Documents/Docs/Dropbox"

##~ TERMINAL ~##
alias caen="ssh brownman@login.engin.umich.edu"
alias c="clear"
alias sz="source ~/.zshrc"


##~ GIT ~##
alias g="git"
alias gs="git status"
alias ip="ifconfig |grep inet"
alias ggg="git add --all . ;git commit -m $1"
alias ch="git checkout"
alias nb="git push -u origin"
alias nr="sh ~/Dropbox/Saves/dotfiles/new_repo.sh" 
alias prune="sh ~/Dropbox/Saves/dotfiles/prune_branches.sh $1"
alias gq="git commit -m"

##~ BACKSTITCH ~##
alias bs="cd ~/Projects/backstitch"
alias start="foreman start -f dev/Procfile"
alias res="rake db:migrate; rake db:seed; rake elastic_search:reset"

##~ RAILS ~##
alias rs="rails server"
alias rc="rails console"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby subl)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/share/npm/lib/node_modules/coffee-script/bin:/Users/dbrownman/.rvm/gems/ruby-1.9.3-p429/bin:/Users/dbrownman/.rvm/gems/ruby-1.9.3-p429@global/bin:/Users/dbrownman/.rvm/rubies/ruby-1.9.3-p429/bin:/Users/dbrownman/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/dbrownman/.rvm/bin
