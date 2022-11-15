local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("Lualine not found!")
  return
end

lualine.setup({
  options = { 
    theme = 'gruvbox',
  }
})
