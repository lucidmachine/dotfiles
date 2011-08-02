filetype on
filetype plugin on
filetype indent on

set tabstop=4
set shiftwidth=4
set expandtab

set nowrap


set pastetoggle=<F2>

autocmd FileType make setlocal noexpandtab
autocmd FileType otl setlocal spell
"autocmd BufWritePost *.js !jsmin < % > `echo % | sed 's/\./.min./'`
"autocmd BufWritePost *.json !python -m json.tool && jsmin < % > `echo % | sed 's/\./.min./'`
