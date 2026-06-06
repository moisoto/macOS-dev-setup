# Configuring Commit Signing

You can sign your commits with GPG so that others can verify
that a given commit really belongs to you.

For this you need to create a gpg signing key and upload it into your favorite web repository (Github, Gitlab, etc).

GPG is a very powerful tool for secure data sharing. If you want to use it just for git commit signing just follow the instructions on this file.

However, if you plan to or already use gpg for other tasks, it is recommended that you follow [this expert gpg configuration guide](https://github.com/moisoto/macOS-dev-setup/blob/main/gpg-expert-config.md).

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

Select the recommended default options and you will generate a key that can be used for signing.
When specifying the mail, make sure you use a verified mail configured in your web repository service.

If you came using the link from the [Initial Setup](https://github.com/moisoto/macOS-dev-setup/blob/main/initial-setup.md)
documentation, you will find there specific instructions for github. Otherwise keep reading for more info about how to get your public key.


## List your keys

List your keys and take note of the key in the sec section

```shell
gpg --list-secret-keys --keyid-format LONG
```

## Export Public Key

To export the Public Key and load into your web repository service:

```shell
gpg --armor --export [key_id] | pbcopy
```

Notice how we pipe the output to the `pbcopy` utility, this will store the output on the clipboard so you can paste it elsewhere.

## Set pinentry-program

This will tell gpg to use `pinentry-mac` for capturing your gpg Pass-Phrase.
You can tell `pinentry-mac` to store your Pass-Phrase into your macOS key-chain.

```shell
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >>  ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
```
