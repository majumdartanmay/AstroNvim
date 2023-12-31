return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies= {
      "williamboman/mason.nvim",
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonUpdate", -- AstroNvim extension here as well
        "MasonUpdateAll", -- AstroNvim specific
      },
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
          },
        },
      },
      build = ":MasonUpdate",
      config = require "plugins.configs.mason",
    },
    ensure_installed = {
      "ast-grep ast_grep",
      "biome",
      "js-debug-adapter",
      "lua-language-server",
      "rust-analyzer",
      "typescript-language-server"

    }
  }
}
