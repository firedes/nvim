vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "null-ls-info" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.cmd [[
--        if line("'\"") >= 1 && line("'\"") <= line("$")
--        |   exe "normal! g`\""
--        | endif
--     ]]
--   end,
-- })
