local M = {}

local file_icons = {
  Brown = { "" },
  Aqua = { "" },
  LightBlue = { "", "" },
  Blue = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
  Darkblue = { "", "" },
  Purple = { "", "", "", "", "" },
  Red = { "", "", "", "", "", "" },
  Beige = { "", "", "" },
  Yellow = { "", "", "λ", "", "" },
  Orange = { "", "" },
  Darkorange = { "", "", "", "", "" },
  Pink = { "", "" },
  Salmon = { "" },
  Green = { "", "", "", "", "", "" },
  Lightgreen = { "", "", "", "﵂" },
  White = { "", "", "", "", "", "" },
}

local file_icon_colors = {
  Brown = "#905532",
  Aqua = "#3AFFDB",
  Blue = "#689FB6",
  Darkblue = "#44788E",
  Purple = "#834F79",
  Red = "#AE403F",
  Beige = "#F5C06F",
  Yellow = "#F09F17",
  Orange = "#D4843E",
  Darkorange = "#F16529",
  Pink = "#CB6F6F",
  Salmon = "#EE6E73",
  Green = "#8FAA54",
  Lightgreen = "#31B53E",
  White = "#FFFFFF",
  LightBlue = "#5fd7ff",
}

local function clock()
  return " " .. os.date "%I:%M"
end

local function get_file_info()
  return vim.fn.expand "%:t", vim.fn.expand "%:e"
end

local function get_file_icon()
  local icon
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if not ok then
    print "No icon plugin found. Please install 'kyazdani42/nvim-web-devicons'"
    return ""
  end
  local f_name, f_extension = get_file_info()
  icon = devicons.get_icon(f_name, f_extension)
  if icon == nil then
    icon = ""
  end
  return icon
end

local function get_file_icon_color()
  local f_name, f_ext = get_file_info()

  local has_devicons, devicons = pcall(require, "nvim-web-devicons")
  if has_devicons then
    local icon, iconhl = devicons.get_icon(f_name, f_ext)
    if icon ~= nil then
      return vim.fn.synIDattr(vim.fn.hlID(iconhl), "fg")
    end
  end

  local icon = get_file_icon():match "%S+"
  for k, _ in pairs(file_icons) do
    if vim.fn.index(file_icons[k], icon) ~= -1 then
      return file_icon_colors[k]
    end
  end
end

M.config = function()
    local components = require("lvim.core.lualine.components")
    lvim.builtin.lualine.style = "lvim"
    lvim.builtin.lualine.sections.lualine_a = { "mode" }
    -- lvim.builtin.lualine.sections.lualine_a = {  }
    -- lvim.builtin.lualine.sections.lualine_b = { "mode" }
    -- lvim.builtin.lualine.sections.lualine_c = { "filename" }
    -- lvim.builtin.lualine.sections.lualine_d = { components.diagnostics }
    -- lvim.builtin.lualine.sections.lualine_w = { "encoding", "fileformat", "filetype" }
    lvim.builtin.lualine.sections.lualine_x = { components.lsp }
    lvim.builtin.lualine.sections.lualine_y = { "filetype" }
    lvim.builtin.lualine.sections.lualine_z = { clock, components.scrollbar }
    lvim.builtin.lualine.options.component_separators = { "│", "│" }
    lvim.builtin.lualine.options.section_separators = { "", "" }
    lvim.builtin.lualine.extensions = { "quickfix" }
    end
return M
