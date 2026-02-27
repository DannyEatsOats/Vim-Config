return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    -- black-metal variants
    local blackmetal_variants = {
      'bathory',
      'burzum',
      'dark-funeral',
      'darkthrone',
      'emperor',
      'gorgoroth',
      'immortal',
      'impaled-nazarene',
      'khold',
      'marduk',
      'mayhem',
      'nile',
      'taake',
      'thyrfing',
      'venom',
      'windir',
    }

    -- convert to a set for O(1) lookup
    local blackmetal_set = {}
    for _, name in ipairs(blackmetal_variants) do
      blackmetal_set[name] = true
    end

    -- other themes you want installed
    local other_themes = {
      'terafox',
    }

    -- merge both lists for Themery picker
    local all_themes = vim.list_extend(vim.deepcopy(blackmetal_variants), other_themes)

    require('themery').setup {
      themes = all_themes,
      apply = function(theme)
        if blackmetal_set[theme] then
          -- special handling
          require('black-metal').setup { theme = theme }
          require('black-metal').load()
        else
          -- normal colorscheme
          vim.cmd.colorscheme(theme)
        end
      end,
      store = true,
    }
  end,
  vim.keymap.set('n', '<leader>tt', ':Themery<CR>', { desc = '[Th]eme Picker' }),
}
