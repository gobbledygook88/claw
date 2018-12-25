#!/usr/bin/env bash

set -eo pipefail

VERSION="v0.0.1"
PREFIX="${CLAW_DIR:-$HOME/.claw}"
DEFAULT_SPACE="${CLAW_DEFAULT_SPACE:-_default}"
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
	local space="$1"
	echo "$space"

	[[ ! -d "$PREFIX/$space" ]] && die "Error: Space not valid"
	echo "$space" > "$CURRENT_SPACE_FILE"
}

cmd_version() {
	echo "$VERSION"
}

cmd_usage() {
	cat <<-EOF
	Usage:
	    $PROGRAM init [space]
	        Initialize a new space.
	    $PROGRAM [ls] [subfol er]
	        List commands.
	    $PROGRAM search command-name
	        List commands that match query (can be a regular expression).
	    $PROGRAM show [--clip,-c] [--path,-p] command-name
	        Show existing command and optionally put it on the clipboard.
	        Can also display the full path to the file.
	    $PROGRAM create command-name
	        Insert a new command via the configured editor (${EDITOR:-vi}).
	    $PROGRAM edit command-name
	        Edit a command using the configurated editor (${EDITOR:-vi}).
	    $PROGRAM rm [--recursive,-r] command-name
	        Remove existing command or directory.
	    $PROGRAM mv old-path new-path
	        Renames or moves old-path to new-path.
	    $PROGRAM cp old-path new-path
	        Copies old-path to new-path.
	    $PROGRAM help
	        Show this text.
	    $PROGRAM version
	        Show version information.
	EOF
}

cmd_init() {
	local name="${1:-$DEFAULT_SPACE}"
	if [[ -d "$PREFIX/$name" ]]
	then
		echo "Space $name already exists. Setting $name to be the current space."
	else
		mkdir -p "$PREFIX/$name"
		echo "Created new space $name."
	fi
	set_current_space "$name"
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
	local current_space=get_current_space
	local query=$1
	find "$PREFIX/$current_space" -name "$query"
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
	# create|insert|add) shift;       cmd_create "$@" ;;
	# edit) shift;                    cmd_edit "$@" ;;
	space) shift;                   cmd_space "$@" ;;
	# delete|rm|remove) shift;        cmd_delete "$@" ;;
	# rename|mv) shift;               cmd_copy_move "move" "$@" ;;
	# copy|cp) shift;                 cmd_copy_move "copy" "$@" ;;
	# git) shift;                     cmd_git "$@" ;;
	*)                              cmd_usage "$@" ;;
esac
exit 0
