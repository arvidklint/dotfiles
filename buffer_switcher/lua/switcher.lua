local max_iterations = 8
local fps = 1 / 30 * 1000

local M = {}

M.iteration = 1

M.lines = {}
M.original_lines = {}

M.ns = vim.api.nvim_create_namespace('switcher')

local charset = {}

local function pad_string(str, len, char)
    if char == nil then char = ' ' end
    return str .. string.rep(char, len - #str)
end

-- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

local function random_character()
  return charset[math.random(1, #charset)]
end

local function decide_character(
  original_char,
  current_char,
  current_col,
  max_col,
  iteration
)
  if original_char == current_char then
    return original_char
  end

  if original_char == ' ' then
    return original_char
  end

  -- if math.random(4) < 4 then
  --   return ' '
  -- end

  if (math.random(max_col) -10) > (max_col - current_col) then
    return ' '
  end

  local rn = math.random(max_iterations - iteration)
  if rn == 1 then
    return original_char
  end

  return random_character()
end

local function scramble_line(row, col, new_line)
  col = col or 1
  new_line = new_line or ''
  local original_line = M.original_lines[row]
  local line = M.lines[row]

  local done = string.len(original_line) < col

  if done then
    return new_line
  end

  local original_char = string.sub(original_line, col, col)
  local current_char = string.sub(line, col, col)
  local new_char = decide_character(
    original_char,
    current_char,
    col,
    string.len(original_line),
    M.iteration
  )
  new_line = new_line .. new_char
  return scramble_line(row, col + 1, new_line)

end

local function clear(buffer, ns_id)
  vim.api.nvim_buf_clear_namespace(buffer, ns_id, 0, -1)
end

local function virtual_text(buffer, ns_id, row, col, msg)
  vim.api.nvim_buf_set_extmark(buffer, ns_id, row, col, {
    virt_text = { msg },
    virt_text_pos = 'overlay',
    hl_mode = 'combine'
  })
end

local function print_virtual_lines()
  for row, line in ipairs(M.lines) do
    virtual_text(0, M.ns, row - 1, 0, { line })
  end
end

local function create_empty_lines(original_lines)
  local lines = {}
  for _, original_line in ipairs(original_lines) do
    local line = pad_string('', string.len(original_line), ' ')
    table.insert(lines, line)
  end
  return lines
end

function M.scramble_lines()
  for row, _ in ipairs(M.original_lines) do
    local new_line = scramble_line(row)
    M.lines[row] = new_line
  end
end

function M.switch()
  math.randomseed(os.clock()^5)
  M.original_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  -- M.original_lines = vim.api.nvim_buf_get_lines(0, 0, 1, true)
  M.lines = create_empty_lines(M.original_lines)

  M.iteration = 1
  local timer = vim.loop.new_timer()
  timer:start(0, fps, vim.schedule_wrap(function()
    M.scramble_lines()
    print_virtual_lines()

    M.iteration = M.iteration + 1
    if M.iteration > max_iterations then
      M.clear()
      timer:close()
    end
  end))
end

function M.clear()
  clear(0, M.ns)
end

return M
