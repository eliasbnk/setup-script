#!/bin/bash

read -p "Enter your full name: " fullname
read -p "Enter your email address: " email
read -s -p "Enter your password: " password
echo
export FULLNAME="$fullname"
export EMAIL="$email"
export PASSWORD="$password"

chmod 755 ./setup_brew_applications.sh ./setup_terminal.sh ./setup_vscode.sh ./setup_ssh_git.sh
wait

./setup_brew_applications.sh
wait
./setup_terminal.sh
wait
./setup_vscode.sh
wait
./setup_ssh_git.sh

nvm install node
wait

nvm use node
wait

defaults write com.apple.dock autohide-time-modifier -float 0 && Killall Dock
wait

defaults write com.apple.Dock autohide-delay -float 0 && Killall Dock
wait

unset FULLNAME
wait
unset EMAIL
wait
unset PASSWORD
wait

echo "Setup complete!"
