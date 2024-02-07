#!/bin/zsh

if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile; then
    cat <<EOF >>~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
EOF
    wait
fi

if ! command -v brew &>/dev/null; then
    echo $PASSWORD | sudo -S cd # work around to allow NONINTERACTIVE=1
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    wait
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
wait

brew install --no-quarantine expect tldr speedtest-cli fd tree stats git yarn nvm zsh bat lsd imagemagick python3 hudochenkov/sshpass/sshpass
wait
brew install --no-quarantine --cask readdle-spark yippy rectangle disk-drill todoist visual-studio-code slack bartender cheatsheet openinterminal zoom iterm2 airflow shottr aldente alt-tab google-drive appcleaner discord iina keka imageoptim muzzle joplin popclip alfred spotify swish viber 1password topnotch
wait

brew tap homebrew/cask-fonts
wait
brew install --no-quarantine --cask font-fira-code font-hack-nerd-font
wait
brew tap homebrew/cask-versions
wait
brew install --no-quarantine --cask firefox-developer-edition
wait

brew upgrade
wait
brew cleanup
wait

curl -L -O ~/Downloads/RedQuits_v2.pkg "http://redquits.s3.amazonaws.com/RedQuits_v2.pkg"
wait

curl -L -O ~/Downloads/jre-8u401-macosx-aarch64.dmg "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249543_4d245f941845490c91360409ecffb3b4"
wait

curl -L -O ~/Downloads/BrotherPrinterDrivers_ML17_1_6_0.dmg "https://download.brother.com/welcome/dlf104836/BrotherPrinterDrivers_ML17_1_6_0.dmg"
wait

curl -L -O ~/Downloads/KekaExternalHelper.zip https://d.keka.io/helper
wait

curl -L -O ~/Downloads/Clyde+1.0.dmg https://theclyde.app/s/Clyde10.dmg
wait

echo "All applications have been downloaded!"
