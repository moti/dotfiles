TERM=xterm-256color
#alimlias
alias vi='vim'
alias ls='ls -F --color=auto'
alias du='du -s'
#alias emacs='emacs21'

export LS_COLORS='di=01;36'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt print_eight_bit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#^ cd ../ ; ls
#function chpwd() {
#  ls
#}
#function cdup() {
#  echo
#    cd ..
#      zle reset-prompt
#    }
#    zle -N cdup
#bindkey '\^' cdup


#Option mo hokan
autoload -U compinit
autoload -U colors

compinit -u
colors


bindkey -e #emaCs key


HISTFILE=$HOME/.zsh-history           # �����ե��������¸����
HISTSIZE=900000                       # �����������ο�
SAVEHIST=900000                       # ��¸���������ο�
setopt extended_history               # ����ե�����˻����Ͽ
function history-all { history -E 1 } # �����ΰ������Ϥ���

zstyle ':completion:*:default' menu select=1
setopt share_history

setopt prompt_subst
PROMPT='${USER}${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%{$reset_color%} '
RPROMPT='%{$fg[white]%}%~%{$fg[cyan]%}:%{$fg[white]%}%!%{$reset_color%}'

_generate () {
 if [ ! -f .generators ]; then
  ./script/generate --help | grep '^  [^ ]*: ' | sed 's/[^:]*:/compadd/' | sed 's/\,//g' > .generators
  fi
  `cat .generators`
  }
compdef _generate generate
compdef _generate destroy

# dabbrev
HARDCOPYFILE=$HOME/tmp/screen-hardcopy
touch $HARDCOPYFILE

dabbrev-complete () {
        local reply lines=80 # 80��ʬ
        screen -X eval "hardcopy -h $HARDCOPYFILE"
        reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
        compadd - "${reply[@]%[*/=@|]}"
        }
        zle -C dabbrev-complete menu-complete dabbrev-complete
        bindkey '^o' dabbrev-complete
        bindkey '^o^_' reverse-menu-complete
                              
PATH=$PATH:$HOME/bin:$HOME/usr/lib/gae

#function chpwd() {
#  ls
#  if [ "$TERM" = "screen" ]; then
#    echo -n "^[k[`basename $PWD`]^[\\"
#  fi
#}

setopt autopushd
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias w3c w3mmee

PERL_AUTOINSTALL="--defaultdeps"
PATH=~/usr/lib/flex/bin:$PATH
PATH=/var/lib/gems/1.8/bin:$PATH
