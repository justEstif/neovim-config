local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local job = require("plenary.job")
local telescope = require("telescope")

-- don't preview binaries
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        ["<C-u>"] = false, -- clear input with C-u
        ["<C-p>"] = actions.close, -- exit
        ["<C-w>"] = action_layout.toggle_preview, -- toggle preview
        ["<C-j>"] = actions.move_selection_next, -- next item
        ["<C-k>"] = actions.move_selection_previous, -- previous item
        ["<C-?>"] = actions.which_key, -- available keys
      },
      n = {
        ["<C-w>"] = action_layout.toggle_preview, -- toggle preview
        ["<C-?>"] = actions.which_key,
      }
    },
    file_ignore_patterns = { -- ignore these files
      "node_modules/.*",
      ".git/.*"
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      hidden = true
    },
    buffers = {
      theme = "dropdown",
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
    },
    live_grep = {
      -- theme = "dropdown",
    },
  },
}


-- keybindings reference
-- Ctrl-c -> exit
-- Ctrl - u -> clear input
-- Ctrl -w -> toggle preview
