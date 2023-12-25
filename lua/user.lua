
local utils = require "astronvim.utils"


local maps = require("astronvim.utils").empty_map_table()
maps.n["<leader>a"] = { "ggvG", desc = "Select all" }

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


-- Confgureing DAP for node
--
--
-- require("dap-vscode-js").setup({
--   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
--   -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--   -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--     },
--     {
--       type = "pwa-node",
--       request = "attach",
--       name = "Attach",
--       processId = require'dap.utils'.pick_process,
--       cwd = "${workspaceFolder}",
--     }
--   }
-- end
