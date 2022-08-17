-- 在命中buffer中使用q退出
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "null-ls-info" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- 高亮复制内容
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- 自动切换输入法
vim.api.nvim_create_autocmd({ "InsertLeave", "BufCreate", "BufEnter", "BufLeave" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[
      silent !fcitx5-remote -c
    ]]
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
