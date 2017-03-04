#! /bin/zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# shellcheck source=/dev/null
source ~/.env
# shellcheck source=/dev/null
source ~/.loc

# no wierd !45 expansion
# use single quotes on command line instead
# setopt no_bang_hist

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="kolo"

##~ PATH STUFF ~##
# shellcheck source=/dev/null
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

##~ EDITORS ~##
export EDITOR=code
alias zshconfig="$EDITOR ~/.zshrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias envedit="$EDITOR ~/.env"

function sbl() {
    DIR=${PWD##*/}
    if [ -f "$DIR.sublime-project" ];then
        subl "$DIR.sublime-project"
    else
        subl .
    fi
}

##~ OSX ~##
# use command + shift + '.' to hide/show hidden files

##~ TERMINAL ~##
# alias hub as git
# this outputs "alias git=hub"
eval "$(hub alias -s)"

# alias caen="ssh brownman@login.engin.umich.edu"
alias sz="source ~/.zshrc"
alias http="python -m SimpleHTTPServer 1234"
alias py="ptpython"
alias watch="sass --watch ."
alias mip="ifconfig |grep inet"
alias ip="curl http://ipecho.net/plain ;echo"
alias ms="bundle exec middleman server"
alias fact="open https://en.wikipedia.org/wiki/$(date +%B_%m)"
alias xtime="wget http://c.xkcd.com/redirect/comic/now; open ./now; read; rm ./now;"
alias cda="cd -"
alias wj="warriorjs"
alias sf="standard --fix"
function ee()
{
    export $(cat .env)
}
# pretty print json
# eg: echo '{"a": 1}' | ppj
alias ppj="python -m json.tool"
alias viet="sudo vi /etc/hosts"
alias pir="pip install -r requirements.txt"
function sha256()
{
    # should edit this to also only output the sha or just sha and filename
    shasum -a 256 "$1"
}
function port()
{
    lsof -i ":$1"
}

# takes tag of a docker container and runs bash in said container
# investigate a container
function inv()
{
    docker run -it --rm "$1" bash
}

function run()
{
    docker run --rm "$1"
}
alias brewedit="$EDITOR $DOTFILES/Brewfile"

##~ DOCKER COMPOSE ~##
alias dc="docker-compose"
alias dcud="docker-compose up -d"
alias dcl="dc logs -f --tail=\"500\" web worker"
alias docker-clean="docker ps -a -q -f status=exited | xargs docker rm && docker images -q --filter \"dangling=true\" | xargs docker rmi"
# fix docker drift!
alias drift="docker run --rm --privileged alpine hwclock -s"

##~ RUBY ~##
function gemdeploy()
{
    rm ./*.gem
    gem build "$(echo ./*.gemspec)"
    read -r "push?Do you want to push to RubyGems? "
    # shellcheck disable=SC2154
    if [[ "$push" =~ ^[Yy]$ ]]
    then
        gem push "$(echo ./*.gem)"
    fi
}

##~ SINATRA ~##
alias cig='lsof -i :4567'

function sin()
{
    if [ -f ./Procfile.dev ]; then
        foreman start -f Procfile.dev
    else
        sinatra
    fi
}

function sinatra()
{
    if [ -f ./config.ru ]; then
        rerun "bundle exec rackup -p 4567" -p "**/*.{rb,js,coffee,css,scss,erb,html,haml,ru,yml,json}"
    else
        rerun "bundle exec ruby ${PWD##*/}.rb" -p "**/*.{rb,js,coffee,css,scss,erb,html,haml,ru,yml,json}"
    fi
}

##~ PYTHON ~##
export WORKON_HOME=~/.virtualenv
source /usr/local/bin/virtualenvwrapper.sh

##~ NODE ~##
function nod()
{
    if [ -f ./Procfile.dev ]; then
        foreman start -f Procfile.dev
    else
        nodemon
    fi
}

function renpm()
{
    rm -rf node_modules && npm i
}

alias jsnew="npm init -y && tsc --init && touch \$(cat package.json|jq -r '.main')"

##~ GIT ~##
alias g="git"
alias purr="git pull --rebase"
alias gs="git status"
alias gt="git log --graph --oneline --decorate"
alias gpt="git push && git push --tags"

alias gq="git commit -m"
function ggg() { git add --all .; git commit -m "$1"; }
function gug() { git add -u .; git commit -m "$1"; }
alias ch="git checkout"
# nb instructions: `nb $BRANCH`
alias nb="git push -u origin"
# stolen from Nick Quinlan
alias pushit="open -g spotify:track:0GugYsbXWlfLOgsmtsdxzg; git push"

alias disc="git reset --hard"

function b() {
    if [ -f build.sh ];then
        ./build.sh "$@"
    elif [ -f build ];then
        ./build "$@"
    elif [ -f package.json ] && [ "$(< package.json|jq '.scripts.build')" != "null" ];then
        npm run build
    else
        echo "Can't guess build method, do it yourself"
    fi
}

# alias t="ruby spec/test.rb"
function t() {
    if [ -f spec/test.rb ];then
        ruby spec/test.rb
    elif [[ ${PWD##*/} =~ 'zapier' ]];then
        zapier test --very-quiet
    elif [ -f package.json ];then
        # could check if test key is defined, but since npm supplies it by default, it's fine
        npm test
    else
        echo "Can't guess testing method, do it yourself"
    fi
}

# push and set upstream branch
# this doesn't work with my config?
# function gpu() {
#     BRANCH=$(git rev-parse --abbrev-ref HEAD)
#     echo $BRANCH
#     git push -u origin "$BRANCH"
# }

function chb() {
    git checkout -b "$1"
    git push -u origin "$1"
}

# update remote to match new username
function rem() {
    [[ $(git remote get-url origin) =~ /(.*)\.git$ ]] &&
    # this breaks if we pay attention to shellcheck
    git remote set-url origin "git@github.com:xavdid/$match[1].git"
}

# adapted from http://www.reddit.com/2e513y
function gi()
{
    VAL=$(curl https://www.gitignore.io/api/"$*")
    if [ "$1" = 'list' ];then
        echo "$VAL"
    else
        echo "$VAL" > .gitignore
    fi
}

##~ HEROKU ~##
alias gphm="git push heroku master"
alias hcp="heroku config:pull"
alias hmo="heroku maintenance:on"
alias hmof="heroku maintenance:off"
alias hl="heroku plugins:link ."

function mongolab()
{
    URI=$("$DOTFILES"/util/mongolab.rb "$1")
    if ! [ -z "$URI" ]; then
        eval mongo "$URI"
    else
        echo 'No .env found'
    fi
}

##~ RAILS ~##
alias rs="rails server"
alias rc="rails console"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

# shellcheck disable=SC2034
# zsh-better-npm-completion
plugins=(gitfast sublime brew docker gem sudo)

##~ RIQ ~##
function work()
{
    true
}

##~ ZAPIER ~##
function fupdate() {
    DTE=$(date +%-Y-%m-%d)
    FNAME="/Users/david/Dropbox/Apps/Editorial/Zapier/$DTE.md"
    echo "## This Week\n\n* \n\n## Next Week\n\n* \n\n## Offline\n\n* \n\ntldr()" > $FNAME
    $EDITOR $FNAME
}

function finn() {
    # DTE is still set from before
    UPDATE_PATH="/Users/david/Dropbox/Apps/Editorial/Zapier"
    mv "$UPDATE_PATH/$DTE.md" "$UPDATE_PATH/friday/$DTE.md"
    echo "Done! Slack message soon"
}

##~ BLACK PEARL ~##
function home()
{
    export DROPBOX=/Users/david/Dropbox
    export DOTFILES=$DROPBOX/Saves/dotfiles
    export PROJECTS_ROOT=$HOME/projects

    function mag() {
        pbpaste > "$DROPBOX/To Plex/thing-$(date -u +"%Ss").magnet"
    }

    alias db="cd \$DROPBOX"

    ## CUSTOM GIT ##
    function clo() { git clone git@github.com:xavdid/"$1".git; }
}

if [[ $LOC = RIQ ]]; then
    work
elif [[ $LOC = TBP ]]; then
    home
fi

source "$ZSH"/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

export NVM_DIR="/Users/david/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
echo $(nvm version default) > ~/.nvm_default
# see: https://github.com/creationix/nvm/issues/110#issuecomment-190125863
autoload -U add-zsh-hook
load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
        if [[ $(nvm current) != $(cat .nvmrc) ]];then
            nvm use
        fi
    elif [[ $(nvm current) != $(cat ~/.nvm_default) ]]; then
        # need to update when I update nvm default version
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc

# add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# compsys initialization
autoload -U compinit
compinit
