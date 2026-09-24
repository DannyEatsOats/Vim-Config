return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup {
      -- Whether to attach navic to language servers automatically
      attach_navic = true,

      -- Prevents the window from jumping when the bar appears
      create_autocmd = false,
    }

    -- Autocmd to update barbecue when the window layout changes
    vim.api.nvim_create_autocmd({
      'WinScrolled',
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })
  end,
}
