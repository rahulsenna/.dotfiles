### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export EDITOR=micro
export VISUAL=micro

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=999999999
# setopt autocd extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/agent/.zshrc'

export PATH=/home/agent/.local/share/JetBrains/Toolbox/scripts:$PATH


autoload -Uz compinit
compinit
# End of lines added by compinstall

# Key bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete



# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# alias getip="aws ec2 describe-instances --query 'Reservations[0].Instances[0].PublicIpAddress' --output text --instance-ids $instance"
# alias dwnld='curl `getip`/aws_sg.ovpn --output ~/openvpn/aws_sg.ovpn'
# alias create1="aws ec2 run-instances --image-id ami-04bc6caca307e18da --instance-type t2.micro --key-name GIGABYTE --security-group-ids sg-3e75f945 --user-data file://~/openvpn/user_data.txt --output text --query 'Instances[0].InstanceId'"
# alias create="export instance=`create1` && source ~/.zshrc"
# alias destroy="aws ec2 terminate-instances --instance-ids $instance --output text"


alias kill_dwm='kill `ps -C dwm fch -o pid | head -n 1`'
alias kill_keys='kill `ps -C key_up_x11 fch -o pid` ; kill `ps -C key_down_x11 fch -o pid`'
alias skill='kill -TERM `ps -C supervisord fch -o pid | head -n 1`'
alias srel='kill -HUP `ps -C supervisord fch -o pid | head -n 1`'
alias greload='kill -HUP `ps -C gunicorn fch -o pid | head -n 1`'
alias gkill='kill -TERM `ps -C gunicorn fch -o pid | head -n 1`'
alias ngn='sudo systemctl start nginx'
alias ngnr='sudo systemctl restart nginx'
alias ngncheck='sudo systemctl status nginx'
alias ngns='sudo systemctl stop nginx'
alias ngntest='sudo nginx -t'
alias dnld_clean='rm -rf /data/dnld/*'

alias audiorestart='systemctl --user restart pipewire pipewire-pulse'
alias daemon_restart='systemctl --user daemon-reload'
#Droidcam
alias cam='droidcam-cli -a -v -size=1920x1080 192.168.1.11 4747'
alias camreinstall='cd ~/Downloads/droidcam && ./install.sh'
# Reboot and Shutdown
alias sleep='sudo systemctl hibernate'
alias reb='sudo reboot'
alias off='sudo shutdown -h now'
alias hdd='sudo ntfs-3g /dev/nvme0n1p3 ~/mnt/Windows && sudo mount --mkdir -o gid=1000,uid=1000 /dev/sdb1 ~/mnt/HDD && sudo mount --mkdir -o gid=1000,uid=1000 /dev/sdc1 ~/mnt/SDD'
alias windesk='cd ~/mnt/Windows/Users/agentofchaos/Desktop'
# sudo ntfs-3g /dev/nvme0n1p2 ~/media/Windows
# sudo mount /dev/sdb1 ~/media/HDD
# sudo mount /dev/sdc3 ~/media/SDD
alias vpnu='openvpn3 session-start --config ~/openvpn/US.ovpn'
alias vpnou='openvpn3 session-manage --disconnect --config ~/openvpn/US.ovpn'
alias vpns='openvpn3 session-start --config ~/openvpn/aws_sg.ovpn'
alias vpnos='openvpn3 session-manage --disconnect --config ~/openvpn/aws_sg.ovpn'

alias vm='sudo virsh net-start default ; virt-manager -c qemu:///system --show-domain-console win10'
alias vmnet='sudo virsh net-start default'
# vim
alias vim='nvim'
alias mc='nvim'
alias vi='nvim'
# extract and package files/dirs
alias targzm='tar -czvf'
alias targzx='tar -xzvf'


# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias pacin='sudo pacman -Sy'                 	  # install with pacman
alias pacs='sudo pacman -Ss'                 	  # search with pacman
alias yays='yay -Ss'                              # search aur packages
alias pacrm='sudo pacman -R'                     # uninstall with pacman
alias yayin='yay -Sy'
alias yayrm='yay -Rns'
alias yaycln='yay -Yc'                          # remove unneccesary dependencies
alias pacl='pacman -Q | fzf'                 	# list all packages
alias yayl='yay -Q | fzf'                 	    # list all packages
alias findlib='ldconfig -p | fzf'               # list all installed libs

alias unwanted='yay -Yc'                         # removes un-needed dependencies
alias orphan='sudo pacman -Rns $(pacman -Qtdq)'       # removes orphan packages

alias update='sudo pacman -Syy'                  # update only datatbase
alias upgrade='sudo pacman -Syu'                  # update only standard pkgs
alias upgrade2='sudo pacman -Syyu'                 # Refresh pkglist & update standard pkgs
alias yayupd2='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yayupd='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'              # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'              # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'     # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq) && yay -Yc'  # remove orphaned packages
alias clearcache='sudo pacman -Sc && yay -Scc' # clear pacman cache

alias download='aria2c --file-allocation=none -c -x 10 -s 10'

alias reloz='source ~/.zshrc'                   # refresh zshrc
alias oz='nvim ~/.zshrc'                   # refresh zshrc

# get fastest mirrors
alias mir="sudo reflector --save /etc/pacman.d/mirrorlist --sort rate --country India -l 70 --verbose"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias size='du -sh'
alias disk='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

alias itop='sudo intel_gpu_top'

# ps
alias psport="ss -lptn sport"
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

alias myip="curl -4 ifconfig.co"

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# git
alias qpush='git add . && git commit -m updated && git push origin' #quick push
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias amend='git commit --amend'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Play audio files in current dir by type
alias playwav='deadbeef *.wav'
alias playogg='deadbeef *.ogg'
alias playmp3='deadbeef *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
alias tips='lbrynet txo spend --type=support --is_not_my_input --blocking'

### DTOS ###
# Copy/paste all content of /etc/dtos over to home folder. A backup of config is created. (Be careful running this!)
alias dtoscopy='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/dtos/* ~'
# Backup contents of /etc/dtos to a backup folder in $HOME.
alias dtosbackup='cp -Rf /etc/dtos ~/dtos-backup-$(date +%Y.%m.%d-%H.%M.%S)'



# Prompts
# autoload -Uz promptinit
# promptinit
# prompt redhat
# PROMPT='%F{009}[%F{011}%n%f@%F{012}%m%f %F{030}%B%~%b%F{009}] %F{white}'

#-------------------------------------------------------------------------

autoload -Uz promptinit
promptinit
prompt redhat

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'

setopt prompt_subst
PROMPT='%F{009}[%F{011}%n%f@%F{012}%m%f %F{030}%B%~%b%F{green}$(_git_prompt_info)%F{009}] %F{white}'
# RPROMPT='%F{magenta}%*%f'
RPROMPT=''


function _git_prompt_info() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    local ahead=$(git rev-list --count --left-right @{upstream}...HEAD | awk '{print $1}')
    local behind=$(git rev-list --count --left-right @{upstream}...HEAD | awk '{print $2}')
    local uncommitted=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    if [[ $ahead -gt 0 || $behind -gt 0 || $uncommitted -gt 0 ]]; then
      echo "%{$fg[green]%}  ${branch}%{$reset_color%}$(if [[ $ahead -gt 0 ]]; then echo "%F{green} ${ahead}%{$reset_color%}"; fi)$(if [[ $behind -gt 0 ]]; then echo "%F{red} ${behind}%{$reset_color%}"; fi)$(if [[ $uncommitted -gt 0 ]]; then echo "%F{blue}  ${uncommitted}%{$reset_color%}"; fi)"
    else
      echo "%{$fg[green]%}  ${branch}%{$reset_color%}"
    fi
  fi
}


setopt PROMPT_SP

##    
#-------------------------------------------------------------------------




[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

fzf_change_dir() {
    local dir="$(fd --exclude node_modules -H -i -t d --base-directory=/home/$(whoami) | fzf)";    
	
    if [[ -n "$dir" ]]; then
        zle push-line # Clear buffer. Auto-restored on next prompt.
        BUFFER="cd ~/${(q)dir}"
        zle accept-line
    fi
}

fzf_open_in_vscode() {
    local dir="$(fd --exclude node_modules -i -t d --base-directory=/home/$(whoami) | fzf)";    
	
    if [[ -n "$dir" ]]; then
        zle push-line # Clear buffer. Auto-restored on next prompt.
        BUFFER="code ~/${(q)dir}"
        zle accept-line
    fi
}

fzf_open_in_mc() {
    local dir="$(fd --exclude node_modules -H -i -t f --base-directory=/home/$(whoami) | fzf)";    
    if [[ -n "$dir" ]]; then
        zle push-line # Clear buffer. Auto-restored on next prompt.
        BUFFER="mc ~/${(q)dir}"
        zle accept-line
    fi
}
zle -N fzf_open_in_vscode
bindkey '^k' fzf_open_in_vscode

zle -N fzf_open_in_mc
bindkey '^o' fzf_open_in_mc

zle -N fzf_change_dir
bindkey '^h' fzf_change_dir

alias dd='fzf_change_dir'
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh


# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

