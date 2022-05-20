local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.motoko = "typescript"

configs.setup({
  ensure_installed = {"lua", "scss", "vue", "javascript", "java", "bash", "yaml", "json"}, -- one of "all" or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    -- use_languagetree = true,
    enable = true, -- false will disable the whole extension
    -- disable = { "css", "html" }, -- list of language that will be disabled
    disable = { "markdown" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "python" } },
  context_commentstring = {
    enable = true,
    config = {
      -- Languages that have a single comment style
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },

  },
  autopairs = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    colors = {
      "Gold",
      "Orchid",
      "DodgerBlue",
      "Cornsilk",
      "Salmon",
      "LawnGreen",
    },
    disable = { "html" },
  },
  playground = {
    enable = false,
  },
})
