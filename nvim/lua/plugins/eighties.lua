return {
    "lithammer/vim-eighties",
    lazy = false,
    config = function()
        vim.opt.termguicolors=true
        vim.cmd([[colorscheme eighties]])
    end,
}
