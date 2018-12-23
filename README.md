# CLAW

## Aim

A simple way to save commonly run commands or snippets.

Ability to share and collaborate on commands, e.g. in a work environment.

## Installation

### Linux

> apt install claw

### MacOS

> brew install claw

## Dependencies

* `bash`
* `tree`
* `git`
* `xclip`

## API

### Initialise Claw

> claw init

Create directory at `$HOME/.claw`.

### Save the last run command

> claw save foo/bar

Creates a file in `$CLAW_DIR` at the given path. The contents are the output of `echo !!`

### Display saved commands

> claw show foo/bar

### Copy saved script to clipboard

> claw show -c foo/bar

## Useful tips

### Configure work environment

> source $(claw show work/env)

### Search Claw commands

### Scan through Claw commands (interactively)

Use `hjkl` or arrow keys to navigate the tree. Commands are displayed on the left, with paging.

Hit enter to

* Copy to clipboard
* `.sh` -> `$ /path/to/script.sh`
* No file extension: just paste contents into command line

### Commands with environment variables

Environment variables are detected. If any variable is not defined, then we display a message and/or prompt for input.

## Git support

### Single git repository

> claw git init

Runs `git init` in `$HOME/.claw`

### Multiple git repositories

e.g. personal 

> claw git init personal

and work

> claw git clone git@url/to/remote:repo.git

## Inspiration

* `pass`: The Unix Password Store
* `pgcli`
