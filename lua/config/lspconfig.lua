local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}


local servers = {
  "angularls", -- Angular
  --"arduino_language_server", -- Arduino
  "awk_ls", -- AWK
  "bashls", -- BASH
  --"clangd", -- C, CPP
  "cmake", -- CMake
  "cssls", -- CSS
  --"omnisharp_mono", -- C#
  "dartls",
  "dockerls", -- Docker
  "gopls", -- GO
  "graphql", -- GraphQL
  "groovyls", -- Groovy
  "html", -- HTML
  "jdtls", -- Java
  "tsserver", -- JavaScript, TypeScript
  "jsonls", -- JSON
  "kotlin_language_server", -- Kotlin
  "texlab", -- LaTeX
  --"lua_ls", -- LUA
  "marksman", --Markdown
  "pyright", -- Python
  "rust_analyzer", -- Rust
  "sqlls", -- SQL
  "lemminx", -- XML
  --"yamlls" -- YAML
}

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("lspconfig")["arduino_language_server"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-clangd", "/Users/attict/.local/share/nvim/mason/bin/clangd",
    "-cli", "/opt/homebrew/bin/arduino-cli",
    "-cli-config", "/Users/attict/Library/Arduino15/arduino-cli.yaml",
    "-fqbn", "arduino:avr:mega"
  },
  --settings = {
  --  arduino_language_server = {
  --    cli_config = "/Users/attict/Documents/learning/arduino/00_MyFirstSketch/sketch.yaml",
  --  },
  --  --cli_config = "/Users/attict/Library/Arduino15/arduino-cli.yaml",
  --  --arduino_language_server = {
  --  --  cli_config = "/Users/attict/Library/Arduino15/arduino-cli.yaml",
  --  --},
  --},
}

require("lspconfig")["clangd"].setup {
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    --'--query-driver="/usr/local/opt/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gcc"'
  },
  filetypes = {"c", "cpp", "objc", "objcpp", "metal"},
}

-- SourceKit: Apple / Swift / Obj-C
require("lspconfig").sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    sourcekit = {
      sdkPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk",
      targetArch = "x86_64-apple-ios16.4-simulator",
    },
  },
}

require("lspconfig")["lua_ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "on_attach" },
      },
    }
  }
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      keyOrdering = false
    }
  }
}
