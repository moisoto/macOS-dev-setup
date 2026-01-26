if [ "$1" == "" ] ; then
    echo "Must Specity Sign Key"
    echo "Syntax: $0 [sign-key]"
    exit
fi

signkey=$1

# Set user info
git config --global  user.name "Moises Soto" 
git config --global  user.email "35436843+moisoto@users.noreply.github.com"

# Set gpgsign info
git config --global user.signingkey $signkey 
git config --global commit.gpgsign true
#git config --global gpg.program /opt/homebrew/bin/gpg

# Set diff context (default is 3)
git config --global diff.context 5

# Set AutoCRLF to input globally
git config --global core.autocrlf input

# Always use ssh when importing moisoto/utils from github
git config --global url."ssh://git@github.com/moisoto/utils".insteadOf https://github.com/moisoto/utils

echo "Git custom configuration completed."
echo "Your new git config is as follows:"
git --no-pager config --list --show-origin
echo "------------"
echo
