local M = {}

local current_selection = {}
local current_idx = 0
local current_style = "normal";
local typist_namespace = vim.api.nvim_create_namespace("theprimeagen_typist")
local current_extmark = nil

function M.pluck()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    current_selection = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
    current_idx = 0
end

function M.set_lines(lines)
    current_selection = lines
    current_idx = 0
end

local running = false
function M.next(speed, cb)
    speed = speed or 16
    cb = cb or function() end
    current_idx = current_idx + 1

    if current_idx > #current_selection or running then
        return false
    end
    running = true

    local starting_pos = vim.fn.getpos(".")[2]

    local current = current_selection[current_idx]
    local idx = 1
    local current_line = ""
    local function print_line_normal()
        if idx > #current then
            running = false
            if current_style == "normal" then
                vim.api.nvim_win_set_cursor(0, {starting_pos + 1, 0})
            end
            cb()
            return
        end

        current_line = current_line .. current:sub(idx, idx)

        if current_style == "normal" then
            vim.api.nvim_buf_set_lines(0, starting_pos - 1, starting_pos, false, {current_line})
            vim.api.nvim_win_set_cursor(0, {starting_pos, #current_line})
        else
            --local current_line = vim.api.nvim_buf_get_lines(0, starting_pos - 1, starting_pos, false)[1]
            vim.api.nvim_buf_del_extmark(0, typist_namespace, current_extmark or 0)
            current_extmark = vim.api.nvim_buf_set_extmark(0, typist_namespace, starting_pos - 1, 0, {
                virt_text = {
                    {"", "Comment"},
                    {"", "Comment"},
                    {current_line, "Comment"},
                },
                virt_text_pos = "eol",
                hl_mode = "combine",
            })
        end

        idx = idx + 1
        vim.defer_fn(print_line_normal, speed)
    end

    print_line_normal()
    return true
end

function M.run(speed)
    if M.next(speed) then
        vim.schedule(function()
            M.run(speed)
        end)
    end
end

function M.ghost_line()
    current_style = "ghost"
end

function M.normal()
    current_style = "normal"
end

function M.clear()
    vim.api.nvim_buf_del_extmark(0, typist_namespace, current_extmark or 0)
    current_extmark = nil
end


return M
