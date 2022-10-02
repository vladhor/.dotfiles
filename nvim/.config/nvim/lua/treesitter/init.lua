require'nvim-treesitter.configs'.setup {
    -- ensure_installed can be "all" or a list of languages { "python", "bash" }
    ensure_installed = {
      'python',
      'markdown',
      'vim',
      'lua',
      'dockerfile',
      'gitignore',
      'html',
      'json',
      'hcl',
      'yaml'
    },

    sync_install = false,

    highlight = { -- enable highlighting for all file types
      enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
      additional_vim_regex_highlighting = true,
    },

    indent = {
      enable = true
    },
}
