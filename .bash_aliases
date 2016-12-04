# Alias definitions

#-------------------------------------------------------------------------------------------------#
# color and prettify aliases
#-------------------------------------------------------------------------------------------------#
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto' 
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Use the column command to create pretty tables. 
alias ct='column -t'
alias dfc='df -hPT | column -t' 
alias mount='mount | column -t'

#-------------------------------------------------------------------------------------------------#
# date and time aliases
#-------------------------------------------------------------------------------------------------#
alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'

#-------------------------------------------------------------------------------------------------#
# ls aliases
#-------------------------------------------------------------------------------------------------#
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -al"
alias sl="ls"
alias l='ls -CF'
alias s="ls"

#-------------------------------------------------------------------------------------------------#
# safety nets
#-------------------------------------------------------------------------------------------------#
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -iv' 
alias cp='cp -iv' 
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


#-------------------------------------------------------------------------------------------------#
# system information
#-------------------------------------------------------------------------------------------------#
## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

#-------------------------------------------------------------------------------------------------#
# git aliases
#-------------------------------------------------------------------------------------------------#
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log --oneline --graph --color --all --decorate'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

#-------------------------------------------------------------------------------------------------#
# navigation aliases
#-------------------------------------------------------------------------------------------------#
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias music='cd ~/Music'
alias videos='cd ~/Videos'
alias ...='../..'
alias ....='../../..' 

#-------------------------------------------------------------------------------------------------#
# system updates
#-------------------------------------------------------------------------------------------------#
# Debian / Ubuntu:
alias update='sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoremove'
alias dist-update='update && sudo apt-get dist-upgrade'
alias install='sudo apt-get install'

# RHEL, CentOS, Fedora
#alias update='yum update'
#alias updatey='yum -y update'


#-------------------------------------------------------------------------------------------------#
# lock, shutdown and suspend aliases
#-------------------------------------------------------------------------------------------------#
#requires root password, disable it by "sudo chmod u+s /sbin/shutdown"
alias system_shutdown='sudo shutdown –h now'
alias system_restart='sudo shutdown –r now'

alias suspend='sudo pm-suspend'
alias lock='gnome-screensaver-command --lock'
