local utils = require "astronvim.utils"


local maps = require("astronvim.utils").empty_map_table()
maps.n["<leader>a"] = { "GVgg", desc = "Select all" }

local range_formatting = function()
    local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    vim.lsp.buf.format({
        range = {
            ["start"] = { start_row, 0 },
            ["end"] = { end_row, 0 },
        },
        async = false,
    })
end

-- Stuff to just copy paste (my stylle)

vim.keymap.set("v", "<leader>123", range_formatting, { desc = "Range Formatting" })
vim.keymap.set("n", "dd", "\"_dd", { desc = "Remove line without cutting "})
vim.keymap.set("n", "dw", "\"_dw", { desc = "Remove word without cutting "})
vim.keymap.set("n", "diw", "\"_diw", { desc = "Remove WORD without cutting "})
vim.keymap.set("n", "x", "\"_x", { desc = "Remove character without cutting "})

vim.keymap.set("n", "<leader>dd", "dd", { desc = "Remove line with cutting "})
vim.keymap.set("n", "<leader>dw", "dw", { desc = "Remove word with cutting"})
vim.keymap.set("n", "<leader>x", "x", { desc = "Remove character with cutting "})
vim.keymap.set("n", "<leader>diw", "diw", { desc = "Remove WORD with cutting " })

-- Symbol renaming
vim.keymap.set("n", "__", vim.lsp.buf.rename , { desc = "Remove line with cutting "})

utils.set_mappings(astronvim.user_opts("mappings", maps))


-- Mappings for file servers
--
--
--
--
--Copy pasted this stuff from
--https://github.com/neovim/nvim-lspconfig
--
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

vim.keymap.set('i', '<C-b>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { noremap = true, silent = true })

require("mason-tool-installer").setup{
  ensure_installed = {
    "ast-grep",
    "biome",
    "js-debug-adapter",
    "lua-language-server",
    "rust-analyzer",
    "typescript-language-server"
  },
  run_on_start = true,
}

-- Add ability to copy the path of current buffer
vim.keymap.set('n', '<C-c>', function()
  local filePath = vim.api.nvim_buf_get_name(0);
  if filePath == "" then
    utils.notify("No buffer is open. Aborting copy-paste.");
    return;
  end
  filePath = string.gsub(filePath, "\\", "/");
  local command = string.format("redir @* | echo \"%s\" | redir END", filePath);
  utils.notify("Copied file path succesfully");
  vim.cmd(command);
end, { noremap = true, silent = true, desc = "Copy buffer path to clipboard" })

