return {
    {
        "SirVer/ultisnips",
        event = "InsertEnter",
        init = function()
            -- Trigger keys
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "jk"
            vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

            -- Optional quality-of-life settings
            vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "my-snippets/ultisnips" }
            vim.g.UltiSnipsEnableSnipMate = 0
        end,
    },
    {
        "honza/vim-snippets"
    }
}
