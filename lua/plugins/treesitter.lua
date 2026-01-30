local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

configs.setup {
  ensure_installed = { 'cpp', 'c', 'python', 'javascript', 'lua', 'typescript' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
