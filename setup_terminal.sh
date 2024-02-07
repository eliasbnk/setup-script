#!/bin/zsh

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

if [ -f ~/.zshrc ] && [ -w ~/.zshrc ]; then
    curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | zsh
    wait
else
    touch ~/.zshrc
    curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | zsh
    wait
fi

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
wait
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
wait

if [ ! -d "$ZSH_CUSTOM/plugins" ]; then
    mkdir -p "$ZSH_CUSTOM/plugins"
    wait
fi

cd "$ZSH_CUSTOM/plugins"
wait

git clone https://github.com/zsh-users/zsh-autosuggestions
wait
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
wait
git clone https://github.com/paulirish/git-open.git
wait

cd ~
wait
touch .hushlogin
wait

if [ -f ~/.zshrc ] && [ -w ~/.zshrc ]; then

    cat <<EOF >~/.zshrc
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="spaceship"

plugins=(zsh-autosuggestions zsh-syntax-highlighting git-open git colored-man-pages command-not-found)

source $ZSH/oh-my-zsh.sh


alias buc="brew update && brew upgrade && brew cleanup"

alias gap="git add -p"

alias connect="~/Developer/scripts/connect.sh"

alias transfer="~/Developer/scripts/transfer.sh"

alias assignmnet="~/Developer/scripts/new_assignment.sh"

alias lecture="~/Developer/scripts/new_lecture.sh"

alias setup="~/Developer/scripts/setup_college.sh"

alias ls="lsd"

alias cat="bat"

alias pip="pip3"

alias python="python3"

alias pi="pip3"

alias py="python3"

alias gaa="git add ."

alias gd="git diff"

alias gi="git init"

alias gl="git log"

alias gpll="git pull"

alias gp="git push"

alias gpom="git push origin master"

alias gss="git status -s"

alias path='echo -e ${PATH//:/\n}'

alias ya="yarn"

alias yar="yarn remove"

alias ys="yarn start"

alias yad="yarn add"

alias yiy="yarn init -y"

alias sp="open -a Spotify"

alias sl="open -a Slack"

alias sett='open -a "System Preferences"'

alias it='open -a iTerm'

alias apst='open -a "App Store"'

alias a="code"

alias aa="code ."

alias l="ls" # List files in the current directory

alias ll="ls -lah" # List all files in the current directory in long list format

alias oo="open ."

alias o="open" # Open the current directory in Finder

alias c="clear"

alias cl="clear"

alias e="exit"

alias dd="cd /Users/$(whoami)/Developer/repos"

alias S="sudo"

alias vsn="code -n"

alias vs="code ."

alias gcb='echo -e "\033[1;32m New branch name?" &&  read branchname &&git checkout -b $branchname'

alias gcc='echo-e "\033[1;32m To what branch do you want to switch?" && read branchname && git checkout $branchname'

alias gc='echo -e "\033[1;32m Link to Repository you want to clone/download?" &&  read link && cd ~/Developer/repos && git clone $link'

alias app='echo -e "\033[1;32m React App Name?" &&  read name && cd ~/Developer/repos && npx create-react-app $name &&  cd $name &&  code . && npm start'

alias gra='echo -e "\033[1;32m Repository Link?" &&  read link &&  git remote add origin $link'

alias gfp='echo -e "\033[1;32m To which Repository-Branch do you want to push?" &&  read branch && git fetch origin $branch && git push -u origin $branch'

alias gcm='echo -e "\033[1;32m What is your commit message (what have you done, changed, or need to do) ?" && read message && git commit -m "$message"'

alias gs="git status -uno"

alias gru="git remote update"

alias logisim="java -jar ~/Developer/tools/logisim310.jar"

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
EOF

else
    echo "Error: ~/.zshrc does not exist or is not writable." >&2
fi

source ~/.zshrc
wait

echo "Terminal has been setup!"
