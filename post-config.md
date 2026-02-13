# Post Configuration Instructions

This document contains instructions to configure
the software installed by the Initial Setup Document.

## Using uv to install Python

In a fresh machine you will have the system python installed.
Also, when you install Poetry using homebrew it will also install
Python 3.14 from homebrew.

Since uv will use the version of python on your path, you don't
really need to install python via uv. However in case you want to
install a specific version of python you can use uv to do so:

```shell
# Install Python@3.13
uv python install 3.13

# Install multiple versions
uv python install 3.11 3.12
```

## Configuring Poetry

### About Python 3.14 dependency

Currently, poetry has Python 3.14 as a dependency.
This means homebrew will also install Python 3.14.2 (or later).


### Store Virtual Environments inside projects
```shell
# Set to true
poetry config virtualenvs.in-project true

# Check config value
poetry config virtualenvs.in-project
```

### Configure Poetry Autocompletion for Oh-My-Zsh:

First generate the autocompletion scripts in the proper location:

```shell
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

Now, add poetry to your plug in list on .zshrc script:

```config
# It should look something like this:
plugins=(dircycle wd git golang iterm2 zsh-autosuggestions zsh-syntax-highlighting poetry)
plugins+=(gocloud)
```

> **Note:** <br>
> I noticed that when you run the command `poetry completions zsh` the last
> line of the file that contains the `compdef` command should end with
> just `poetry`, but instead it actually generated something
> like `my_current_path/poetry`, in that case you change it to
> just `poetry` at the end.

### Using specific Python version from uv

When needed, you can set the Python version to use on a Poetry project.
This is done with the `poetry env use` command. However if you have uv
installed you can use uv as a helper for specifying the version.

This can be done as follows:

```shell
# Use Python 3.13 for current project
poetry env use $(uv python find 3.13)
```

> **Note:** <br>
> This will work wether this Python version was installed via homebrew or
> via uv, which is pretty convenient for users of both Poetry and uv.


## Configuring rbenv

### Update shell initialization script:

```shell
rbenv init
```
Exit your shell and start a new one.

### List Ruby Versions and Install latest one.

List versions:
```shell
rbenv install -l
```

Install specific version (i.e. 3.4.5):
```shell
# Install Ruby
rbenv install 3.4.5

# Activate it as the global version
rbenv global 3.4.5
```

Exit your shell and start a new one.
Then verify the version is loaded properly:
```shell
# Check path location
which ruby

# Check version
ruby --version
```

Please note that the System Ruby install used by some macOS tools is still installed (usually at `/usr/bin`) and used directly by these tools.

## Install chezmoi and perform dotfiles configuration

We now need to perform dotfiles configuration.
For this we will use a tool called chezmoi.
It should be already installed if you used the
script [inst-brew-pkgs.sh](https://github.com/moisoto/macOS-dev-setup/blob/main/inst-brew-pkgs.sh).

### Initialize chezmoi with config files

First let's initialize our chezmoi repo:

```shell
# This will clone the repo into chezmoi
chezmoi init https://github.com/moisoto/dotfiles.git
```

### Point to your remote

When you run chezmoi in the previous way, it will clone the repo you specify.
This repo will have the remote you specified on the command. It is recommended
that you make it point to a personal repo (maybe even a private one).

**First create an empty repo called _dotfiles_ using your github account.**

Then execute these commands:

```shell
# Go to chezmoi repo folder
chezmoi cd

# Point to your repository
GITHUB_USERNAME="your-github-account"
git remote set-url origin git@github.com:$GITHUB_USERNAME/dotfiles.git

# Push into your new repo
git branch -M main
git push -u origin main

# Check new remote
git remote -v
```

### Configure chezmoi

Before applying the changes you need to configure chezmoi with some
information it will need.

Create chezmoi configuration file:

```shell
# Go to chezmoi repo folder
chezmoi cd

# Create config file
./cr_config.sh
```
**Note:** For more information about the configuration file entries please refer
to the [chezmoi repo documentation](https://github.com/moisoto/dotfiles/blob/main/README.md).

### Apply changes to configuration files

Now that we have the chezmoi configuration in place, let's create the config files.
First check the changes that will be made:

```shell
chezmoi diff
```

Now apply them:

```shell
chezmoi apply
```

## About Rust

In this guide I've not included rustup. However in case it's part of your toolchain, there's a few things I would clarify here.

### Moving environment setup from .zshenv

When installing `rustup` it will add the following to your .zshenv and .profile files:

```shell
. "$HOME/.cargo/env"
```

Most other tools will use `.zprofile` instead of `.zshenv`, it makes sense to move this to .zprofile, where it will be executed. Since the order of execution of these files is `.zshenv → .zprofile → .zshrc → .zlogin`, I decided to put this call at the start of the `.zprofile` file.

The main reason to do this is having a more standardized pattern. For example the `uv` installation uses `.profile`, while `homebrew` and `rbenv` use `.zprofile`. Moving rustup environment setup from `.zshenv` to `.zprofile` keeps everything tidy and in one single place.
