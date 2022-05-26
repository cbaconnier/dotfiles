# Utilities
alias copy='xclip -sel clip'
alias em='emacs -nw'
alias sudo='sudo '
alas bat='bat --theme=GitHub'

dotfiles () {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
 

vapor () {
local VAPOR_PATH=~/.config/composer/vendor/bin/vapor
if [[ "$*" == *"production"* ]]; then
    /bin/echo -n "Enter \"${PWD##*/}\" to confirm: "
    read answer
    if [ "$answer" = ${PWD##*/} ]; then
	$VAPOR_PATH "$@"
    else
       echo "Failed"
    fi
else
    $VAPOR_PATH "$@"
fi
}


# GIT
alias nah='git reset --hard; git clean -df;'
gac(){
    git add --all && git commit -m "$*"
}
alias gcd='git checkout develop'
alias gcm='git checkout main'


# Tests
alias phpunit='vendor/bin/phpunit'
alias pu='phpunit'
alias puf='phpunit --filter'

# Laravel
alias logs='tail -f -n 450 storage/logs/*.log | grep -i -P "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}'

alias t='php artisan test'
alias tf='php artisan test --filter'
alias tinker='php artisan tinker'
alias mfs='php artisan migrate:fresh --seed'
alias art='php artisan'
alias tinker='php artisan tinker'
alias sail='bash vendor/bin/sail'

# Information
alias weather='curl -H "Accept-Language:fr" -s wttr.in/1044%20fey | sed -n "1,38p"'
alias meteo='weather'
alias myip='curl https://ipinfo.io/ip'
alias myssh='cat ~/.ssh/id_rsa.pub'
alias localip="hostname -I | cut -d' ' -f1"

webup() {
    sudo systemctl start docker
    docker start \
           mysql \
           minio \
           mailhog \
           redis  
}

