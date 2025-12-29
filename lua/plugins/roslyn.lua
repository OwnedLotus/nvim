return {
  'seblyng/roslyn.nvim',
  ft = { 'cs', 'razor', 'cshtml' },
  opts = {
    roslyn_path = 'dotnet',
    roslyn_args = {
      vim.fn.stdpath 'data' .. '/mason/packages/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll',
    },
    capabilities = require('blink.cmp').get_lsp_capabilities(),
  },
  config = function(_, opts)
    require('roslyn').setup(opts)

    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
      pattern = { '*.razor', '*.cshtml' },
      callback = function()
        vim.bo.filetype = 'razor'
      end,
    })
  end,
}