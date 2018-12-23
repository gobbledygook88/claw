# CLAW

## Aim

A simple way to save commonly run commands or snippets.

Ability to share and collaborate on commands, e.g. in a work environment.

## Installation

### Linux

> apt install claw

### MacOS

> brew install claw

Claw uses what is defined as `$EDITOR` so be sure to configure this.

## Dependencies

* `bash`
* `tree`
* `xclip`
* `git` (optional, but recommended)

## API

### Initialise Claw

> claw init

Create directory at `$HOME/.claw`.

### Display help

> claw help

### Display saved commands

> claw show foo/bar

### Save new command

> claw create foo/bar

TODO: check if path already exists

### Copy saved script to clipboard

> claw show -c foo/bar

### Edit existing command

> claw edit foo/bar

### Search saved commands

> claw search query

## Useful tips

### Save the last run command

> claw create foo/bar "$(echo !!)" 

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

If using `claw create` inline, be sure to escape `$` symbols.

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

## TODO

* Bash autocompletion
* Git flow
* Interactive prompt
* Packaging for unix repositories and MacOS brew
* Easy creation of man pages for saved commands
