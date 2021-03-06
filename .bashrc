# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#-------------------------------------------------------------------------------------------------#
# If not running interactively, don't do anything
#-------------------------------------------------------------------------------------------------#
case $- in
    *i*) ;;
      *) return;;
esac

#-------------------------------------------------------------------------------------------------#
# Alias definitions
#-------------------------------------------------------------------------------------------------#
if [ -r .bash_aliases ]; then
    source ".bash_aliases"
fi

#-------------------------------------------------------------------------------------------------#
# Function definitions
#-------------------------------------------------------------------------------------------------#
if [ -r .bash_functions ]; then
    source ".bash_functions"
fi

#-------------------------------------------------------------------------------------------------#
# Function definitions
#-------------------------------------------------------------------------------------------------#
if [ -r .exports ]; then
    source ".exports"
fi

#-------------------------------------------------------------------------------------------------#
# History
#-------------------------------------------------------------------------------------------------#
export HISTTIMEFORMAT='%F %T '      # Timestamps for later analysis.
export HISTFILESIZE=20000           # Larger history file
export HISTSIZE=10000               # Larger history
HISTCONTROL=ignoredups:erasedups    # No duplicate entries
shopt -s histappend                 # Append to the history file, don't overwrite it
shopt -s cmdhist                    # Combine multiline commands into one in history
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

#-------------------------------------------------------------------------------------------------#
# Manpage coloring
#-------------------------------------------------------------------------------------------------#
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#-------------------------------------------------------------------------------------------------#
# Manpage coloring
#-------------------------------------------------------------------------------------------------#
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#-------------------------------------------------------------------------------------------------#
# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#-------------------------------------------------------------------------------------------------#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
