local M = {}

M.config = function()
    lvim.plugins = {
        { "lunarvim/colorschemes" },
{
    "chrisgrieser/nvim-various-textobjs",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
        require("various-textobjs").setup({
            useDefaultKeymaps = true,
            lookForwardLines = 10,
        })
        -- example: `an` for outer subword, `in` for inner subword
        vim.keymap.set({ "o", "x" }, "aS", function()
            require("various-textobjs").subword(false)
        end)
        vim.keymap.set({ "o", "x" }, "iS", function()
            require("various-textobjs").subword(true)
        end)
    end,
},
    {
    "ibhagwan/smartyank.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
        require("smartyank").setup()
    end,
},
        {
            "f-person/git-blame.nvim",
            event = "BufRead",
            config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            require("gitblame").setup { enabled = true }
            end,
        },
        {
            "ggandor/lightspeed.nvim",
            event = "BufRead",
        },
        {
            "tpope/vim-fugitive",
            cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
            },
            ft = {"fugitive"}
        },
        {
          "stevearc/dressing.nvim",
          config = function()
            require("dressing").setup({
              input = { enabled = false },
            })
          end,
        },
        {
          "nvim-neorg/neorg",
          ft = "norg", -- lazy-load on filetype
          config = true, -- run require("neorg").setup()
        },
        {
          "olexsmir/gopher.nvim",
          "leoluz/nvim-dap-go",
        },
        {
          "Pocco81/auto-save.nvim",
          config = function()
            require("auto-save").setup()
          end,
        },
        {
            "phaazon/hop.nvim",
            event = "BufRead",
            config = function()
              require("hop").setup()
              vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
              vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
            end,
        },
        {
           "simrat39/symbols-outline.nvim",
            config = function()
              require('symbols-outline').setup()
            end,
        },
        {
           "sindrets/diffview.nvim",
           event = "BufRead",
        },
        {
          "ruifm/gitlinker.nvim",
          event = "BufRead",
          config = function()
          require("gitlinker").setup {
                opts = {
                  -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                  -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                  -- print the url after performing the action
                    print_url = false,
                  -- mapping to call url generation
                    mappings = "<leader>gy",
                },
              }
          end,
          dependencies = "nvim-lua/plenary.nvim",
        },
        {
          "rmagatti/goto-preview",
          config = function()
          require('goto-preview').setup {
              width = 120; -- Width of the floating window
              height = 25; -- Height of the floating window
              default_mappings = false; -- Bind default mappings
              debug = false; -- Print debug information
              opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
              post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
              -- You can use "default_mappings = true" setup option
              -- Or explicitly set keybindings
              -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
              -- vim.cmd("nnoremap gpi <cmd>lua require('
              -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
          }
          end,
        },
        {
          "norcalli/nvim-colorizer.lua",
            config = function()
              require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                  RGB = true, -- #RGB hex codes
                  RRGGBB = true, -- #RRGGBB hex codes
                  RRGGBBAA = true, -- #RRGGBBAA hex codes
                  rgb_fn = true, -- CSS rgb() and rgba() functions
                  hsl_fn = true, -- CSS hsl() and hsla() functions
                  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              })
          end,
        },
        {
          "folke/todo-comments.nvim",
          event = "BufRead",
          config = function()
            require("todo-comments").setup()
          end,
        },
        {
          "itchyny/vim-cursorword",
          event = {"BufEnter", "BufNewFile"},
          config = function()
            vim.api.nvim_command("augroup user_plugin_cursorword")
            vim.api.nvim_command("autocmd!")
            vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
            vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
            vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
            vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
            vim.api.nvim_command("augroup END")
          end
        },
        {
          "npxbr/glow.nvim",
          ft = {"markdown"}
          -- build = "yay -S glow"
        },
      {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
          vim.g.mkdp_auto_start = 1
        end,
      },
      {
        "folke/lsp-colors.nvim",
        event = "BufRead",
      },
      {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
          vim.defer_fn(function()
            require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
            require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
          end, 100)
        end,
      },
        -- comments plugins --
      {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end,
      },
    }
  end
return M
