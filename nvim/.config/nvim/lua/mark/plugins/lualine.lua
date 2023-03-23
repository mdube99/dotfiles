return {
    "nvim-lualine/lualine.nvim", -- Neovim status line
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    priority = 999,
    config = function()
        local lualine = require("lualine")
        local function count_items(qf_list)
            if #qf_list > 0 then
                local valid = 0
                for _, item in ipairs(qf_list) do
                    if item.valid == 1 then
                        valid = valid + 1
                    end
                end
                if valid > 0 then
                    return tostring(valid)
                end
            end
            -- return
        end
        local fmt_stat = function()
            local stat = ''
            stat = stat .. 'spaces=' .. vim.opt_local.tabstop._value
            return stat
        end
        lualine.setup({
            options = {
                theme = "auto",
                globalstatus = true,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {
                    "branch",
                    {
                        function()
                            local loc_values = vim.fn.getloclist(vim.api.nvim_get_current_win())
                            local items = count_items(loc_values)
                            if items then
                                return 'Loc: ' .. items
                            end
                            return ""
                        end,
                        on_click = function(clicks, button, modifiers)
                            local winid = vim.fn.getqflist(vim.api.nvim_get_current_win()).winid
                            if winid == 0 then
                                vim.cmd.lopen()
                            else
                                vim.cmd.lclose()
                            end
                        end,
                    },
                {
                    function()
                        local qf_values = vim.fn.getqflist()
                        local items = count_items(qf_values)
                        if items then
                            return 'Qf: ' .. items
                        end
                        return ""
                    end,
                    on_click = function(clicks, button, modifiers)
                        local winid = vim.fn.getqflist({ winid = 0 }).winid
                        if winid == 0 then
                            vim.cmd.copen()
                        else
                            vim.cmd.cclose()
                        end
                    end,
                },
                },
                lualine_c = {"filename","diff", "diagnostics"},
                lualine_x = {
                    "import",
                    fmt_stat
                },
                -- Combine x and y
                lualine_y = {
                    {
                        function()
                            local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
                            local icon = require("nvim-web-devicons").get_icon_by_filetype(
                                    vim.api.nvim_buf_get_option(0, "filetype")
                                )
                            if lsps and #lsps > 0 then
                                local names = {}
                                for _, lsp in ipairs(lsps) do
                                    table.insert(names, lsp.name)
                                end
                                return string.format("%s %s", table.concat(names, ", "), icon)
                            else
                                return icon or ""
                            end
                        end,
                        on_click = function()
                            vim.api.nvim_command("LspInfo")
                        end,
                        color = function()
                            local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
                                    vim.api.nvim_buf_get_option(0, "filetype")
                                )
                            return { fg = color }
                        end,
                    },
                    "encoding",
                    "progress",
                },
                lualine_z = {
                    "location",
                    {
                        function()
                            local starts = vim.fn.line("v")
                            local ends = vim.fn.line(".")
                            local count = starts <= ends and ends - starts + 1 or starts - ends + 1
                            return count .. "V"
                        end,
                        cond = function()
                            return vim.fn.mode():find("[Vv]") ~= nil
                        end,
                    },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filetype",
                        icon_only = true,
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            -- extensions = {'quickfix', 'toggleterm'}
        })
    end,
}
