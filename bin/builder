#!/usr/bin/env bash
# Script to iterate over and build files from AUR and ASP.
# Make sure $LOGDEST is set.
readonly progn=builder
readonly reposeroot=/var/cache/pacman/custom
readonly aurroot="$HOME"/build/aur
readonly asproot="$HOME"/build/asr
readonly logroot="$HOME"/build/logs

opts=( -c )

puts() {
    printf -- "$1\n" "${@:2}"
}

has() {
    hash "$1" &> /dev/null
}

err() {
    local msg

    puts "$progn: $1" "${@:2}" >&2

    if has notify-send; then
        msg="$(puts "$@")"
        notify-send -u critical -- "$progn" "$msg"
    fi
}

get_options() {
  while "$1"; do
    if [[ $1 == "f" ]]; then
        opts+=( -f )
        shift
    fi
    if [[ $1 == "C" ]]; then
        opts+=( -C )
        shift
    fi
    if [[ $1 == "g" ]]; then
        opts+=( -g )
        shift
    fi
  done
}

# Enter each dir and build
builddir() {

    cd "$1" || err "Unable to enter $1"
    for i in *; do
      # Build in /tmp/tmp.foo, clean up foo after
      (cd "$i" && BUILDIR=$(mktemp -d) makepkg "${opts[@]}" 2>&1 | tee "$logroot"/$i.log && rm -rf /tmp/tmp.*)
    done
}

buildpipe() {
    cd "$aurroot" || err "Unable to enter $aurroot"
    while read -r i; do
      (cd "$i" 2>/dev/null || break
      BUILDDIR=$(mktemp -d) makepkg "${opts[@]}" 2>&1 | tee "$logroot"/$i.log && rm -rf /tmp/tmp.*)
    done
}

error_test() {
    cd "$logroot" || err "Error entering $logroot"
    for i in *; do
        if sed -n '/has already been built/q1' "$i"; then
	    if sed -n '/Finished making/q1' "$i"; then
                err "${i/.log/ has an error}"
            else
                puts "${i/.log/ updated}"
	    fi
        fi
    done
}

update_repo() {
    cd "$reposeroot" || err "Error entering $reposeroot"
    repose -z custom
}

## Main ##

cower -uddf

# Check for command line arguments
get_options "$@"

# Build!
#builddir "$aurroot"; 
aurqueue "$aurroot" | buildpipe
builddir "$asproot"

# Finally, test for any package that built.
error_test

# Update repose
update_repo
