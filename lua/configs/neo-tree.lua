require("neo-tree").setup(astronvim.user_plugin_opts("plugins.neo-tree", {
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = false,
    content_layout = "center",
    tab_labels = {
      filesystem = astronvim.get_icon("FolderClosed") .. " File",
      buffers = astronvim.get_icon("DefaultFile") .. " Bufs",
      git_status = astronvim.get_icon("Git") .. " Git",
      diagnostics = astronvim.get_icon("Diagnostic") .. " Diagnostic",
    },
  },
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      with_expanders = false,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = astronvim.get_icon("FolderClosed"),
      folder_open = astronvim.get_icon("FolderOpen"),
      folder_empty = astronvim.get_icon("FolderEmpty"),
      default = astronvim.get_icon("DefaultFile"),
    },
    git_status = {
      symbols = {
        added = astronvim.get_icon("GitAdd"),
        deleted = astronvim.get_icon("GitDelete"),
        modified = astronvim.get_icon("GitChange"),
        renamed = astronvim.get_icon("GitRenamed"),
        untracked = astronvim.get_icon("GitUntracked"),
        ignored = astronvim.get_icon("GitIgnored"),
        unstaged = astronvim.get_icon("GitUnstaged"),
        staged = astronvim.get_icon("GitStaged"),
        conflict = astronvim.get_icon("GitConflict"),
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      o = "open",
      O = function(state)
        astronvim.system_open(state.tree:get_node():get_id())
      end,
      H = "prev_source",
      L = "next_source",
    },
  },
  filesystem = {
    hide_dotfiles = true,
    hide_gitignored = false,
    hide_by_name = {
      ".DS_Store",
      "thumbs.db",
    },
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_)
        vim.opt_local.signcolumn = "auto"
      end,
    },
  },
}))
