# Utilities
alias copy='xclip -sel clip'
alias vim='nvim'
alias em='emacsclient --tty'
alias emacs='emacsclient -c -a "emacs"'
alias sudo='sudo '
alias ranger='. ranger'
alias bat='bat --theme=GitHub'
alias start-printer='sudo systemctl start cups'
alias ocr='flameshot gui --raw | tesseract stdin stdout -l eng+fra | xclip -in -selection clipboard'
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
# alias nah='git reset --hard; git clean -df;'

nah() {
    echo -n "Are you sure you want to clear all changes in git? (yes/no):"
    read response
    if [ "$response" = "yes" ]; then
        echo "Resetting changes in git..."
        git reset --hard HEAD;
        git clean -df;
        echo "Changes cleared successfully."
    else
        echo "Operation aborted."
    fi
}

gac() {
    git add --all && git commit -m "$*"
}
alias gcd='git checkout develop'
alias gcm='git checkout main'
gca() {
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done
}

# Tests
alias phpunit='vendor/bin/phpunit'
alias pu='phpunit'
alias puf='phpunit --filter'

# Laravel
alias logs='tail -f -n 450 storage/logs/*.log | grep -i -P "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}'

alias t='php artisan test'
alias tf='php artisan test --filter'
alias dusk='php artisan dusk'
alias duskfs='php artisan dusk:fails'
alias duskf='php artisan dusk --filter'

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
           mailpit \
           redis \
           soketi \
          meilisearch 
}
