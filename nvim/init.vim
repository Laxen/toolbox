" TODO
" In-editor Pylint and PEP8

call plug#begin('~/.vim/plugged')

" Themes
" Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto open brackets and quotes
"Plug 'jiangmiao/auto-pairs'

" Comment toggling
" Keys - gc
Plug 'tomtom/tcomment_vim'

" Snipping - Automatic completion of commonly typed things (class, if, for)
" Plug 'sirver/ultisnips'
" Plug 'honza/vim-snippets'

" Nerdtree - Nice directory visualizer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Table mode
Plug 'dhruvasagar/vim-table-mode'

" Ez window swapping
" Keys - <leader>ww in window 1, same in window 2 to swap the windows
Plug 'wesQ3/vim-windowswap'

" Autocompletion for many languages
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Fuzzy searching
Plug 'kien/ctrlp.vim'

" Grepper
Plug 'mhinz/vim-grepper'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'

Plug 'tpope/vim-scriptease'

" Might want in the future
" tpope/vim-surround For surrounding words with anything ("")
" airblade/vim-gitgutter For getting notifications which lines you've changed in a git repo

call plug#end()

" General vim settings -----------------------------------------------
filetype plugin indent on
syntax on
set termguicolors
set number
set incsearch                           "Start searching immediately
set clipboard+=unnamedplus              "Copy to clipboard by default
set nowrap
set encoding=utf8                       "Needed to show glyphs
set nomodeline                          "Stop parsing files for vim flags
"Remove search highlighting when hitting esc
" <C-U> removes visual range that is otherwise passed if escaping out of a visual selection
noremap <silent> <Esc> :<C-U>noh<cr>
set diffopt=vertical,filler             "Vertical vimdiffs
let mapleader = " "                     "Rebind leader to space instead of \
set list                                "Shows indent characters

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
" Yank to the end of a string
nmap ys yt"
" Re-select the block after deleting a fold
vmap zd zdgv

" Make the backspace work like normal
set backspace=indent,eol,start
" Number of spaces to show tabs as
set tabstop=2
" Number of spaces when indenting
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab
" Don't automatically break lines
set tw=0

"Search for text in visual mode using //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
" When searching with *, highlight without moving to next word
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Press yfp to yank file path
nmap yfp :let @+ = expand("%")<CR>

" Allow mouse to resize windows
set mouse=a

" Window resizing
nnoremap <silent> <Leader>h :vertical resize +10<CR>
nnoremap <silent> <Leader>l :vertical resize -10<CR>
nnoremap <silent> <Leader>j :resize -10<CR>
nnoremap <silent> <Leader>k :resize +10<CR>

" Theme -----------------------------------------------
" Gruvbox
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'

" OceanicNext
" set background=dark
" colorscheme OceanicNext

" Material
set background=dark
let g:airline_theme = 'bubblegum'

let g:material_theme_style = 'palenight'
" let g:material_theme_style = 'lighter'

colorscheme material
set cursorline
highlight CursorLine guibg=#2E3956
" Visual select color
highlight Visual guibg=#404975 guifg=reverse
highlight link cBlock cParenError
highlight link cParen cParenError
highlight link cBracket cParenError
highlight link cMulti cParenError
highlight link vimUserFunc cParenError

highlight CocInlayHint guifg=#3d4759

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Neater folding --------------------------------------
function! NeatFoldText()
    let line = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+ ' . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    return foldtextstart . foldtextend
endfunction

set foldtext=NeatFoldText()
set fillchars=fold:\ 
highlight Folded guibg=base01 guifg=darkgrey
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview

" CoC ------------------------------------------
" Use tab to trigger completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)

" leader+s to switch between c/h files
nmap <leader>s :execute 'edit' CocRequest('clangd', 'textDocument/switchSourceHeader', {'uri': 'file://'.expand("%:p")})<CR>

" leader+r to rename symbol
nmap <leader>r <Plug>(coc-rename)

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

map <leader>g  :call GoToDefinition()<CR>
map <leader><leader>g :vs \| call GoToDefinition()<CR>

" CtrlP --------------------------------------------------
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Deoplete -----------------------------------------------
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
" set completeopt-=preview                                        " Gets rid of the scratch pad thing
" set completeopt+=longest                                        " Doesn't select the first completion item
" set completeopt+=menuone                                        " Show menu even if there's only one item
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"        " Tab completion
" inoremap <expr> j pumvisible() ? "\<C-n>" : "j"                 " Use j as down in autocomplete box
" inoremap <expr> k pumvisible() ? "\<C-p>" : "k"                 " Use k as up in autocomplete box

" Neomake -----------------------------------------------
" call neomake#configure#automake('nw', 750)

" Ultisnips -----------------------------------------------
" let g:UltiSnipsSnippetsDir=$HOME . '/.vim/plugged/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetDirectories=['UltiSnips']
" let g:UltiSnipsExpandTrigger='<C-tab>'
" let g:UltiSnipsJumpForwardTrigger='<C-tab>'
" let g:UltiSnipsJumpBackwardTrigger='<C-s-tab>'
" let g:UltiSnipsEditSplit='vertical'

" Nerdtree -----------------------------------------------
" Start automatically if no file specified or a folder is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :silent! NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'silent! NERDTree' argv()[0] | wincmd p | ene | endif

" Close if nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle with Ctrl-n
map <C-n> :silent! NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" Nerdtree syntax highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "d090ff"
let s:lightPurple = "db97c4"
let s:red = "ff6b66"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "ffce91"
let s:lightOrange = "ffce91"
let s:darkOrange = "bd9257"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['c'] = s:orange
let g:NERDTreeExtensionHighlightColor['h'] = s:darkOrange

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['Makefile'] = s:red " sets the color for .gitignore files

" Vim Grepper -----------------------------------------
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

" Closetag -----------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*js'

" Run Python script with enter
autocmd FileType python nnoremap <buffer> <CR> :exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <buffer> <leader><CR> :exec '!python3' shellescape(@%, 1) 'j'<CR>

" Finds the current Yocto recipe name for the file that is opened
function! RecipeName()
    let file = expand('%:p')
    let move = ""
    let head = "null"
    let i = 0
    while i < 100
        let i += 1
        let move .= ":h"
        let prevhead = head
        let head = fnamemodify(file, ":p" . move . ":t")

        if head == "sources"
            echohl None
            let sources = fnamemodify(file, ":p" . move)
            let recipe = prevhead
            echo "sources directory found, recipe name is " . recipe
            return recipe
        elseif head == ""
            echohl WarningMsg
            echo "No sources directory found!"
            echohl None
            return ""
        endif
    endwhile
endfunction

" Finds the parent 'sources' directory, cd's to it, builds cscope
" cross-reference, removes all other cscope connections and adds the new one,
" cd's back to previous directory
" If 'sources' is not found does nothing
" TODO: Remake this to work from the current working directory, or use something else instead of cscope...
function! CS()
    let file = expand('%:p')
    let move = ""
    let head = "null"
    let i = 0
    while i < 100
        let i += 1
        let move .= ":h"
        let head = fnamemodify(file, ":p" . move . ":t")

        if head == "sources"
            echohl None
            let sources = fnamemodify(file, ":p" . move)
            echo "sources directory found"
            echo sources
            echo
            echo "Building cross-reference and adding connection to vim..."
            execute 'cd ' . sources
            !cscope -Rb
            cs kill -1 " Remove all cscope connections
            cs add cscope.out
            execute 'cd -'
            break
        elseif head == ""
            echohl WarningMsg
            echo "No sources directory found!"
            echohl None
            break
        endif
    endwhile
endfunction
command! CS call CS()

" Run gitk --all on folder where current open file is located
function! Gk()
  let dir = expand('%:p:h')
  execute 'cd ' . dir
  execute '!gitk --all'
  execute 'cd -'
endfunction
command! Gk call Gk()

" Toggle between tabs and spaces
function! TabToggle()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfunction
nmap <F12> mz:execute TabToggle()<CR>'z

" Source init_private.vim
let init_private = '/home/alexanga/toolbox/nvim/init_private.vim'
if filereadable(init_private)
    exec 'source' . init_private
endif

map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
