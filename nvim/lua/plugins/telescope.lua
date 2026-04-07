return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require("telescope").setup()
    end,
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            {
                "<c-s-p>",
                function()
                    builtin.find_files()
                end
            },
            {
                "<c-p>",
                function()
                    builtin.buffers()
                end
            }
        }
    end
}
