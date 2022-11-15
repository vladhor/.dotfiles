local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  print("Indent-blankline not found!")
  return
end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

blankline.setup({
  show_end_of_line = true,
})
