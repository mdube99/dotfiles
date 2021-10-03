# git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare

# Edit and rerun
	function edit_and_run() {
		BUFFER="fc"
		zle accept-line
	}
	zle -N edit_and_run
	bindkey "^v" edit_and_run

# Enter
	function enter_line() {
		zle accept-line
	}
	zle -N enter_line
	bindkey "^o" enter_line

# Exit tmux-pane
	function exit_tmux() {
        BUFFER="exit"
		zle accept-line
	}
	zle -N exit_tmux
	bindkey "^q" exit_tmux

# Exit tmux-session
	function tmux_kill_session() {
        BUFFER="tmux kill-session"
		zle accept-line
	}
	zle -N tmux_kill_session
	bindkey "^k" tmux_kill_session

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo

# Run last command again
	function runLastLine() {
        # Get previous history item
        zle up-history
        # confirm command
		zle accept-line
	}
	zle -N runLastLine
	bindkey "^n" runLastLine

    # Home - Navigates to the current root workspace
    function git_root() {
        BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
        zle accept-line
    }
    zle -N git_root
    bindkey "^h" git_root
