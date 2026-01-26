# How to install gocloud custom plugin

To install this plugin use the provided `install-gocloud.sh` script, or follow the instructions below if you want to do a manual install.

## Move plugins to Oh-My-Zsh

```shell
# Create Folder
mkdir ~/.oh-my-zsh/custom/plugins/gocloud

# Copy files
cp _gocloud ~/.oh-my-zsh/custom/plugins/gocloud
cp gocloud.plugin.zsh ~/.oh-my-zsh/custom/plugins/gocloud
```

## Modify your ~/.zshrc

```shell
# Backup .zshrc
cp ~/.zshrc .

# Modify .zshrc
echo "# Make sure MY autocomplete rules are loaded" >> ~/.zshrc
echo "autoload -U compinit && compinit" >> ~/.zshrc
```

## Activate plugin

Add this to your plugins configuration on your `~/.zshrc` file:

```
plugins+=(gocloud)
```
