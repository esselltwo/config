return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = '1.*',
        opts = {
            open_cmd = 'firefox %s --new-window -P typst-preview --class typst-preview'
        }, -- lazy.nvim will implicitly calls `setup {}`
        keys = {
            { "<leader>ll", "<cmd>TypstPreviewToggle<CR>", desc = "Toggle preview on/off" },
            { "<leader>lf", "<cmd>TypstPreviewFollowCursorToggle<CR>", desc = "Toggle following cursor in preview on/off" },
            { "<leader>lv", "<cmd>TypstPreviewSyncCursor<CR>", desc = "Jump to current cursor position in preview" },
        }
    },

    {
        dir = vim.fn.stdpath("config") .. "/lua/typst-math",
        ft = "typst",

        config = function()
            local m = require("typst_math")

            _G.typst_in_math = function()
                return m.in_math()
            end

            vim.api.nvim_create_user_command("TypstInMath", function()
                local is_math = m.in_math()
                vim.notify(is_math and "true" or "false", vim.log.levels.INFO, {
                    title = "Typst math",
                })
            end, {
                desc = "Report whether the cursor is inside Typst math mode",
            })
        end,
    }
}
