#!/bin/bash

VERSION="v0.0.1"
PREFIX="${CLAW_DIR:-$HOME/.claw}"
DEFAULT_SPACE="$PREFIX/${CLAW_DEFAULT_SPACE:=_default}"

GETOPT="getopt"

die() {
	echo "$@" >&2
	exit 1
}

cmd_version() {
	echo "$VERSION"
}

cmd_usage() {
	cmd_version
	echo
	cat <<-EOF
	Usage:
		$PROGRAM init
	EOF
}

cmd_init() {
	echo
}

cmd_show() {
	echo
}

cmd_find() {
	[[ $# -eq 0 ]] && die "Usage: $PROGRAM $COMMAND command-names..."
	# TODO support -a to search all spaces
	echo
}

cmd_current_space() {
	echo
}

cmd_set_current_space() {
	echo
}

cmd_spaces() {
	echo
}

PROGRAM="${0##*/}"
COMMAND="$1"

case "$1" in
	init) shift;                    cmd_init "$@" ;;
	help|--help|-h) shift;          cmd_usage "$@" ;;
	version|--version|-v) shift;    cmd_version "$@" ;;
	show|ls|list) shift;            cmd_show "$@" ;;
	find|search) shift;             cmd_find "$@" ;;
	# grep) shift;                    cmd_grep "$@" ;;
	insert|add) shift;              cmd_insert "$@" ;;
	edit) shift;                    cmd_edit "$@" ;;
	# generate) shift;                cmd_generate "$@" ;;
	# delete|rm|remove) shift;        cmd_delete "$@" ;;
	# rename|mv) shift;               cmd_copy_move "move" "$@" ;;
	# copy|cp) shift;                 cmd_copy_move "copy" "$@" ;;
	# git) shift;                     cmd_git "$@" ;;
	*)                              cmd_usage "$@" ;;
esac
exit 0
