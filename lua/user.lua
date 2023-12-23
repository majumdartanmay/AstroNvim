
local utils = require "astronvim.utils"


local maps = require("astronvim.utils").empty_map_table()
maps.n["<leader>a"] = { "ggvG", desc = "Select all" }
-- maps.v["//gf"] = { function()
--     vim.lsp.buf.format({ async = true })
-- end, {}}
--

function FormatFunction()
  vim.lsp.buf.format({
    async = true,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    }
  })
end

vim.api.nvim_set_keymap("v", "\\qf", "<Esc><cmd>lua FormatFunction()<CR>", {noremap = true})
utils.set_mappings(astronvim.user_opts("mappings", maps))
