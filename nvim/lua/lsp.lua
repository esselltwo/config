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

-- vim.env.LATEXINDENT_CONFIG = vim.fn.stdpath("config") .. "/latexindent/indentconfig.yaml"

vim.lsp.config["texlab"] = {

    cmd = { "texlab" },

    filetypes = { "tex" },

    settings = {
        texlab = {
            latexFormatter = "latexindent",
            latexindent = {
                global = true,
                modifyLineBreaks = true,
            },
        }
    }

}

vim.lsp.enable("texlab")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({async = false, timeout_ms = 10000})
end)
