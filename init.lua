-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.title = true

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
  callback = function()
    vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.titlestring = ""
  end,
})
