-- Minimal Neovim plugin to detect if cursor is inside Typst math
-- vibecoded please don't get mad at me

local M = {}

-- Check if cursor is inside a math token

local function get_node()
    return vim.treesitter.get_node({ ignore_injections = false })
end

function M.in_math()
    local node = get_node()

    while node do
        if node:type():match("math") then
            return true
        end
        node = node:parent()
    end

    return false
end

return M
