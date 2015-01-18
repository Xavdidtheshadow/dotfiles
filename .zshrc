# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/.env
source ~/.loc

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="kolo"

##~ PATH STUFF ~## 
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

##~ TERMINAL ~##
# alias caen="ssh brownman@login.engin.umich.edu"
alias sz="source ~/.zshrc"
alias http="python -m SimpleHTTPServer 1234"
alias watch="sass --watch ."
alias ms="middleman server"
alias xtime="wget http://c.xkcd.com/redirect/comic/now; open ./now; read; rm ./now;"
alias cda="cd -"
# pretty print json
# pipe json into it: echo '{"a": 1}' | ppj
alias ppj="python -m json.tool"
alias viet="sudo vi /etc/hosts"

##~ SINATRA ~##
alias cig='lsof -i :4567'

function sin()
{
    if [ -f ./config.ru ]; then
        rerun "rackup -p 4567" -p "**/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,json}"
    else
        rerun ruby "${PWD##*/}.rb" -p "**/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,json}"
    fi
}

##~ GIT ~##
alias g="git"
alias purr="git pull --rebase"
alias gs="git status"
alias mip="ifconfig |grep inet"
alias ip="curl http://ipecho.net/plain ;echo"
function ggg() { git add --all .; git commit -m "$1" }
function ggu() { git add -u .; git commit -m "$1" }
alias ch="git checkout"
# nb instructions: `nb $BRANCH`
alias nb="git push -u origin"
# stolen from Nick Quinlan
alias pushit="open -g spotify:track:0GugYsbXWlfLOgsmtsdxzg; git push"

alias gq="git commit -m"
alias disc="git reset --hard"
alias shc="sh compile.sh"
alias b="sh build.sh"
alias t="ruby spec/test.rb"
# push and set upstream branch
function gpu() { REPO=$(git rev-parse --abbrev-ref HEAD); git push --set-upstream origin $REPO }

# from http://www.reddit.com/2e513y
function gi() { curl https://www.gitignore.io/api/$@ ;}

##~ HEROKU ~##
alias gphm="git push heroku master"

##~ RAILS ~##
alias rs="rails server"
alias rc="rails console"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

# I don't actually know what these do
plugins=(git rails ruby subl)

##~ RIQ ~##
function work() 
{   
    export JAVA_HOME="$(/usr/libexec/java_home)"
    export PROJECTS_ROOT=$HOME/projects
    export RIQ=$PROJECTS_ROOT/riq
    source $RIQ/scripts/dev_bash_profile.sh
    export DEVENV=$PROJECTS_ROOT/devenv 
    export PATH=$PATH:$DEVENV/bin

    export DROPBOX=/Users/dbrownman/Dropbox
    export DOTFILES=$DROPBOX/Saves/dotfiles
    function clo() { git clone git@github.com:relateiq/$1.git }
}

##~ BLACK PEARL ~##
function home()
{
    export DROPBOX=/Users/david/Dropbox
    export DOTFILES=$DROPBOX/Saves/dotfiles
    export PROJECTS_ROOT=$HOME/projects

    alias db="cd $DROPBOX"

    ## CUSTOM GIT ##
    alias nr="sh $DOTFILES/new_repo.sh" 
    alias prune="sh $DOTFILES/prune_branches.sh $1"
    function clo() { git clone git@github.com:xavdidtheshadow/$1.git }
}

if [[ $LOC = RIQ ]]; then
    work
elif [[ $LOC = TBP ]]; then
    home
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/share/npm/lib/node_modules/coffee-script/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 