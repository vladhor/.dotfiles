local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("Mason not found")
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("Mason-lspconfig not found")
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  print("Mason-null-ls not found")
end


mason.setup()

mason_lspconfig.setup({
  PATH = "prepend",
  ensure_installed = {
    "awk_ls",
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "groovyls",
    "html",
    "jsonls",
    "sumneko_lua",
    "marksman",
    "pyright",
    "tflint",
    "vimls",
    "lemminx",
    "yamlls",
  },
})

mason_null_ls.setup({
  ensure_installed = {
    -- FORMATTERS:
    "black",
    "beautysh",
    "cbfmt",
    "djlint",
    "fixjson",
    "sql-formatter",
    "stylua",
    "yamlfmt",
    -- LINTERS:
    "cspell",
    "flake8",
    "gitlint",
    "luacheck",
    "jsonlint",
    "markdownlint",
    "misspell",
    "shellcheck",
    "yamllint",
  }
})
