# CLAW

## Aim

A simple way to save commonly run commands or snippets.

Ability to share and collaborate on commands, e.g. in a work environment.

### What's in the name?

Claw is a name for another command-line tool project that never saw it past the design phase. That project may still happen or eventually be merged into this tool. Recycling is cool.

## Installation

### Linux

```bash
apt install claw
```

### MacOS

```bash
brew install claw
```

Claw uses what is defined as `$EDITOR` so be sure to configure this.

## Dependencies

* `bash`
* `tree`
* `xclip`
* `git` (optional, but recommended)

## API

### Initialise Claw

```bash
claw init
```

Create directory at `$HOME/.claw`.

### Display help

```bash
claw help
```

### Display saved commands

```bash
claw show foo/bar
```

### Save new command

```bash
claw create foo/bar
```

TODO: check if path already exists

### Copy saved script to clipboard

```bash
claw show -c foo/bar
```

### Edit existing command

```bash
claw edit foo/bar
```

### Search saved commands

```
claw search query
```

## Useful tips

### Save the last run command

```bash
claw create foo/bar "$(echo !!)" 
```

### Configure work environment

```bash
source $(claw show work/env)
```

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

```bash
claw git init
```

Runs `git init` in `$HOME/.claw`

### Multiple git repositories

e.g. personal 

```bash
claw git init personal
```

and work

```bash
claw git clone git@url/to/remote:repo.git
```

## Inspiration

* `pass`: The Unix Password Store
* `pgcli`

## TODO

* Bash autocompletion
* Git flow
* Interactive prompt
* Packaging for unix repositories and MacOS brew
* Easy creation of man pages for saved commands
