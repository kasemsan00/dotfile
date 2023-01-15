vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
-- vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  timeout = 500,
}

--   { "ColorScheme", { pattern = { "*" }, command = "highlight Special guifg=#5c5cff" } }
-- }
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<c-k>"] = false
lvim.keys.visual_mode["jj"] = "<ESC>"
lvim.keys.visual_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["jj"] = "<Esc>"
-- lvim.keys.normal_mode["<C-<Down>"] = {}
-- lvim.keys.normal_mode["<C-<Up>"] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }


lvim.builtin.telescope.theme = 'default'
lvim.builtin.telescope.pickers = { find_files = { hidden = true } } -- Show hidden files in results
lvim.builtin.telescope.defaults = { file_ignore_patterns = { ".git", "node_modules", ".next", ".vercel" } }
lvim.builtin.which_key.mappings["v"] = {}
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<cr>", "projects" }
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep<cr>", "projects" }
lvim.builtin.which_key.mappings["ff"] = { "<cmd>Telescope find_files<cr>", "projects" }
lvim.builtin.which_key.mappings["fw"] = { "<cmd>Telescope live_grep<cr>", "projects" }
lvim.builtin.which_key.mappings["fb"] = { "<cmd>Telescope buffers<cr>", "projects" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>NvimTreeFocus<cr>", "Explorer" }
lvim.builtin.which_key.mappings["tf"] = { "<cmd>ToggleTerm<cr>", "projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  w = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  d = { "<cmd> lua vim.diagnostic.open_float() <CR>", "?   toggles local troubleshoot" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
}

-- lvim.builtin.which_key.mappings["dd"] = { "<cmd> lua vim.diagnostic.open_float() <CR>", "?   toggles local troubleshoot" }
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<cr>"
lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.treesitter.rainbow.enable = true

-- -- Change theme settings
-- lvim.colorscheme = "catppuccin"
lvim.colorscheme = "dracula"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.transparent_window = false
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
-- lvim.builtin.cmp.sources = {
--   { name = "crates", group_index = 1 },
--   { name = "nvim_lsp", group_index = 1, max_item_count = 30 },
--   { name = "nvim_lua", group_index = 2 },
--   { name = "copilot", group_index = 2 },
--   { name = "luasnip", group_index = 2 },
--   { name = "buffer", group_index = 2 },
--   { name = "cmp_tabnine", group_index = 2 },
--   { name = "path", group_index = 2 },
--   { name = "emoji", group_index = 2 },
-- }

lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }
lvim.builtin.cmp.window = {
  completion = {
    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
  },
  documentation = {
    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
  },
}

lvim.builtin.treesitter.highlight.enable = true
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact", "javascript" } }
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black" },
  {
    command = "prettier",
    filetypes = { "css", "typescript", "typescriptreact", "javascript", "yaml", "dockerfile", "json" },
  },
}
-- vim.cmd("au BufWritePre * :silent! Neoformat")
-- vim.cmd("au BufEnter *.py lua lvim.format_on_save = false")

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  { "sbdchd/neoformat" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", config = function()
    require("mason-tool-installer").setup {
      ensure_installed = {
        "prettierd",
        "astro-language-server",
        "bash-language-server",
        "css-lsp",
        "deno",
        "dockerfile-language-server",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
        "python-lsp-server",
      }
    }
  end },
  {
    'navarasu/onedark.nvim'
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
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
    "rktjmp/lush.nvim",
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { 'EdenEast/nightfox.nvim' },
  { 'bluz71/vim-nightfly-colors' },
  { "haishanh/night-owl.vim" },
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  { "MunifTanjim/prettier.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "Mofiqul/dracula.nvim", config = function()
    require("dracula").setup({
      colors = {
        bg = "#272a36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#272a36",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#21222c",
      },
      -- set custom lualine background color
      lualine_bg_color = "#282A36", -- default nil
      -- set italic comment
      italic_comment = true, -- default false
      -- overrides the default highlights see `:h synIDattr`
      overrides = {
        -- Examples
        -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
        NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        Nothing = {} -- clear highlight of Nothing
      },
    })
    vim.cmd("colorscheme dracula")
  end },
}
