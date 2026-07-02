-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local function transparent()
  local groups = {
    'Normal',
    'NormalNC',
    'EndOfBuffer',
    'SignColumn',
    'FoldColumn',
    'LineNr',
    'NormalFloat',
    'FloatBorder',

    'TabLine',
    'TabLineFill',
    'TabLineSel',

    'BufferLineBackground',
    'BufferLineFill',
    'BufferLineSeparator',
    'BufferLineSeparatorVisible',
    'BufferLineSeparatorSelected',
    'BufferLineTab',
    'BufferLineTabSelected',
    'BufferLineTabClose',
    'BufferLineIndicatorSelected',
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'NONE' })
  end
end

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.schedule(function()
      transparent()
    end)
  end,
})
