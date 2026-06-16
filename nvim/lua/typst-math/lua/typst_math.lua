-- Minimal Neovim plugin to detect if cursor is inside Typst math
-- using LSP semantic tokens (works with tinymist if it provides tokens)
-- vibecoded please don't get mad at me
-- but whatever ChatGPT wrote was very complicated and didn't work and
-- I think this does

local M = {}

local function get_tokens_at_cursor()
  local ok, tokens = pcall(vim.lsp.semantic_tokens.get_at_pos)
  if not ok or tokens == nil then
    return {}
  end

  if tokens.modifiers ~= nil then
    return { tokens }
  end

  return tokens
end

-- Check if cursor is inside a math token
function M.in_math()
  for _, token in ipairs(get_tokens_at_cursor()) do
    local modifiers = token.modifiers or {}
    if modifiers.math then
      return true
    end
  end

  return false
end

return M
