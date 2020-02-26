# up
function up_widget() {
	BUFFER="cd .."
	zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# git
function git_prepare() {
	if [ -n "$BUFFER" ];
	then
		BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
	fi

	if [ -z "$BUFFER" ];
	then
		BUFFER="git add -A; git commit -v && git push"
	fi
				
	zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# home
function goto_home() { 
	BUFFER="cd ~/"$BUFFER
	zle end-of-line
	zle accept-line
}
zle -N goto_home
bindkey "^h" goto_home

# Edit and rerun
function edit_and_run() {
	BUFFER="fc"
	zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# LS
function ctrl_l() {
	BUFFER="ls"
	zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# Enter
function enter_line() {
	zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

c() {
	cd $1;
	ls;
}
alias cd="c"

#compdef _tmuxinator tmuxinator

_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _alternative \
      'commands:: _describe -t commands "tmuxinator subcommands" commands' \
      'projects:: _describe -t projects "tmuxinator projects" projects'
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|cp|c|debug|delete|rm|open|o|start|s|edit|e)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}


# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et


