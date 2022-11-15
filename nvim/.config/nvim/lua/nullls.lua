local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  print("Null-ls not found!")
  return
end


-- LINTER: A linter is a static code analysis tool used to provide diagnostics around programming errors,
-- bugs, stylistic errors and suspicious constructs. Linters can be executed as a standalone program in a
-- terminal, where it usually expects one or more input files to lint.
--
-- FORMATTER: A code formatter is a tool that reformats code to fit a certain formatting convention. This
-- usually entails things like adjusting indentation, breaking long lines into smaller lines, adding or
-- removing whitespaces. Formatting rules are often included as a separate configuration file within the
-- project.

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.black,
    formatting.beautysh,
    formatting.cbfmt,
    formatting.djlint,
    formatting.fixjson,
    formatting.stylua,
    formatting.yamlfmt,
    diagnostics.flake8,
    diagnostics.gitlint,
    diagnostics.luacheck,
    diagnostics.jsonlint,
    diagnostics.misspell,
    diagnostics.shellcheck,
    diagnostics.yamllint,
  }
})
