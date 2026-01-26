repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "Error: not inside a git repository"
  exit 1
}

# Make sure we are on the repo root folder
if [[ "$repo_root" != "$(pwd)" ]]; then
  echo "Not in repo root. Moving into it."
  cd "$repo_root" || exit 1
fi

submodule="chezmoi"
cd $submodule
git pull
cd ..
git add $submodule
git commit -m "Update submodule $submodule"
