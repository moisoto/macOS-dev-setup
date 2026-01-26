# Configuring Commit Signing

You can sign your commits with GPG so that others can verify
that a given commit really belongs to you.

You can then send your public GPG key to others or load it into
your favorite web repository (Github, Gitlab, etc).

## Install gpg

GPG should be installed as a dependency of previously installed
packages but let's check anyways:

```shell
brew info gnupg
which gpg
```

If it's not installed:

```shell
brew install gnupg
```

## Generate your GPG Key
```shell
gpg --full-generate-key
```

## List your keys

List your keys and take note of the key in the sec section

```shell
gpg --list-secret-keys --keyid-format LONG
```

## Export Key

Export Key and load into GitHub

```shell
gpg --armor --export [key_id]
```

## Set pinentry-program

This will tell gpg to use `pinentry-mac` for capturing your gpg Pass-Phrase.
You can tell `pinentry-mac` to store your Pass-Phrase into your macOS key-chain.

```shell
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >>  ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
```
