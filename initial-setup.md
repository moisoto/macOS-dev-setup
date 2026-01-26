# Initial Machine Setup

Follow these instructions to perform the initial setup of your recently installed machine.

## Update MacOS & Install Initial Software

1. Verify if a macOS update is available and update.
2. Setup My Documents Folder to Sync with iCloud.
3. Install XCode & Command Line Tools. This mainly to install git and other cli tools needed for further steps.

> **Notes:**
> The current behavior on macOS Sequoia will ask you to setup iCloud Sync (step 2).
> Also when installing XCode it will automatically install Command Line Tools.

## Termimal Replacements & Powerups

### Choose a Terminal App

* The most stable: [iTerm 2](https://iterm2.com)
* The fast one (currently testing): [Ghostty](https://ghostty.org)
* The iPad Friendly: [Termius](https://apps.apple.com/do/app/termius-modern-ssh-client/id1176074088)

### Download Fonts

You'll need a [NerdFont](https://www.nerdfonts.com/font-downloads) for better results.

My current favorites are:

* [Patched Meslo NF](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k)
* [MesloLGS NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip)
* [JetBrains Mono NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)

For simplicity use the first link and install the 4 recommended files.

Remember to setup your font by going into iTerm2 -> Settings -> Profiles -> Text and selecting your font.

### Install Color Scheme

If you installed iTerm2, it is recommended you install a color scheme.

My current favorite is [iTerm 2 Material Design](https://www.iterm2material.design).
Just download the file and double click it. It will be open by iTerm 2.

After installation go into iTerm2 -> Settings -> Profiles -> Colors -> Colors Presets and select `material-design-colors`.

### Install Oh-My-Zsh

Install using curl using the command shown at [https://ohmyz.sh](https://ohmyz.sh/#install)

After installation completes, exit your shell and open a new one to start using Oh-My-Zsh.

### Install Powerlevel10k

Go to the [installation section of PowerLevel10k repository](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation)
and run the provided command in the Oh-My-Zsh section. The current one is:

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

After this, change the `ZSH_THEME` variable on your `~/.zshrc` file

```shell
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Configure Powerlevel10k

Save your ~/.zshrc file, exit your current session and open a new terminal window. Powerlevel10k configuration utility will be run automatically, you will be asked a few questions about how you want Powerlevel10k to be configured. These are my recommended settings but feel free to experiment (you can re-confifure your setup by executing the command p10k configure later on):

* **Prompt Style:** Rainbow
* **Show Current Time?:** No
* **Prompt Separator:** Angled
* **Prompt Head:** Sharp
* **Prompt Tails:** Slanted
* **Prompt Height:** Two Lines
* **Prompt Connection:** Disconnected
* **Prompt Frame:** No Frame
* **Prompt Spacing:** Sparse
* **Icons:** Many Icons
* **Prompt Flow:** Fluent

### Install & Configure Other Plugins

Let's Install a few plugins and configure them:

#### Auto Suggestion

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Syntax Highlight

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

With these now installed now change the plugins setting in your `~/.zshrc`:

```shell
plugins=(dircycle wd git golang iterm2 zsh-autosuggestions zsh-syntax-highlighting)
```

And add User Configuration section after the execution of $ZSH/oh-my-zsh.sh

```shell
# User configuration

# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=blue' ### MOVED TO User configuration after execution of oh-my-zsh.sh
```

## Installing Homebrew and Packages

Intall [Homebrew](https://brew.sh/) by using the command provided in the [website](https://brew.sh/).

The current command is:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation use the script [inst-brew-pkgs.sh](https://github.com/moisoto/macOS-Toolkit/blob/main/inst-brew-pkgs.sh) to install some useful packages:

```shell
# Run this inside the already cloned macOS-Toolkit repo
./inst-brew-pkgs.sh
```

> Notes:
> The script `inst-brew-pkgs.sh` has some optional packages that you can
> uncomment in case you want to install. Also in case you install tmux
> and tmuxinator, it's also recommended to add the corresponding plugins
> to your `.zshrc` file by adding `plugins+=(tmux tmuxinator)` below the
> previous assignments.

### Configure Git & Setup Github Access

**1. Create SSH key:**

```shell
ssh-keygen -t rsa -b 4096 -C "MoiSoto's Mac Mini <moises.soto@gmail.com>"
```

**2. Now, [configure git commit signing using gpg.](https://github.com/moisoto/macOS-Toolkit/blob/main/commit-sign.md)**

**3. Finally, let's run the provided [git-config.sh](https://github.com/moisoto/macOS-Toolkit/blob/main/git-config.sh) command:**

```shell
# Get sec key ID:
gpg --list-secret-keys --keyid-format LONG --with-colons | awk -F: '/^sec/ {print $5}'

# Run git-config.sh
./git-config.sh [your-sec-key]
```

#### Loading Keys to Github

You can setup the SSH and GPG keys on your github account.
The SSH Key will let you authenticate and access your repositories via ssh protocol.
The GPG key will let you sign your commits so they appear as verified.

To load the keys, go to the `Access -> SSH & GPG Keys` of your Github settings,
currently located at: [github.com/settings/keys](https://github.com/settings/keys)

> **Notes:**<br>
> You can have several SSH Keys (i.e. one per machine) loaded in a single account.<br>
> You can't have the same SSH Key on different accounts.<br>
> You can have several GPG Keys loaded in a single account.

### Finish configuring .zshrc

####  Installing Utilities

Clone the repo & configure:
```shell
cd ~/
git clone git@github.com:moisoto/icloud-utils.git
git clone git@github.com:moisoto/git-utils.git
cd git-utils
./set_aliases.sh
```

## Intall Node.js

While Node.js can be installed via homebrew. It is recommended to use the [official installation method](https://nodejs.org/en/download).

Here's a recap of the current procedure:

```shell
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.19.0".

# Verify npm version:
npm -v # Should print "10.9.3".
```

## Install Astral's uv

You can use homebrew to install uv, but the [official installation method](https://github.com/astral-sh/uv?tab=readme-ov-file#installation) is the preferred way.

Current install procedure is as follows:

```shell
# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
```

After installation, you can update uv using:

```shell
uv self update
```

For more information about uv please check the [official documentation](https://docs.astral.sh/uv/) website.


## Install Gemini-CLI

Gemini can be installed via Homebrew. However since we already have Node.js installed, it is recommended to follow the [official installation method](https://github.com/google-gemini/gemini-cli#-installation):

```shell
# Install Gemini CLI globally via npm
npm install -g @google/gemini-cli
```
