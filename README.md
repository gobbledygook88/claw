# CLAW 🦖 <!-- omit in toc -->

[![Build Status](https://travis-ci.org/gobbledygook88/claw.svg?branch=master)](https://travis-ci.org/gobbledygook88/claw)

A simple way to save commonly run commands or snippets.

There is the ability to share and collaborate on commands, e.g. in a work environment. This is done via `git` and the concept of _spaces_ which we will go into detail later.

This tool is intended to work alongside dotfiles e.g. `.bash_aliases` or `.functions` but is slightly more portable if `rsync` isn't preferred.

Much of the code has been heavily inspired by the wonderful Unix password manager [pass](https://www.passwordstore.org/).

### What's in the name?

Claw was the name for a similar command-line tool project of mine that never saw it past the design phase. The current feature-set is just a fraction of what was initially planned. That project may still happen or eventually be merged into this tool. Recycling is cool.

- [Installation](#installation)
    - [Ubuntu](#ubuntu)
    - [MacOS](#macos)
    - [Dependencies](#dependencies)
- [Usage](#usage)
    - [Initialise Claw](#initialise-claw)
    - [Display help](#display-help)
    - [Save new command](#save-new-command)
    - [Display saved commands](#display-saved-commands)
    - [Edit existing command](#edit-existing-command)
    - [Search saved commands](#search-saved-commands)
- [Useful tips](#useful-tips)
    - [Save the last run command](#save-the-last-run-command)
    - [Configure work environment](#configure-work-environment)
    - [Search Claw commands](#search-claw-commands)
    - [Scan through Claw commands (interactively)](#scan-through-claw-commands-interactively)
- [Spaces](#spaces)
- [Git support](#git-support)
- [Development](#development)
- [Inspiration](#inspiration)
- [TODO](#todo)

## Installation

### Ubuntu

```bash
apt install claw
```

### MacOS

```bash
brew install claw
```

Claw uses what is defined in `$EDITOR`, so be sure to configure this.

### Dependencies

* `bash`
* `tree`
* `xclip`
* `git` (optional, but recommended)
* `fzf` (optional, for better search functionality)

## Usage

### Initialise Claw

```bash
claw init [dirname]
```

By default, a directory at `$HOME/.claw/_default/` will be created. To use another name, or to create another space, specify a directory name.

### Display help

For full usage information, run

```bash
claw help
```

### Save new command

```bash
claw create foo/bar
```

This will create a new file in the currently active space.

### Display saved commands

```bash
claw show foo/bar
```

Add the `-c` flag to copy the command directly to the clipboard.

```bash
claw show -c foo/bar
```

Use the `-p` flag to display the full path to the saved command.

```bash
claw show -p foo/bar
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
source $(claw show -p work/env)
```

### Search Claw commands

### Scan through Claw commands (interactively)

Use `hjkl` or arrow keys to navigate the tree. Commands are displayed on the left, with paging.

Hit enter to

* Copy to clipboard
* `.sh -> $ /path/to/script.sh`
* No file extension: just paste contents into command line

### Commands with environment variables

Environment variables are detected. If any variable is not defined, then we display a message and/or prompt for input.

If using `claw create` inline, be sure to escape `$` symbols.

## Spaces

Spaces are a simple way to organise commands and scripts for different environments. You may have multiple projects on the go and each will have its own set of commands to run, e.g. for NodeJS or database administration.

Here is a more illustrative example:

* ``

## Git support

```bash
claw git init [dirname]
```

Runs `git init` in `$HOME/.claw/_default/`. Providing `dirname` will track the given local directory.

To track another repository, run

```bash
claw git clone git@url/to/remote:repo.git
```

By default, this will clone the remote repository into `$HOME/.claw/repo/`. To provide another name use the following

```bash
claw git clone git@url/to/remote:repo.git another_name
```

Any extra git repositories are automatically made into a space. On the other hand, any space can be made into a git repository.

## Development

* Clone repo: `git clone https://github.com/gobbledygook88/claw.git`
* `apt install shellcheck` or `brew install shellcheck`
* `pip install bashate`
* Run test scripts

## Inspiration

* [`pass`](https://www.passwordstore.org/): The Standard Unix Password Store
* `pgcli`

## TODO

* Bash autocompletion
* Git flow
* Interactive prompt
* Packaging for unix repositories and MacOS brew
* Easy creation of man pages for saved commands
