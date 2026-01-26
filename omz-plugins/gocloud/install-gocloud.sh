if [ ! -d ~/.oh-my-zsh/custom/plugins ] ; then
   echo "Oh-My-Zsh config folder not present."
   exit 1
fi

# Backup .zshrc
cp ~/.zshrc .

if [ ! -f .zshrc ] ; then
   echo "Could not make backup of .zshrc"
   exit 2
fi

# Create Folder
mkdir ~/.oh-my-zsh/custom/plugins/gocloud

# Copy files
cp _gocloud ~/.oh-my-zsh/custom/plugins/gocloud
cp gocloud.plugin.zsh ~/.oh-my-zsh/custom/plugins/gocloud

# Modify .zshrc
{
  echo 
  echo "# Make sure MY autocomplete rules are loaded"
  echo "autoload -U compinit && compinit"
} >> ~/.zshrc

echo "Plugin Installed: gocloud"
echo 
echo "To enable this plugin, please add this line"
echo "to your plugins section on ~/.zshrc file:"
echo "plugins+=(gocloud)"
echo
