set SSH_EMAIL (read -P "Enter email address for SSH key: ")
set PASSPHRASE (env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 100)
set OUTPUT_LOCATION $HOME/.ssh/id_ed25519

# Generate key
ssh-keygen -t ed25519 -C $SSH_EMAIL -N $PASSPHRASE -f $OUTPUT_LOCATION

# Add key to keychain
ssh-add --apple-use-keychain $OUTPUT_LOCATION

# Add to config
echo " Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile $OUTPUT_LOCATION" >> $HOME/.ssh/config 
