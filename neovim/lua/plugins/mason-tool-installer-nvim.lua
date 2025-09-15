require('mason-tool-installer').setup({
  ensure_installed = {
    -- LSP
    -- DAP
    -- Linter
    -- Formatter

    -- Angular
    'angular-language-server',

    -- Ansible
    'ansible-language-server',
    'ansible-lint',

    -- Bash
    'bash-language-server',
    'bash-debug-adapter',
    'shellcheck',
    'shfmt',

    -- Clojure
    'clojure-lsp',
    'clj-kondo',
    'cljfmt',

    -- Cucumber
    'cucumber-language-server',
    'reformat-gherkin',

    -- Java
    'jdtls',
    'vscode-spring-boot-tools',
    'vscode-java-dependency',
    'vscode-java-decompiler',
    'java-debug-adapter',
    'java-test',
    'sonarlint-language-server',
    'checkstyle',
    'google-java-format',

    -- JavaScript and TypeScript
    'typescript-language-server',
    'eslint-lsp',
    'eslint_d',
    'prettierd',

    -- Lua
    'lua-language-server',
    'local-lua-debugger-vscode',
    'luacheck',
    'stylua',

    -- Markdown
    'marksman',
    'proselint',
    'markdownlint-cli2',

    -- SQL
    'postgrestools',
    'sqruff',
    'sleek',

    -- VimScript
    'vim-language-server',
    'vint',
  },
})
