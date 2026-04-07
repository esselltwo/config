vim.lsp.config["tinymist"] = {

    cmd = { "tinymist" },

    filetypes = { "typst" },

    settings = {
        -- ...
    }

}

vim.lsp.enable("tinymist")
