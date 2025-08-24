return {
  'tpope/vim-obsession',
  config = function()
    -- Automatically track sessions in git repos
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc() == 0 and vim.fn.isdirectory '.git' == 1 then
          vim.cmd 'Obsess Session.vim'
        end
      end,
    })
  end,
}
