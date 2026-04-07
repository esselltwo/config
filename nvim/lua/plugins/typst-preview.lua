return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = '1.*',
  opts = {
  }, -- lazy.nvim will implicitly calls `setup {}`
  keys = {
    { "<leader>l", "<cmd>TypstPreviewToggle<CR>", desc = "Toggle preview on/off" },
    { "<leader>f", "<cmd>TypstPreviewFollowCursorToggle<CR>", desc = "Toggle following cursor in preview on/off" },
    { "<leader>v", "<cmd>TypstPreviewSyncCursor<CR>", desc = "Jump to current cursor position in preview" },
  }
}
