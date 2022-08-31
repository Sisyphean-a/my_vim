
"#######################################################"
"##                                                   ##"
"##  ███╗   ███╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗  ##"
"##  ████╗ ████║╚██╗ ██╔╝    ██║   ██║██║████╗ ████║  ##"
"##  ██╔████╔██║ ╚████╔╝     ██║   ██║██║██╔████╔██║  ##"
"##  ██║╚██╔╝██║  ╚██╔╝      ╚██╗ ██╔╝██║██║╚██╔╝██║  ##"
"##  ██║ ╚═╝ ██║   ██║        ╚████╔╝ ██║██║ ╚═╝ ██║  ##"
"##  ╚═╝     ╚═╝   ╚═╝         ╚═══╝  ╚═╝╚═╝     ╚═╝  ##"
"##                                                   ##"
"#######################################################"


"#############################"
"###  Basic configuration  ###"
"#############################"
set nocompatible
filetype on

syntax enable
set showmode
set nu
set relativenumber

colorscheme desert
set cursorline

set ignorecase
set hlsearch
set incsearch

set clipboard+=unnamed

set autoindent
set smartindent

set t_Co=256
set updatetime=100

set undofile
set history=1000

set wildmenu
set wildmode=longest:list,full
set complete-=i
set complete+=t

set clipboard=unnamed

"----------------------"
"     Key mapping      "
map s :w<CR>
map Q :q<CR>
"----------------------"


"----------------------"
"     statusline       "
set statusline=%f%m%r%h%w%=\ [%Y]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [%p%%]\ [len=%L]
"----------------------"


"----------------------"
"     restore read     "
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"----------------------"


"----------------------"
"    Onekey run code   "
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!time python %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc
"----------------------"

"###############################"
"####        vim-plug      #####"
"###############################" 
call plug#begin('~/.vim/plugged')

  "start menu"
  Plug 'mhinz/vim-startify'

  "calendar"
  Plug 'itchyny/calendar.vim', {'on': 'Calendar'} 

  "The color"
  Plug 'morhetz/gruvbox'		

  "fzf"
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'

  "Latex"
  Plug 'lervag/vimtex'

  "markdown"
  Plug 'godlygeek/tabular', {'for':'markdown'}
  Plug 'preservim/vim-markdown', {'for':'markdown'}

  "code snippet"
  "Plug 'SirVer/ultisnips', {'for':'markdown'}

  "Code completion"
  "need install node.js and npm"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  "tag bar"
  "need install ctags"
  Plug 'majutsushi/tagbar'

  "Quick select"
  Plug 'gcmt/wildfire.vim'

  "To change around"
  Plug 'tpope/vim-surround'

  "The color scheme"
  Plug 'crusoexia/vim-monokai' 

  "smooth scroll"
  Plug 'terryma/vim-smooth-scroll'

  "view file tree"
  Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
  
  "file icon"
  Plug 'ryanoasis/vim-devicons'

call plug#end()




"##############################"
"#####    nerdtree       ######"
"##############################"

map ff :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"##############################"
"#####       Latex       ######"
"##############################"
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0

let g:vimtex_view_general_viewer = 'evince'
"let g:vimtex_view_method = 'evince'

" need 'pip3 install neovim-remote'
let g:vimtex_compiler_progname = 'nvr'

set conceallevel=1
let g:tex_conceal='abdmg'

" set vimtex toc
let g:vimtex_toc_config = {
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\}

"##############################"
"#####    markdown       ######"
"##############################"
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_disabled = 1

"-------markdown setting-------"
auto Filetype markdown inoremap <buffer>,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l<CR>
auto Filetype markdown inoremap <buffer>,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
auto Filetype markdown inoremap <buffer>,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
auto Filetype markdown inoremap <buffer>,1 #<Space><Enter><++><Esc>kA 
auto Filetype markdown inoremap <buffer>,2 ##<Space><Enter><++><Esc>kA 
auto Filetype markdown inoremap <buffer>,3 ###<Space><Enter><++><Esc>kA 
auto Filetype markdown inoremap <buffer>,4 ####<Space><Enter><++><Esc>kA 
auto Filetype markdown inoremap <buffer>,l -------<Enter>
auto Filetype markdown inoremap <buffer>,d ``<++><Esc>F`i
auto Filetype markdown inoremap <buffer>,j <Esc><Enter>i

"##############################"
"#####     gruvbox       ######"
"##############################"
autocmd vimenter * ++nested colorscheme gruvbox

"##############################"
"#####   ulti snippet    ######"
"##############################"
"let g:UltiSnipsExpandTriggen = '<tab>'


"##############################"
"#####   smooth-scroll   ######"
"##############################"
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

"##############################"
"#####       tagbar      ######"
"##############################"
"let tagbar support markdown 
let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'	: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }

nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30


"##############################"
"#####     coc.nvim      ######"
"##############################"

"------------------------------"
"       The coc plug-in        "
"------------------------------"
let g:coc_global_extensions = [
		\ 'coc-json',
		\ 'coc-vimlsp',
		\ 'coc-git',
		\ 'coc-highlight',
		\ 'coc-sh',
		\ 'coc-pyright',
		\ 'coc-tabnine',
		\ 'coc-translator',
		\ 'coc-vimtex',    
		\ 'coc-snippets',
		\ 'coc-java',
		\ 'coc-java-intellicode',
		\ 'coc-xml',
		\]

"------------------------------"
"      coc  Key mapping        "
"------------------------------"

"translator
nmap tt <Plug>(coc-translator-p)

"calendar
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>



"------------------------------"
"      coc  basic config       "
"------------------------------"

set hidden
set nobackup
set nowritebackup
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" 
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"###############################################"
"##                                           ##"
"##  .__   __. ____    ____  __  .___  ___.   ##"
"##  |  \ |  | \   \  /   / |  | |   \/   |   ##"
"##  |   \|  |  \   \/   /  |  | |  \  /  |   ##"
"##  |  . `  |   \      /   |  | |  |\/|  |   ##"
"##  |  |\   |    \    /    |  | |  |  |  |   ##"
"##  |__| \__|     \__/     |__| |__|  |__|   ##"
"##                                           ##"
"###############################################"




