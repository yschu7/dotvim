" =============================================================================
" Filename: vimrc symbolic link: ~/.vimrc ~/.config/nvim/init.vim
" Who: Y.S. Chu (@yschu7)
" Description: The Vim Configuration
" Version: 3.1 - Changed from Vundle to Vimplug
" =============================================================================

" be iMproved
set nocompatible

set runtimepath=~/.dotvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.dotvim/after
set packpath=~/.dotvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.dotvim/after

" All of the plugins are installed with vimplug from this file.
source ~/.dotvim/vimplug.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Platform (Windows, Mac, etc.) configuration.
source ~/.dotvim/platforms.vim
" All of the Vim configuration.
source ~/.dotvim/config.vim
" New commands
source ~/.dotvim/commands.vim
" All hotkeys, not dependant on plugins, are mapped here.
source ~/.dotvim/mappings.vim
" Load plugin-specific configuration. (~/.vim/plugcfg/*.vim)
source ~/.dotvim/plugins.vim
" Small custom functions.
source ~/.dotvim/functions.vim
" Auto commands.(Filetypes)
source ~/.dotvim/autocmds.vim
" YS configuration (Function key, Neovim)
source ~/.dotvim/yscust.vim
" source ~/.simplenoterc

