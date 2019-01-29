# tag
CLI File Tagging System

## What is this?
A software that allows tagging files and filtering through them in the cli.

### Feature Set
- adding/removeing files to/from the tag directory
- showing and modifying the tags of files
- filtering of files for certain tags
- small GUI in form of a few Nautilus scripts

## How can I use this?
### Installation
Just execute:
`./install`

This will check for all dependencies, copy all files to `~/.tagbin`, add it to the PATH variable in `~/.bashrc` and soft link the Nautilus scripts to the proper directory.

### Usage

I tried to keep the user interface similar to git. 

Before any files can be added there has to be a tag directory in some parent directory. To create a new tag directory `tag init` can be used.
When a file got added with `tag add` it's tags can be modified with `tag mod`.
`tag ls` lists all files in the current tag directory. With `tag filter` the files can be filtered by certain criteria (files not matching will be temporarily removed from the directory tree).

For details consult the table below.

### Commands

| Synopsis | Options | Description |
| :--- | ---: | :--- |
| `tag init [OPTIONS]` | | create new tag direcotry |
| | `-f` | force the creation in the current directory even if any parent is already a tag directory |
| `tag add FILE` | | add FILE to the tag directory |
| `tag rm FILE` | | remove FILE from the tag directory |
| `tag ls [OPTIONS] [PREFIX]` | | show files in the current tag director; if PREFIX is set it's filepath has to start with PREFIX |
| | `-t` | show the tags instead of the files; if PREFIX is set only the tag PREFIX will be shown |
| | `-l` | show all tags for the files, or show all files for the tags when used with `-t` |
| | `-a` | also show files that are not added to the tag directory; ignored when used with `-t` |
| `tag mod [OPTIONS] FILE` | | modify tags of FILE |
| | `-a TAG` | add TAG; can be specified multible times |
| | `-r TAG` | remove TAG; can be specified multible times |
| `tag filter [OPTIONS]` | | filter the tag directory for certain criteria |
| | `-s` | simulate filter; show all files that match the filter |
| | `-a` | show all files; resets the directory |
| | `-t TAG` | only show files with TAG; can be specified multible times |
| | `-n TAG` | only show files without TAG; can be specified multible times |

## How does this work?

Added files will be moved to `.tag/raw`, a hard link will be created in it's place. Additionally an entry in `.tag/files` will be created (two lines: one for the file name and on for a space-seperated list of tags for that file).
Changes to the tag will be made to the file list.

When filtering the files the tag directory will be emptied (that's why all files have to be added before filtering) and for each matching file a new hard link will be created.
