# macOS Dev Toolkit Setup

This repository contains the documentation for my macOS Setup for Development.
It is intended as a guide for setting up new machines.

## Initial Machine Setup

The instructions for the initial setup of the machine is contained in
[this document](https://github.com/moisoto/macOS-dev-setup/blob/main/initial-setup.md).

Some of the software described in the following sections will be installed by following
the instructions provided in it.

## Software Configuration

Some of the software we installed needs additional configuration.
I've included a separate document describing this
[Post-Configuration](https://github.com/moisoto/macOS-dev-setup/blob/main/post-config.md) process.

## Package Manager

I prefer [Homebrew](https://brew.sh) for managing packages on MacOS

### Homenrew Package List:

These are my current setup packages. Installed as part of the
[Initial Setup Instructions](https://github.com/moisoto/macOS-dev-setup/blob/main/initial-setup.md).

* System Monitoring
  * **htop** - Improved top (interactive process viewer)
  * **btop** - Resource monitor. C++ version of bashtop and bpytop
  * **asitop** - Perf monitoring CLI tool for Apple Silicon
  * **fastfetch** - Like neofetch, but much faster because written mostly in C
<br>

* Misc Utils
  * **bat** - Clone of cat(1) with syntax highlighting and Git integration
  * **eza** - Modern, maintained replacement for ls
  * **freetds** - Libraries to talk to Microsoft SQL Server and Sybase databases
  * **fzf** - General purpose command-line fuzzy finder
  * **glow** - Render markdown on the CLI
  * **gum** - Tool for glamorous shell scripts
  * **jq** - Lightweight and flexible command-line JSON processor
  * **wget2** - Successor of GNU Wget, a file and recursive website downloader
  * **todo-txt** - Minimal, todo.txt-focused editor
  * **klog** - Command-line tool for time tracking in a human-readable, plain-text file format
  * **pinentry-mac** - Pinentry for GPG on Mac
  * **chezmoi** - Dot-files manager
<br>

* GNU Commands
  * **gawk** - GNU awk utility
  * **gnu-sed** - GNU implementation of the famous stream editor
<br>

* Languages & Tools
  * **uv** - An extremely fast Python package and project manager, written in Rust.
  * **python** - _Installed via uv_ - Interpreted, interactive, object-oriented programming language
  * **poetry** - Python package management tool
  * **hugo** - Configurable static site generator
  * **mosh** - Remote terminal application
  * **tmux** - Terminal multiplexer
  * **rbenv** / ruby - Powerful, clean, object-oriented scripting language
  * **lazygit** - A simple terminal UI for git commands

<br>

* Others
  * **cmake** - Cross-platform make
  * **hyperfine** - Command-line benchmarking tool
  * **llama.cpp** - LLM inference in C/C++
  * **msodbcsql17** - ODBC Driver for SQL Server v17
  * **msodbcsql18** - ODBC Driver for SQL Server v18
  * **pkgconf** - Package compiler and linker metadata toolkit
  * **pkl** - CLI for the Pkl programming language
  * **tmuxinator** - Create and manage tmux sessions easily

## Terminal Programs

* Current Favorite: [iTerm 2](https://iterm2.com)
* Currently Testing: [Ghostty](https://ghostty.org)
* iPad Friendly: [Termius](https://apps.apple.com/do/app/termius-modern-ssh-client/id1176074088)


## Terminal Customization

* Shell Management Framework: [Oh My Zsh!](https://ohmyz.sh)
* Shell Theme: [PowerLevel10K](https://github.com/romkatv/powerlevel10k)
* Mobile Shell: [Mosh](https://mosh.org)
* Terminal Multiplexer: [TMUX](https://github.com/tmux/tmux/wiki)

## Editors

* Text & Misc Files: [BBEdit](https://apps.apple.com/do/app/bbedit/id404009241)
* Programming: [Visual Studio Code](https://code.visualstudio.com)
* Markdown: [Obsidian](https://obsidian.md)
* Terminal:
  * [Vim](https://www.vim.org) (preinstalled on macOS)
  * [NeoVim](https://neovim.io) (download install preferred)
  * [Helix](https://helix-editor.com) (brew install preferred)

## Programming Languages & Tools

* [Xcode](https://developer.apple.com/xcode/)
* [Go Language](https://go.dev/dl/)
* [RBENV (Preferred way to install Ruby on macOS)](https://rbenv.org)
* [Ruby (Alternatively install via Homebrew](https://www.ruby-lang.org/en/)
* [CocoaPods (Installed via Ruby)](https://cocoapods.org)
* [Flutter (Install via VSCode Plugin)](https://flutter.dev)
* [Android Studio](https://developer.android.com/studio)
* [IntelliJ Idea CE](https://www.jetbrains.com/idea/download/?section=mac)
* [Clion](https://www.jetbrains.com/clion)
* [Unity](https://unity.com/download)
* [Node.js](https://nodejs.org/en/download)

## Database Management Tools

* Daily Driver: [DBeaver CE](https://dbeaver.io/download/)
* Very Nice Alternative: [DbGate Community](https://dbgate.org)

# Productivity Software

* [Windows App](https://apps.apple.com/do/app/windows-app/id1295203466?l=en-GB)
* [Microsoft 365](https://apps.apple.com/do/app-bundle/microsoft-365/id1450038993?l=en-GB)
* [Docker Desktop Personal](https://www.docker.com/products/docker-desktop/)
* [Filezilla](https://filezilla-project.org/)


## AI Tools

### GUI Tools

* [ChatGPT](https://chatgpt.com/download)
* [Claude](https://claude.ai/download)
* [Grok (WebApp)](https://grok.com)

### Cli Tools

* [Gemini Cli](https://github.com/google-gemini/gemini-cli)

