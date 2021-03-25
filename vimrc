set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/tomasr/molokai.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
" Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'git://github.com/Yggdroot/LeaderF'
Plugin 'git://github.com/vim-erlang/vim-erlang-runtime.git'
Plugin 'git://github.com/vim-erlang/vim-erlang-tags.git'
Plugin 'git://github.com/vim-erlang/vim-erlang-omnicomplete.git'
Plugin 'git://github.com/vim-erlang/vim-erlang-skeletons.git'
Plugin 'git://github.com/hamler-lang/hamler-vim.git'
" Plugin 'Yggdroot/IndentLine.git'
" Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()
filetype plugin indent on

syntax on

"set nu
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set incsearch
set hlsearch
set encoding=utf-8

let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "-"

set background=dark
if strlen(globpath(&rtp, "colors/solarized.vim")) > 0
    let g:solarized_termcolors=256
    colorscheme solarized
else
    colorscheme desert
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ctrl-p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" LeaderF
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','_build','apps/emqx_dashboard/priv/www'],
        \ 'file': ['*.beam','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
let g:Lf_DefaultExternalTool = ""
let g:Lf_UseVersionControlTool = 0
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowHeight = 0.37
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_NumberOfCache = 120
let g:Lf_WindowPosition = 'popup'
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<left><left>


"should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'pygments'
let g:Lf_jtagsSkipUnreadable = 1
let g:Lf_GtagsSource = 2
" let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutF = "<C-P>"
let g:Lf_GtagsfilesCmd = {
            \ '.git': 'git ls-files --recurse-submodules|grep "erl\|hrl"',
            \ '.hg': 'hg files',
            \ 'default': 'rg --no-messages --files'
            \}
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','_build','apps/emqx_dashboard/priv/www'],
        \ 'file': ['*.beam','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}

" haskell_vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

