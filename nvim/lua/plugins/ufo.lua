return {
  { 'kevinhwang91/promise-async' },
  {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    opts = {
      foldcolumn = '1', -- Show foldcolumn
      foldlevel = 99,
      foldlevelstart = 99,
      foldenable = true,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' } -- Prioritize treesitter, fall back to indent
      end,
    },
    config = function(_, opts)
      -- Apply folding options from opts
      vim.o.foldcolumn = opts.foldcolumn
      vim.o.foldlevel = opts.foldlevel
      vim.o.foldlevelstart = opts.foldlevelstart
      vim.o.foldenable = opts.foldenable

      -- Key mappings for opening and closing all folds
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Define handler function for fold virtual text
      local handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (' 󰁂 %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
              local chunkText = chunk[1]
              local chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if targetWidth > curWidth + chunkWidth then
                  table.insert(newVirtText, chunk)
              else
                  chunkText = truncate(chunkText, targetWidth - curWidth)
                  local hlGroup = chunk[2]
                  table.insert(newVirtText, {chunkText, hlGroup})
                  chunkWidth = vim.fn.strdisplaywidth(chunkText)
                  -- Padding if width from truncate is less than target
                  if curWidth + chunkWidth < targetWidth then
                      suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                  end
                  break
              end
              curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, {suffix, 'MoreMsg'})
          return newVirtText
      end

      -- Setup nvim-ufo with options and handler
      require('ufo').setup(vim.tbl_extend('force', opts, {
          fold_virt_text_handler = handler,
      }))

      -- Optional: Set handler for buffer scope to override global handler if needed
      -- local bufnr = vim.api.nvim_get_current_buf()
      -- require('ufo').setFoldVirtTextHandler(bufnr, handler)
    end,
  }
}
