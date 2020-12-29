" =============================================================================
" Filename: vimrc symbolic link: ~/.vimrc ~/.config/nvim/init.vim
" Who: Y.S. Chu (@yschu7)
" Description: The Vim Configuration
" Version: 3.1 - Changed from Vundle to Vimplug
" =============================================================================

" be iMproved
set nocompatible
" All of the plugins are installed with vimplug from this file.
source ~/.vim/vimplug.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Platform (Windows, Mac, etc.) configuration.
source ~/.vim/platforms.vim
" All of the Vim configuration.
source ~/.vim/config.vim
" New commands
source ~/.vim/commands.vim
" All hotkeys, not dependant on plugins, are mapped here.
source ~/.vim/mappings.vim
" Load plugin-specific configuration. (~/.vim/plugcfg/*.vim)
source ~/.vim/plugins.vim
" Small custom functions.
source ~/.vim/functions.vim
" Auto commands.(Filetypes)
source ~/.vim/autocmds.vim
" YS configuration (Function key, Neovim)
source ~/.vim/yscust.vim
source ~/.simplenoterc

