#!/bin/bash

ssh_key_file=~/.ssh/id_ed25519

if [ ! -f "$ssh_key_file" ]; then
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$ssh_key_file" -N "$PASSWORD"
  wait
fi

eval "$(ssh-agent -s)"
wait

config_file=~/.ssh/config
if [ ! -e "$config_file" ]; then
  touch "$config_file"
  wait
fi

cat <<EOF >>"$config_file"
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $ssh_key_file
EOF
wait

expect -c "
spawn ssh-add --apple-use-keychain $ssh_key_file
expect \"Enter passphrase for\"
send \"$PASSWORD\r\"
expect eof
"
pbcopy <~/.ssh/id_ed25519.pub

echo "SSH key copied to clipboard!"
