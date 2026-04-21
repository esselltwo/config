-- Minimal Neovim plugin to detect if cursor is inside Typst math
-- using LSP semantic tokens (works with tinymist if it provides tokens)
-- vibecoded please don't get mad at me
-- but whatever ChatGPT wrote was very complicated and didn't work and 
-- I think this does

local M = {}

-- Check if cursor is inside a math token
function M.in_math()
  local tokens = vim.lsp.semantic_tokens.get_at_pos()

  if tokens then
    for _, token in ipairs(tokens) do
          if token.modifiers["math"] then
              return true
          end
      end
   end

  return false
end

return M
