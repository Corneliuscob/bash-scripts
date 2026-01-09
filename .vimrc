" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on


"Turn on  syntx highlighting"
syntax on

"change colorschem to bright"
colorscheme murphy 

"relative line hopping is like 3k and 3j to move up or down 3 lines"
"set line numbering and relative line numbers "
"set rnu"
set nu
