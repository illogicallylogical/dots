### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# source "$HOME/.zinit/plugins/zsh-users---zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=42069
SAVEHIST=42069
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/madman/.zshrc'
# -- Aliases
alias l="ls -la"

# OMZ Materials
_OMZ_SETTINGS(){
	# TheFuck alias
	eval "$(thefuck --alias eatass)"
}

local _OMZ_DIR_SOURCES=(
	# Plugins
	plugins/gitfast/
	plugins/pip/
	plugins/tmux/
	plugins/tmuxinator/
)

local _OMZ_FILE_SOURCES=(
	# Lib
	lib/compfix.zsh
	lib/completion.zsh
	lib/grep.zsh
	lib/spectrum.zsh
	lib/functions.zsh
	lib/git.zsh
	lib/termsupport.zsh
	# Plugins
	plugins/git/git.plugin.zsh
	plugins/autojump/autojump.plugin.zsh
	plugins/sudo/sudo.plugin.zsh
	plugins/urltools/urltools.plugin.zsh

)

_alias_tip_setting() {
	export ZSH_PLUGINS_ALIAS_TIPS_FORCE=0
	export ZSH_PLUGINS_ALIAS_TIPS_REVEAL_TEXT="Use this Alias: "
}

_enhancd_setting() {
	export ENHANCD_FILTER=fzf
}

_fzf_widgets_setting() {
	# Map widgets to key
	bindkey '^@'  fzf-select-widget
	bindkey '^@.' fzf-edit-dotfiles
	bindkey '^@c' fzf-change-directory
	bindkey '^@n' fzf-change-named-directory
	bindkey '^@f' fzf-edit-files
	bindkey '^@k' fzf-kill-processes
	bindkey '^@s' fzf-exec-ssh
	bindkey '^\'  fzf-change-recent-directory
	bindkey '^r'  fzf-insert-history
	bindkey '^xf' fzf-insert-files
	bindkey '^xd' fzf-insert-directory
	bindkey '^xn' fzf-insert-named-directory

  	## Git
  	bindkey '^@g'  fzf-select-git-widget
  	bindkey '^@ga' fzf-git-add-files
  	bindkey '^@gc' fzf-git-change-repository

	# GitHub
	bindkey '^@h'  fzf-select-github-widget
  	bindkey '^@hs' fzf-github-show-issue
	bindkey '^@hc' fzf-github-close-issue

	## Docker
	bindkey '^@d'  fzf-select-docker-widget
	bindkey '^@dc' fzf-docker-remove-containers
	bindkey '^@di' fzf-docker-remove-images
	bindkey '^@dv' fzf-docker-remove-volumes

	# Enable Exact-match by fzf-insert-history
	FZF_WIDGET_OPTS[insert-history]='--exact'

	# Start fzf in a tmux pane
	FZF_WIDGET_TMUX=1
}

_zsh_autosuggest(){
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=123,bg=177,underline,bold"
}

_zsh_history_substring_search_setting() {
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
  	bindkey -M vicmd 'k' history-substring-search-up
	bindkey -M vicmd 'j' history-substring-search-down
}

# ZSH Syntax Settings
# _zsh_syntaxhighlight(){
# }
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets main pattern regexp root)
# Main
ZSH_HIGHLIGHT_STYLES[alias]='fg=169,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=135'
# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=161'

# End of lines added by compinstall

# Load OMZ
for plug in ${_OMZ_FILE_SOURCES}
do
	zinit ice atload"_OMZ_SETTINGS" wait"1a" lucid
	zinit snippet OMZ::$plug
done

for plug in ${_OMZ_DIR_SOURCES}
do
	zinit ice svn wait"1a" lucid
	zinit snippet OMZ::$plug
done


zinit light chrissicool/zsh-256color
zinit light mafredri/zsh-async
zinit ice depth"1"
zinit light romkatv/powerlevel10k
zinit ice wait"0a" atload"_zsh_autosuggest" lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait"0b" lucid
zinit light hlissner/zsh-autopair
zinit ice wait"0b"  lucid
zinit light zsh-users/zsh-completions
# zinit ice wait"0c" pick"*.sh" atload"_enhancd_setting" lucid
# zinit light b4b4r07/enhancd
zinit ice wait"0c" atload"_zsh_history_substring_search_setting" lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait"1a" atload"_alias_tip_setting" lucid
zinit light djui/alias-tips
zinit ice wait"1b"  atload"_fzf_widgets_setting" lucid
zinit light ytet5uy4/fzf-widgets
zinit ice wait"2" lucid
zinit light wfxr/forgit
zinit ice wait"2" lucid
zinit light peterhurford/up.zsh
zinit ice wait"2" lucid
zinit light jocelynmallon/zshmarks
zinit ice wait"2" lucid
zinit light changyuheng/zsh-interactive-cd
zinit ice wait"2" pick"h.sh" lucid
zinit light paoloantinori/hhighlighter
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# fpath=($HOME/.zinit/plugins/zsh-users---zsh-completions/src $fpath)

# autoload compinit
# compinit

# Add fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/gitcollection/zshsyntaxhighlighting/zsh-syntax-highlighting.zsh
source $HOME/.illogical/IL.zshrc
