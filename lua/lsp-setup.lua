-- [[ Configure LSP ]]
local set_keymaps = function(bufnr)
  -- Local utility function for reuse
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  --vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --vim.lsp.buf.format()
  --end, { desc = 'Format current buffer with LSP' })
end

local on_attach_generic = function(_, bufnr)
  set_keymaps(bufnr)
end

local on_attach_ruff = function(client, bufnr)
  set_keymaps(bufnr)
  client.server_capabilities.hoverProvider = false
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
local servers = {
  clangd = { filetypes = { 'c', 'cpp' } },
  pyright = { filetypes = { 'python' } },
  ruff_lsp = { filetypes = { 'python' } },
  bufls = { filetypes = { 'proto' } },
  bashls = { filetypes = { 'sh' } },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
  jsonls = { filetypes = { 'json' } },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name ~= nil and server_name == 'ruff_lsp' then
      -- Custom handling for ruff_lsp
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach_ruff,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end,
        },
      }
    elseif server_name ~= nil and server_name == 'clangd' then
      -- Using clangd with cpplint causes a complaint about encoding; have
      -- clangd use cpplint's default of utf-8
      local clangd_capabilities = {}
      for k, v in pairs(capabilities) do
        -- Shallow copy is fine for this since offsetEncoding is at the top level
        clangd_capabilities[k] = v
      end
      clangd_capabilities.offsetEncoding = 'utf-8'

      -- Custom handling for clangd
      require('lspconfig')[server_name].setup {
        capabilities = clangd_capabilities,
        on_attach = on_attach_generic,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    else
      -- Normal handling for everything else
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach_generic,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end
  end,
}

-- vim: ts=2 sts=2 sw=2 et
