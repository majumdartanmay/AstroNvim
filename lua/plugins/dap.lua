local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

return {
  "mfussenegger/nvim-dap",
  enabled = true,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { handlers = {} },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
      config = require "plugins.configs.cmp-dap",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = require "plugins.configs.nvim-dap-vscode-js",
      keys = {
        {
          "<leader>da",
          function()
            if vim.fn.filereadable(".vscode/launch.json") then
              local dap_vscode = require("dap.ext.vscode")
              dap_vscode.load_launchjs(nil, {
                ["pwa-node"] = js_based_languages,
                ["chrome"] = js_based_languages,
                ["pwa-chrome"] = js_based_languages,
              })
            end
            require("dap").continue()
          end,
          desc = "Run with Args",
        },
      }
    }
  },
}
