vim.cmd [[set runtimepath^=~/.vim runtimepath+=~/.vim/after]]
vim.cmd [[let &packpath=&runtimepath]]
vim.cmd [[source ~/.vimrc]]

local before = vim.fn.expand("~/.config/nvim/before.lua")
if vim.fn.filereadable(before) == 1 then
  dofile(before)
end

local omnifunc_cache
function omnifunc_sync(findstart, base)
  local pos = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()

  if findstart == 1 then
    -- Cache state of cursor line and position due to the fact that it will
    -- change at the second call to this function (with `findstart = 0`). See:
    -- https://github.com/vim/vim/issues/8510.
    -- This is needed because request to LSP server is made on second call.
    -- If not done, server's completion mechanics will operate on different
    -- document and position.
    omnifunc_cache = {pos = pos, line = line}

    -- On first call return column of completion start
    local line_to_cursor = line:sub(1, pos[2])
    return vim.fn.match(line_to_cursor, '\\k*$')
  end

  -- Restore cursor line and position to the state of first call
  vim.api.nvim_set_current_line(omnifunc_cache.line)
  vim.api.nvim_win_set_cursor(0, omnifunc_cache.pos)

  -- Make request
  local bufnr = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(bufnr, 'textDocument/completion', params, 2000)
  if not result then return {} end

  -- Transform request answer to list of completion matches
  local items = {}
  for _, item in pairs(result) do
    if not item.err then
      local matches = vim.lsp.util.text_document_completion_list_to_complete_items(item.result, base)
      vim.list_extend(items, matches)
    end
  end

  -- Restore back cursor line and position to the state of this call's start
  -- (avoids outcomes of Vim's internal line postprocessing)
  vim.api.nvim_set_current_line(line)
  vim.api.nvim_win_set_cursor(0, pos)

  return items
end

-- Fix LSP servers that advertise diagnosticProvider as `true` but don't
-- actually handle textDocument/diagnostic. This causes two bugs:
-- 1. Neovim crashes: "attempt to index local 'cap' (a boolean value)"
-- 2. Server errors: "Unhandled method textDocument/diagnostic"
-- Fix: strip the bogus boolean capability so Neovim won't send the request.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    local dp = client.server_capabilities and client.server_capabilities.diagnosticProvider
    if dp == true then
      client.server_capabilities.diagnosticProvider = nil
    end
  end,
})

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gv', ':vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
    -- map('n', '<LEADER>jd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', {noremap=true, silent=true})
    -- map('n', '<LEADER>jv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', 'go', vim.diagnostic.open_float, bufopts)
end

local after = vim.fn.expand("~/.config/nvim/after.lua")
if vim.fn.filereadable(after) == 1 then
  dofile(after)
end
