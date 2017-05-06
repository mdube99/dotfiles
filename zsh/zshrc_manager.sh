time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

echo "Updating rc files"
(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)
source ~/dotfiles/zsh/zshrc.sh