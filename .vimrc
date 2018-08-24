set nocompatible              " be iMproved, required
filetype off                  " required
set nu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Syntax Highlighting "
au BufRead,BufNew *.md setf markdown
au BufRead,BUfNew *.tex setf tex

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Go Syntax Highlighting "
Plugin 'fatih/vim-go'

" Scala Syntax Highlighting "
Plugin 'derekwyatt/vim-scala'

" spaces for python
au Filetype python setl et ts=4 sw=4
au Filetype cpp setl et ts=8 sw=8 sts=8

" always uses spaces instead of tab characters
set expandtab

" For a better status line "
" set statusline=%t,%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2

" For easier window switching with alt + arrow keys "
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"For using Taglist for easy function finding"
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 35
nnoremap tt :TlistToggle<CR><C-w>w

" Shortcut for going between tabs "
nnoremap ff :tabn<CR>
nnoremap fd :tabp<CR>

" Quick swapping between windows "
nnoremap ww <C-w>w

" Turn on/off spell check "
nnoremap ss :setlocal spell spelllang=en_us
nnoremap sss :setlocal spell spelllang=

" Keep the cursor near the center "
set scrolloff=15

" For fast paragraph formatting "
"nnoremap oo gqip"

"Colorscheme and line highlighting"
:colorscheme molokai 
":set tw=85
set cursorline
hi CursorLine ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
set cursorcolumn
inoremap jj <Esc>
set tabstop=4
set shiftwidth=4
set softtabstop=4
let &t_ut=''

"Clang path"
let g:clang_library_path='~/.vim/plugin/clang/'


" Add highlighting on functions and classes for C++
function! EnhanceCppSyntax()
	syn match    cCustomParen    "?=(" contains=cParen,cCppParen
	syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
	syn match    cCustomScope    "::"
	syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
	"hi def link cCustomFunc Function
	hi def link cCustomClass Function
endfunction
au Syntax cpp call EnhanceCppSyntax()

" Highlight local variables
let g:TagHighlightSettings={'IncludeLocals':'True'}
function CustomTagHighlight()
	hi LocalVariable guifg=#ff00ff
	hi GlobalVariable guifg=#ff00ff
endfunction
au Syntax c,cpp call CustomTagHighlight()

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Clang compilation options file for Syntastic (if needed)
let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_cpp_config_file = '.clang_complete'
"let g:SuperTabContextDefaultCompletionType='<c-p>'

" Complete only the current buffer and includes
"set complete=.,i

" Complete options (disable preview scratch window)
"set completeopt=menu,menuone ",longest

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType="context" 
"set ofu=syntaxcomplete#Complete"
"let g:SuperTabContextDefaultCompletionType='<c-p>'"
"let g:SuperTabNoCompleteAfter = ['^', ',', '\s', '\', '\n']"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
