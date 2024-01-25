syntax on
filetype plugin indent on

set shiftwidth=2
set tabstop=2
set nocompatible
set expandtab
set smarttab
set autoindent
set nu
set ruler
set t_Co=256
set background=light
set backspace=indent,eol,start
set noshowmode

augroup Hiunicode
  autocmd!
  autocmd BufEnter *
      \ syntax match nonascii "[^\x00-\x7F]" |
      \ highlight nonascii ctermfg=NONE ctermbg=red
augroup END

" vim-airline theme - https://github.com/vim-airline/vim-airline-themes/blob/master/doc/airline-themes.txt
let g:airline_theme='wombat'

" Set dense-analysis/ale to puts data in statusline with airline
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

" XDG settings
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

" setup folding
set foldenable
set foldmethod=syntax

" set my colour scheme
colorscheme desert256

" highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" softwrap markdown lines at 80chars
au BufRead,BufNewFile *.md setlocal textwidth=80

" This toggles the numbers on and off when  not in insert mode
nnoremap <F2> :set nonumber!<CR>

" toggle paste mode on and off
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

" Map F5 to overwrite mode.
" Must be in command mode for this to work
:map <F5> R

" https://github.com/junegunn/vim-plug
" :PlugInstall to install plugins.
"
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'tpope/vim-cucumber'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'mitsuhiko/vim-rst'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'isobit/vim-caddyfile'
Plug 'NoahTheDuke/vim-just'

" Add plugins to &runtimepath
call plug#end()

