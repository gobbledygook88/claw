#!/bin/bash

set -euo pipefail

VERSION="v0.0.1"
PREFIX="${CLAW_DIR:-$HOME/.claw}"
DEFAULT_SPACE="$PREFIX/${CLAW_DEFAULT_SPACE:-_default}"
CURRENT_SPACE_FILE="$PREFIX/.current_space"

# GETOPT="getopt"

die() {
	echo "$@" >&2
	exit 1
}

get_current_space() {
	read -r line < "$CURRENT_SPACE_FILE"
	echo "$line"
}

set_current_space() {
	# TODO get new space name from user input
	local space="foo"

	[[ ! -d "$space" ]] && die "Error: Space not valid"
	echo $space > "$CURRENT_SPACE_FILE"
}

cmd_version() {
	echo "$VERSION"
}

cmd_usage() {
	cat <<-EOF
	Usage:
		$PROGRAM init
	EOF
}

cmd_init() {
	mkdir -p "$DEFAULT_SPACE"
	# TODO activate default space
}

cmd_show() {
	local current_space=get_current_space
	local file="$PREFIX/$current_space/$1"

	[[ ! -f $file ]] && die "Error: Path not valid"

	cat "$file"

	# TODO -c : copy contents to clipboard
	pbcopy < "$file"

	# TODO -p : print out full, absolute filepath
	echo "$file"
}

cmd_find() {
	[[ $# -ne 1 ]] && die "Usage: $PROGRAM $COMMAND command-names..."
	# TODO support -a to search all spaces
	echo
}

cmd_space() {
	# claw space set <space>

	# No extra arguments, or ls/list/show
	# TODO get current space and place asterisk
	find "$PREFIX" -type d -depth 1 -not -name ".*" -exec basename {} +
}

PROGRAM="${0##*/}"
COMMAND="$1"

case "$1" in
	init) shift;                    cmd_init "$@" ;;
	help|--help|-h) shift;          cmd_usage "$@" ;;
	version|--version|-v) shift;    cmd_version "$@" ;;
	show|ls|list) shift;            cmd_show "$@" ;;
	find|search) shift;             cmd_find "$@" ;;
	# insert|add) shift;              cmd_insert "$@" ;;
	# edit) shift;                    cmd_edit "$@" ;;
	space) shift;                   cmd_space "$@" ;;
	# delete|rm|remove) shift;        cmd_delete "$@" ;;
	# rename|mv) shift;               cmd_copy_move "move" "$@" ;;
	# copy|cp) shift;                 cmd_copy_move "copy" "$@" ;;
	# git) shift;                     cmd_git "$@" ;;
	*)                              cmd_usage "$@" ;;
esac
exit 0
