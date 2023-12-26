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
      config = require "plugins.configs.nvim-dap-vscode-js"
    }
  },
  event = "User AstroFile",
}
