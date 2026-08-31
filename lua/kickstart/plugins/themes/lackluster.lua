return {
  'anAcc22/sakura.nvim',
  dependencies = { 'rktjmp/lush.nvim' },
  lazy = false,
  priority = 1000, -- Load before other UI plugins
  config = function()
    vim.opt.background = 'dark' -- or "light"
  end,
}
