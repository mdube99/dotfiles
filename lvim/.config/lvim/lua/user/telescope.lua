lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/", "env/",
    "gradle/",
    "node_modules/",
    "target/",
}

lvim.builtin.telescope.defaults.vimgrep_arguments = {
 "rg",
 "--color=never",
 "--no-heading",
 "--with-filename",
 "--line-number",
 "--column",
 "--smart-case",
}
lvim.builtin.telescope.defaults.prompt_prefix = "   "
lvim.builtin.telescope.defaults.layout_strategy = "vertical"
lvim.builtin.telescope.defaults.selection_caret = "  "
lvim.builtin.telescope.defaults.entry_prefix = "  "
lvim.builtin.telescope.defaults.layout_config = {
     horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
 },
     vertical = {
        mirror = false,
     },
     width = 0.87,
     height = 0.80,
     preview_cutoff = 120,
}

-- lvim.builtin.telescope.defaults.file_sorter = require("telescope.sorters").get_fuzzy_file
-- lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules" }
-- lvim.builtin.telescope.defaults.generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter
-- lvim.builtin.telescope.defaults.path_display = { "truncate" }
-- lvim.builtin.telescope.defaults.winblend = 0
-- lvim.builtin.telescope.defaults.border = {}
-- lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
-- lvim.builtin.telescope.defaults.color_devicons = true
-- lvim.builtin.telescope.defaults.use_less = true
-- lvim.builtin.telescope.defaults.set_env = { ["COLORTERM"] = "truecolor" } -- default = nil
