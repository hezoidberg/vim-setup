set number
syntax on
" colorscheme solarized8
let g:solarized_termcolors=256
set nofixendofline

" --> NERDTree
nmap <silent> <C-n> :NERDTreeFind<CR>
nnoremap <F4> :NERDTreeToggle<CR>
filetype plugin on
filetype plugin indent on

" --> Airline
let g:airline_theme='solarized'
set laststatus=2
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" --> Copy support
set clipboard=unnamed

" --> fzf search
set splitbelow

set rtp+=~/.fzf
let g:fzf_layout = {'window': '20split'}
" let g:fzf_layout = { 'down': '~40%' }

function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:fzf_action = {
  \ 'ctrl-t': 'GotoOrOpen tab',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1

nnoremap <C-g>b :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <silent> <F7> :Ag <C-R><C-W><CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-g>l :BLines<CR>
" https://github.com/junegunn/fzf/issues/1487
nnoremap <C-p> :Files<CR>

" ---> ctrlp
"
