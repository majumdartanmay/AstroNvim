
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

vim.keymap.set("v", "<leader>123", range_formatting, { desc = "Range Formatting" })
vim.keymap.set("n", "dd", "\"_dd", { desc = "Remove line without cutting "})
vim.keymap.set("n", "dw", "\"_dw", { desc = "Remove word without cutting "})
vim.keymap.set("n", "diw", "\"_diw", { desc = "Remove WORD without cutting "})
vim.keymap.set("n", "x", "\"_x", { desc = "Remove character without cutting "})

vim.keymap.set("n", "<leader>dd", "dd", { desc = "Remove line with cutting "})
vim.keymap.set("n", "<leader>dw", "dw", { desc = "Remove word with cutting"})
vim.keymap.set("n", "<leader>x", "x", { desc = "Remove character with cutting "})
vim.keymap.set("n", "<leader>diw", "diw", { desc = "Remove WORD with cutting " })
-- Range formatting

utils.set_mappings(astronvim.user_opts("mappings", maps))
