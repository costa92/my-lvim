lvim.leader = "space"

-- lvim.lsp.automatic_servers_installation = true
lvim.lsp.installer.setup.ensure_installed = {}

lvim.colorscheme = "desert"

lvim.builtin.cmp.completion.keyword_length = 2
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "gomod",
}

lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true 
lvim.builtin.treesitter.matchup.enable = true
