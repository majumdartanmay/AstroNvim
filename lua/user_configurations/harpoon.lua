local harpoon = require("harpoon")

  -- REQUIRED
harpoon:setup({})
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local function remove_last_item()
    local harpoon_list = harpoon:list();
    harpoon_list:removeAt(harpoon_list:length())
end

vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>h1", function() harpoon:list():append() end, { desc = "Add to harpoon." });

vim.keymap.set("n", "<leader>h2", remove_last_item, { desc = "Remove last harpoon item" })
