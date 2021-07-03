#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
LS_COLORS="ow=01;90:di=01;34:ex=01;32:ln=00;36"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$HOME/.local/go/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="vim"
export GTEST_COLOR=1
export RUSTUP_HOME="/home/k1nkreet/temp"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias slack-surf='GDK_SCALE=2 surf jetbrains.slack.com'
