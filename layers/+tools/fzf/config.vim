if g:spacevim.gui && !has('terminal')
  " LeaderF {
  nnoremap <Leader>ff :LeaderfFile ~<CR>
  nnoremap <Leader>f? :LeaderfFile<CR>
  nnoremap <Leader>fr :LeaderfMru<CR>
  nnoremap <Leader>fl :LeaderfLine<CR>
  nnoremap <Leader>fL :LeaderfLineAll<CR>
  " }
else
  " fzf.vim {
  " Refer to https://github.com/liuchengxu/space-vim/issues/364
  let $LANG = 'en_US.UTF-8'
  " Customize fzf colors to match your color scheme
  " Only suitable for space-vim-dark theme, other themes are not guaranteed.
  let g:fzf_colors = {
              \ 'fg':      ['fg', 'StatusLineNC'],
              \ 'bg':      ['bg', 'Normal'],
              \ 'hl':      ['fg', 'String'],
              \ 'fg+':     ['fg', 'Number', 'Normal'],
              \ 'bg+':     ['bg', 'StatusLine', 'Normal'],
              \ 'hl+':     ['fg', 'Exception'],
              \ 'info':    ['fg', 'Special'],
              \ 'prompt':  ['fg', 'Function'],
              \ 'pointer': ['fg', 'Error'],
              \ 'marker':  ['fg', 'Error'],
              \ 'spinner': ['fg', 'Statement'],
              \ 'header':  ['fg', 'Number'],
              \   }

  " fzf.vim doesn't enable preview feature by default.
  command! -bang -nargs=* Ag
              \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  command! -nargs=* Rag call spacevim#plug#fzf#AgInProject(<q-args>)
  command! -bang -nargs=* Rg call spacevim#plug#fzf#Rg(<q-args>, <bang>0)

  nmap <Leader>? <plug>(fzf-maps-n)
  xmap <Leader>? <plug>(fzf-maps-x)
  omap <Leader>? <plug>(fzf-maps-o)

  nnoremap <Leader>ag :Ag!<CR>
  vnoremap <Leader>ag :<c-u>call spacevim#plug#fzf#Vsearch()<CR>
  nnoremap <Leader>bb :Buffers<CR>

  nnoremap <Leader>b? :Buffers<CR>
  nnoremap <Leader>w? :Windows<CR>
  nnoremap <Leader>f? :Files<CR>

  nnoremap <Leader>ff :Files ~<CR>
  nnoremap <silent> <Leader>sf :call spacevim#plug#fzf#Session()<CR>

  nnoremap <leader>rg :Rg!<cr>
  vnoremap <leader>rg :call spacevim#plug#fzf#RgVisual()<CR>

  if !spacevim#load('unite')
    nnoremap <LocalLeader>v :call spacevim#plug#fzf#Open()<CR>
    nnoremap <LocalLeader>p :call spacevim#plug#fzf#Rtp()<CR>
    nnoremap <LocalLeader>fc :call spacevim#plug#fzf#FZFCmd()<CR>
    nnoremap <LocalLeader>ff :call spacevim#plug#fzf#Func()<CR>
  endif

  " }
endif
