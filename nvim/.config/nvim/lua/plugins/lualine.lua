return {
    "nvim-lualine/lualine.nvim", -- Neovim status line
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    priority = 999,
    config = function()
        --     local lualine = require("lualine")
        --     local function count_items(qf_list)
        --         if #qf_list > 0 then
        --             local valid = 0
        --             for _, item in ipairs(qf_list) do
        --                 if item.valid == 1 then
        --                     valid = valid + 1
        --                 end
        --             end
        --             if valid > 0 then
        --                 return tostring(valid)
        --             end
        --         end
        --         -- return
        --     end
        --     local fmt_stat = function()
        --         local stat = ''
        --         stat = stat .. 'spaces=' .. vim.opt_local.tabstop._value
        --         return stat
        --     end
        --     lualine.setup({
        --         options = {
        --             theme = "auto",
        --             globalstatus = true,
        --             component_separators = '|',
        --             section_separators = '',
        --         },
        --         sections = {
        --             lualine_a = {"mode"},
        --             lualine_b = {
        --                 "branch",
        --                 {
        --                     function()
        --                         local loc_values = vim.fn.getloclist(vim.api.nvim_get_current_win())
        --                         local items = count_items(loc_values)
        --                         if items then
        --                             return 'Loc: ' .. items
        --                         end
        --                         return ""
        --                     end,
        --                     on_click = function(clicks, button, modifiers)
        --                         local winid = vim.fn.getqflist(vim.api.nvim_get_current_win()).winid
        --                         if winid == 0 then
        --                             vim.cmd.lopen()
        --                         else
        --                             vim.cmd.lclose()
        --                         end
        --                     end,
        --                 },
        --             {
        --                 function()
        --                     local qf_values = vim.fn.getqflist()
        --                     local items = count_items(qf_values)
        --                     if items then
        --                         return 'Qf: ' .. items
        --                     end
        --                     return ""
        --                 end,
        --                 on_click = function(clicks, button, modifiers)
        --                     local winid = vim.fn.getqflist({ winid = 0 }).winid
        --                     if winid == 0 then
        --                         vim.cmd.copen()
        --                     else
        --                         vim.cmd.cclose()
        --                     end
        --                 end,
        --             },
        --             },
        --             lualine_c = {"filename","diff", "diagnostics"},
        --             lualine_x = {
        --                 "import",
        --                 fmt_stat
        --             },
        --             -- Combine x and y
        --             lualine_y = {
        --                 {
        --                     function()
        --                         local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
        --                         local icon = require("nvim-web-devicons").get_icon_by_filetype(
        --                                 vim.api.nvim_buf_get_option(0, "filetype")
        --                             )
        --                         if lsps and #lsps > 0 then
        --                             local names = {}
        --                             for _, lsp in ipairs(lsps) do
        --                                 table.insert(names, lsp.name)
        --                             end
        --                             return string.format("%s %s", table.concat(names, ", "), icon)
        --                         else
        --                             return icon or ""
        --                         end
        --                     end,
        --                     on_click = function()
        --                         vim.api.nvim_command("LspInfo")
        --                     end,
        --                     color = function()
        --                         local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
        --                                 vim.api.nvim_buf_get_option(0, "filetype")
        --                             )
        --                         return { fg = color }
        --                     end,
        --                 },
        --                 "encoding",
        --                 "progress",
        --             },
        --             lualine_z = {
        --                 "location",
        --                 {
        --                     function()
        --                         local starts = vim.fn.line("v")
        --                         local ends = vim.fn.line(".")
        --                         local count = starts <= ends and ends - starts + 1 or starts - ends + 1
        --                         return count .. "V"
        --                     end,
        --                     cond = function()
        --                         return vim.fn.mode():find("[Vv]") ~= nil
        --                     end,
        --                 },
        --             },
        --         },
        --         inactive_sections = {
        --             lualine_a = {},
        --             lualine_b = {},
        --             lualine_c = {
        --                 {
        --                     "filetype",
        --                     icon_only = true,
        --                 },
        --             },
        --             lualine_x = {},
        --             lualine_y = {},
        --             lualine_z = {},
        --         },
        --         -- extensions = {'quickfix', 'toggleterm'}
        --     })

        local lualine = require('lualine')

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg       = '#202328',
            fg       = '#bbc2cf',
            yellow   = '#ECBE7B',
            cyan     = '#008080',
            darkblue = '#081633',
            green    = '#98be65',
            orange   = '#FF8800',
            violet   = '#a9a1e1',
            magenta  = '#c678dd',
            blue     = '#51afef',
            red      = '#ec5f67',
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = { c = { fg = colors.fg, bg = colors.bg } },
                    inactive = { c = { fg = colors.fg, bg = colors.bg } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        ins_left {
            function()
                return '▊'
            end,
            color = { fg = colors.blue }, -- Sets highlighting of component
            padding = { left = 0, right = 1 }, -- We don't need space before this
        }

        ins_left {
            -- mode component
            function()
                return ''
            end,
            color = function()
                -- auto change color according to neovims mode
                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end,
            padding = { right = 1 },
        }

        ins_left {
            -- filesize component
            'filesize',
            cond = conditions.buffer_not_empty,
        }

        ins_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { fg = colors.magenta, gui = 'bold' },
        }

        ins_left { 'location' }

        ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        }

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left {
            function()
                return '%='
            end,
        }

        ins_left {
            -- Lsp server name .
            function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = ' LSP:',
            color = { fg = '#ffffff', gui = 'bold' },
        }

        -- Add components to right sections
        ins_right {
            'o:encoding', -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = 'bold' },
        }

        ins_right {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            color = { fg = colors.green, gui = 'bold' },
        }

        ins_right {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
        }

        ins_right {
            'diff',
            -- Is it me or the symbol for modified us really weird
            symbols = { added = ' ', modified = '柳 ', removed = ' ' },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        }

        ins_right {
            function()
                return '▊'
            end,
            color = { fg = colors.blue },
            padding = { left = 1 },
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
    end,
}
