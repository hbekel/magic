# magic
define bash functions on a per-directory basis

# Installation

`make install` installs into `/usr/lib/magic` by default.

`make PREFIX=/your/prefix install` to install to a different prefix.

`make DESTDIR=stage install` for a staged install.

Add the following line to your .bashrc:

    PROMPT_COMMAND="$PROMPT_COMMAND; source /usr/lib/magic/magic"

If you used a different `PREFIX`, adjust the path accordingly.

# Usage

Define some bash functions in a script named `.spells` and place it into the 
directory below which these functions shall be defined. Be sure to echo
the name of each function you define at the end of the script.

Upon entering the directory the `.spells` file will be sourced and the functions 
defined in it will be available at the prompt. Upon leaving the directory all functions
will be `unset` again (provided the `.spells` script correctly echoes their names).

The function `magic` lists the currently installed `.spells` files in
the order in which they were sourced.

# Examples

## A simple `get` command for github

Assume you have a directory `~/workspace` under which you store your git repositories.
Create a `.spells` file in this directory, defining a function called `get`:
    
    function get() {
       local author="$1"
       local project="$2"
      
       git clone "https://github.com/${author}/${project}"
    }
    echo get

Now you can clone a repository from github by cd'ing into `~/workspace` and typing

    $ get hbekel magic

This function will only be defined below the `~/workspace` directory.

## Multiple `.spells` in the current path

Assume that `~/.spells` reads

    function play {
        echo "THE ONLY WINNING MOVE IS NOT TO PLAY"
    }
    echo play

And that `~/music/.spells` reads

    function play {
        mplayer "$@"
    }
    echo play
    

Anywhere in your home directory `play` will echo `THE ONLY WINNING MOVE IS NOT TO PLAY`, except below the `music`
directory, where `play foo.mp3` will instead call `mplayer foo.mp3`.

More specifically, whenever you change into a directory, the current path will be searched top down, starting at 
the root of the filesystem. Every readable `.spells` files encountered along the way will be sourced immediately.
This means that `.spells` files further down the hierarchy can effectively override functions defined in `.spells`
files residing higher up in the hierarchy.

# Feedback

If you do something interesting with this, please let me know :)