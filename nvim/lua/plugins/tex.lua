return {
    'lervag/vimtex',
    lazy = false,
    init = function()
        vim.g.vimtex_tex_flavor = 'latex'

        vim.g.vimtex_compiler_enabled = 1

        -- Viewer
        vim.g.vimtex_view_method = "zathura"

        -- Conceal settings
        --vim.opt.conceallevel = 1
        --vim.g.tex_conceal = "abdmg"

        -- Ignore some common warnings in quickfix
        vim.g.vimtex_quickfix_ignore_filters = {
            "Marginpar on page",
            "Overfull \\\\hbox",
            "Underfull \\\\hbox",
        }

        vim.g.vimtex_mappings_enabled = 1
        vim.g.vimtex_mappings_prefix = "<localleader>"
    end
}
