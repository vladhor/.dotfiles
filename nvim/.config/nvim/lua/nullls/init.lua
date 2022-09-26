local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.stylua,
	formatting.mdformat,
	formatting.shellharden,
	diagnostics.flake8,
	diagnostics.ansiblelint,
	diagnostics.shellcheck,
	diagnostics.yamllint,
	diagnostics.hadolint,
	diagnostics.actionlint,
	diagnostics.gitlint,
}


null_ls.setup({
	sources = sources,
})
