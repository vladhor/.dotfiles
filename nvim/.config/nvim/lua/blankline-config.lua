local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  print("Indent-blankline not found!")
  return
end

blankline.setup({
  show_end_of_line = true,
})
