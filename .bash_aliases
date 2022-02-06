# Utilities
alias copy='xclip -sel clip'

config () {
     /usr/bin/git --git-dir=/home/clement/dotfiles/ --work-tree=/home/clement "$@"
}


# Emacs
alias em='emacs -nw'

# PHP
alias switchphp='sudo update-alternatives --config php'

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

# Format
alias format='composer format'

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

# Docker
alias dc='docker-compose'
alias dc:rebuild='dc up -d --force-recreate --build'
alias dc:bash='docker exec -it -u $(id -u):$(id -g) ${PWD##*/} /bin/bash'
alias d='docker-compose exec -u $(id -u):$(id -g) php-fpm '

alias d:pu='d vendor/bin/phpunit'
alias d:puf='d vendor/bin/phpunit --filter'

alias d:install='d composer install'

alias d:artisan='d php artisan'
alias d:tinker='d php artisan tinker'
alias d:mfs='d php artisan migrate:fresh --seed'
alias d:migrate='d php artisan migrate'
alias d:rollback='d php artisan migrate:rollback'
alias d:dump='d php artisan dump-server'
alias d:routes='d php artisan route:list'
alias d:run='d php artisan queue:work'
alias d:test='d php artisan test'
alias d:testf='d php artisan test --filter'

# Directories
alias cd:config='cd ~/ubuntu-config'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

open() {
 nautilus . &
}

webup() {
    sudo service nginx start
    sudo service mysql start
    sudo service redis start
}

webdown() {
    sudo service redis stop
    sudo service mysql stop
    sudo service nginx stop
}

