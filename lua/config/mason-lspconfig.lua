local options = {
  ensure_installed = {
    "angularls", -- Angular
    "arduino_language_server", -- Arduino
    "awk_ls", -- AWK
    "bashls", -- BASH
    "clangd", -- C, CPP
    "cmake", -- CMake
    "cssls", -- CSS
    --"omnisharp_mono", -- C#
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
    "lua_ls", -- LUA
    "marksman", --Markdown
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "sqlls", -- SQL
    "lemminx", -- XML
    "yamlls" -- YAML
  },
}

require("mason-lspconfig").setup(options)
