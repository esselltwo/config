-- font
vim.o.guifont = "Berkeley Mono:h11"

-- tab stops
vim.opt.hlsearch=false
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

-- not sure I actually use this?
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

-- spelling
vim.opt.spelllang = "en"
vim.opt.spellfile = vim.fn.expand("$HOME/my-config/en.utf-8.add")
vim.opt.spell = true

-- line numbers
vim.opt.number = true

-- filetype specific things

-- smaller tabs for some filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typst", "tex"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})
