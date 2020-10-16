#!/bin/sh

die() {
    >&2 echo "$@" && exit 1
}

warn() {
    >&2 echo "$@"
}

type stow || die "GNU stow should be installed"
type vim && stow vim || warn "vim is not found, skipping vim configs"
type tmux && stow tmux || warn "tmux is not found, skipping tmux configs"
