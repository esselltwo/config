vim.lsp.config["tinymist"] = {

    cmd = { "tinymist" },

    filetypes = { "typst" },

    settings = {
        formatterMode = "typstyle",
        formatterProseWrap = true, -- wrap lines in content mode
        formatterPrintWidth = 80,  -- limit line length to 80 if possible
        formatterIndentSize = 2,   -- indentation width
    }

}

vim.lsp.enable("tinymist")

vim.lsp.config["texlab"] = {

    cmd = { "texlab" },

    filetypes = { "tex" },

    settings = {
        texlab = {
            latexFormatter = "tex-fmt",
        }
    }

}

vim.lsp.enable("texlab")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({async = false})
end)
