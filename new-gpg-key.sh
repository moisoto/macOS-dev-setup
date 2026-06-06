#!/bin/zsh

if [[ "$2" == "" ]] ; then
    echo "There are missing parameters"

    echo "Syntax:  $0 \"Some User (comment) <some@email.com>\" \"PASSPHRASE\""
    echo "Example: $0 \"Test User (For GitHub Commits) <12345678+test@users.noreply.github.com>\" \"mystrongpass\""
    exit
fi

chk-err() {
  local result=$1
  local keytype=$2

  if [[ $result -ne 0 ]]; then
    echo "Error: $keytype Key generation failed"
    return 1
  fi

  echo "$keytype Key created successfully!"
  return 0
}

uid=$1
pp=$2

echo "Creating Key for user: $uid"
echo

gpg --batch --pinentry-mode loopback --passphrase "$pp" --quick-gen-key "$uid" ed25519 cert never
if ! chk-err $? "Master"; then exit 1; fi

local fpr=$(gpg --list-secret-keys --with-colons "=$uid" 2>/dev/null | awk -F: '/^fpr:/ {print $10; exit}')
if [[ -z "$fpr" ]]; then
  echo "Error: Could not extract fingerprint"
  exit 1
fi

# Signing subkey (no expiration)
gpg --batch --pinentry-mode loopback --passphrase "$pp" --quick-add-key $fpr ed25519 sign never
if ! chk-err $? "Signing"; then exit 1; fi

# Encryption subkey (no expiration)
gpg --batch --pinentry-mode loopback --passphrase "$pp" --quick-add-key $fpr cv25519 encr never
if ! chk-err $? "Encryption"; then exit 1; fi

# Authentication subkey (optional, no expiration)
gpg --batch --pinentry-mode loopback --passphrase "$pp" --quick-add-key $fpr ed25519 auth never
if ! chk-err $? "Authentication"; then exit 1; fi
