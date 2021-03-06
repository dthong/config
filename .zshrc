######################################################################
#		      mako's zshrc file, v0.1
#
# 
######################################################################

# next lets set some enviromental/shell pref stuff up
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt APPEND_HISTORY
# setopt AUTO_LIST		# these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME		# tries to resume command of same name
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
# setopt HASH_CMDS		# turns on hashing
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt ALL_EXPORT

setopt MENUCOMPLETE
setopt completealiases

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

#[[ $TERM = "xterm" ]] && stty pass8 && bindkey -me
#[[ $TERM = "xterm" ]] && stty -parenb -istrip cs8 && bindkey -me

PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin/:/Users/dthong/bin:/Users/dthong/Work/hadoop-0.20.2/bin:$PATH"
PATH="/Users/dthong/Work/apache-maven-3.0.3/bin:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`
HADOOP_HOME="/Users/dthong/Work/hadoop-0.20.2"
export DYLD_LIBRARY_PATH=$HADOOP_HOME/src/c++/install/lib:$DYLD_LIBRARY_PATH
PYTHONPATH=".:./lib/python:/usr/local/lib/python2.7/site-packages"
TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
#EDITOR='vim'
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
		 colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR]%(!.#.$) "
if [ $RANGER_RUNNING ]; then
	PS1="[$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_GREEN%2c$PR_NO_COLOR]%(!.#.$) "
fi
RPS1="$PR_MAGENTA(%D{%m-%d %H:%M})$PR_NO_COLOR"
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
DISPLAY=:0

if [ $SSH_TTY ]; then
		MUTT_EDITOR=vim
else
		MUTT_EDITOR=emacsclient.emacs-snapshot
fi

unsetopt ALL_EXPORT
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
alias slrn="slrn -n"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias ll='ls -al'
alias ls='ls -G '
alias make=pretty_make.py
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias rest2html-css='rst2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/s5_html/themes/default/print.css'
alias dmesg="sudo dmesg"
alias remotePrint="chicago lpr -P clemens "
alias ranger="EDITOR=vim /Library/Frameworks/Python.framework/Versions/2.7/bin/ranger"
#if [[ $HOSTNAME == "kamna" ]] {
#	alias emacs='emacs -l ~/.emacs.kamna'
#}	

# alias	=clear
stty erase ^H &>/dev/null
#bindkey "^[[3~" delete-char
#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}

#chpwd

[[ $TERM = "xterm" ]] && export TERM="xterm-color"
bindkey -e
autoload -U compinit
compinit
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^o' 'fg\n'
#bindkey '^r' history-incremental-search-backward
#bindkey "^[[5~" up-line-or-history
#bindkey "^[[6~" down-line-or-history
#bindkey "^[[H" beginning-of-line
#bindkey "^a" beginning-of-line
#bindkey "^e" end-of-line

#bindkey "^[[1~" beginning-of-line
#bindkey "^[[F"  end-of-line
#bindkey "^[[4~" end-of-line
#bindkey ' ' magic-space    # also do history expansion on space
#bindkey '^I' complete-word # complete on tab, leave expansion to _expand
#zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
#zstyle ':completion:*' completer _complete _ignored
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=3 _complete _ignored 
#zstyle -e ':completion:*:approximate:*' max-errors \
    #'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
# zstyle -e ':completion:*:approximate:*' max-errors \
#     'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

export WORDCHARS='*?_[]~=&;!#$%^(){}'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
