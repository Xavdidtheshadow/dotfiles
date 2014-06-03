# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.env

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

##~ PATH STUFF ~## 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

##~ EDITORS ~##
alias zshconfig="subl ~/.zshrc"
alias gitconfig="subl ~/.gitconfig"
alias envedit="subl ~/.env"
# Screw Textmate
alias mate="subl"

##~ OSX ~##
alias zhide="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias zshow="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"

##~ RIQ WORK ~##
alias p="cd ~/projects"

##~ TERMINAL ~##
alias caen="ssh brownman@login.engin.umich.edu"
alias c="clear"
alias sz="source ~/.zshrc"
alias http="python -m SimpleHTTPServer 8080"
alias watch="sass --watch ."
alias ms="middleman server"
alias xtime="wget http://c.xkcd.com/redirect/comic/now; open ./now; read; rm ./now;"
alias sin='rerun ruby "${PWD##*/}.rb"'

##~ GIT ~##
alias g="git"
alias gs="git status"
alias ip="ifconfig |grep inet"
alias ggg="git add --all . ;git commit -m $1"
alias ggu="git add -u .;git commit -m $1"
alias ch="git checkout"
# nb instructions: `nb $BRANCH`
alias nb="git push -u origin"

alias gq="git commit -m"
alias disc="git reset --hard"
alias shc="sh compile.sh"

##~ HEROKU ~##
alias gphm="git push heroku master"

##~ RAILS ~##
alias rs="rails server"
alias rc="rails console"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# I don't actually know what these do
plugins=(git rails ruby subl)

##~ RIQ ~##
function work() 
{   
    alias gi="cd ~/projects"
    export JAVA_HOME="$(/usr/libexec/java_home)"
    export PROJECTS_ROOT=$HOME/projects
    export RIQ=$PROJECTS_ROOT/riq
    . $RIQ/scripts/dev_bash_profile.sh
    export DEVENV=$PROJECTS_ROOT/devenv 
    export PATH=$PATH:$DEVENV/bin
}

##~ BLACK PEARL ~##
function home()
{
    alias gi="cd ~/Documents/Docs/CompCreation/Git"
    alias db="cd ~/Documents/Docs/Dropbox"
    alias co="cd ~/Documents/Docs/Google\ Drive/College"
    alias webs="cd ~/Documents/Docs/CompCreation/Git/website"
    ## CUSTOM GIT ##
    alias nr="sh ~/Dropbox/Saves/dotfiles/new_repo.sh" 
    alias prune="sh ~/Dropbox/Saves/dotfiles/prune_branches.sh $1"
}



if [[ $LOC = RIQ ]]; then
    work
elif [[ $LOC = TBP ]]; then
    home
fi

source $ZSH/oh-my-zsh.sh


# Customize to your needs...
export PATH=$PATH:/usr/local/share/npm/lib/node_modules/coffee-script/bin:/Users/dbrownman/.rvm/gems/ruby-1.9.3-p429/bin:/Users/dbrownman/.rvm/gems/ruby-1.9.3-p429@global/bin:/Users/dbrownman/.rvm/rubies/ruby-1.9.3-p429/bin:/Users/dbrownman/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/dbrownman/.rvm/bin:~/pebble-dev/arm-cs-tools/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
