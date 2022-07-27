-----------------------------------------------------------
-- Telescope configuration file
----------------------------------------------------------
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
    return
end

telescope.setup({
    defaults = {
        entry_prefix = "  ", -- remove symbols
        prompt_prefix = "  ",
        selection_caret = "  ",
        mappings = {
            i = {
                ["<C-u>"] = false, -- clear input with C-u
                ["<C-p>"] = actions.close, -- exit
                ["<C-j>"] = actions.move_selection_next, -- next item
                ["<C-k>"] = actions.move_selection_previous, -- previous item
                ["<C-?>"] = actions.which_key -- available keys
            },
            n = {
                ["<C-?>"] = actions.which_key -- see options
            }
        },
        file_ignore_patterns = { -- ignore these files
        "node_modules/.*", ".git/.*"},
        layout_strategy = "flex" -- display: flex;
    },
    pickers = { -- defining the options of different pickers
        find_files = {
            theme = "dropdown",
            previewer = false,
            hidden = true,
            find_command = {"fd", "--type", "f", "--strip-cwd-prefix"} -- turn off `./`
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            on_complete = { -- start in normal mode
            function()
                vim.cmd("stopinsert")
            end},
            mappings = { -- easy close buffer shortcut
                i = {
                    ["<C-d>"] = actions.delete_buffer
                },
                n = {
                    ["D"] = actions.delete_buffer,
                    ["<C-d>"] = actions.delete_buffer
                }
            }
        },
        oldfiles = {
            theme = "dropdown",
            previewer = false
        },
        current_buffer_fuzzy_find = {
            theme = "cursor",
            previewer = false
        },
        live_grep = {
            theme = "ivy"
        }
    },
    extensions = {}
})
