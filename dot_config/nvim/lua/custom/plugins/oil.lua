return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      delete_to_trash = true,
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        -- Padding around the floating window
        padding = 10,
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
    }

    -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '\\', require('oil').toggle_float)
  end,
}
