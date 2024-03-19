silent! source $HOME/.config/nvim/colorscheme.vim

if !exists('*TrapSignal')
    function TrapSignal()
        silent! source $HOME/.config/nvim/colorscheme.vim
        AirlineRefresh
        redraw
    endfunction
endif
autocmd Signal SIGUSR1 call TrapSignal()
