This is my ~/.vim dir and _this_, dear reader, is a horse:

                   ,
                  / \,,_  .'|
               ,{{| /}}}}/_.'
              }}}}` '{{'  '.
            {{{{{    _   ;, \
         ,}}}}}}    /o`\  ` ;)
        {{{{{{   /           (
        }}}}}}   |            \
       {{{{{{{{   \            \          ,-------------------------------.
       }}}}}}}}}   '.__      _  |        /       HI                        \
       {{{{{{{{       /`._  (_\ /       /      /   \                        |
        }}}}}}'      |    //___/   --= <   VVVI     HI-HI-HI                |
    jgs `{{{{`       |     '--'         \                   \               |
         }}}`                            \                  HIM-HIM-HIM!!!  /
                                          '--------------------------------'

Installation
============

Install will move existing ~/.vim* to ~/.vim*.old and installs plugins

`git clone https://github.com/cldwalker/vimfiles.git ~/.vim && rake install`

Usage
=====
To update all plugins: `rake update`

To add a vim plugin: `rake add PLUGIN=https://github.com/tpope/vim-fugitive.git`

To remove a vim plugin: `rake rm PLUGIN=https://github.com/tpope/vim-fugitive.git`

A github repo can be referenced as :name/:repo :
`rake add PLUGIN=tpope/vim-fugitive`

About
=====
This setup uses [pathogen](https://github.com/tpope/vim-pathogen) to allow each
vim plugin its own directory. plugins.txt contains the list of active vim
plugins and is simply a list of git repositories.

Path descriptions:

* backup/: used by &backupdir to store backup files
* colors/: slew of colors from scrooloose
* plugin/: plugin-specific vim files
* plugins/: where plugins are git cloned and added to runtime by pathogen
* plugins.txt: list of plugins
* rc/: additional files sourced by vimrc, split up by use i.e. keys + functions
* vimrc: where it all starts - mostly setting options
