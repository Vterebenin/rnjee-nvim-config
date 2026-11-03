local M = {}

--- Folder OpenCode should treat as the project: the git root of the current
--- file, or Neovim's working directory when this buffer is not in a repo.
function M.project_root()
  local name = vim.api.nvim_buf_get_name(0)
  local start = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()
  local git = vim.fs.find({ ".git" }, { path = start, upward = true })[1]
  if git then
    return vim.fs.dirname(git)
  end
  return vim.fn.getcwd()
end

--- Stable port so this project does not attach to an OpenCode server that was
--- started in a parent directory such as $HOME.
function M.port(root)
  local hash = 0
  for i = 1, #root do
    hash = (hash * 33 + string.byte(root, i)) % 10000
  end
  return 20000 + hash
end

function M.url()
  return "http://127.0.0.1:" .. M.port(M.project_root())
end

local function find_window(root)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.bo[buf].buftype == "terminal" and name:find("opencode", 1, true) and name:find(root, 1, true) then
      return win
    end
  end
end

--- Open the project session in a split and leave the cursor in the code window.
--- The plugin calls this when a task is sent and no server is running yet.
function M.start()
  local root = M.project_root()
  local port = tostring(M.port(root))
  -- A fresh buffer, shown in only one window. jobstart() turns the current
  -- buffer into the terminal, so splitting the file first makes both windows
  -- share that terminal and one of them breaks.
  local buf = vim.api.nvim_create_buf(true, false)
  vim.cmd("botright vsplit")
  vim.api.nvim_win_set_buf(0, buf)
  local job = vim.fn.jobstart({ "opencode", root, "--port", port }, {
    cwd = root,
    term = true,
  })
  if job <= 0 then
    vim.notify("Failed to start opencode in " .. root, vim.log.levels.ERROR)
    vim.cmd("close")
    return
  end
  vim.cmd("wincmd p")
end

--- Close the project session window and stop its process. The file tab stays open.
function M.close()
  local root = M.project_root()
  local win = find_window(root)
  if not win then
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.bo[buf].buftype == "terminal" and name:find("opencode", 1, true) then
      win = vim.api.nvim_get_current_win()
    end
  end
  if not win then
    vim.notify("No OpenCode session for this project", vim.log.levels.WARN)
    return
  end
  local buf = vim.api.nvim_win_get_buf(win)
  local job = vim.b[buf].terminal_job_id
  if vim.api.nvim_get_current_win() == win then
    vim.cmd("stopinsert")
    vim.cmd("wincmd p")
  end
  if job and job > 0 then
    vim.fn.jobstop(job)
  end
  pcall(vim.api.nvim_win_close, win, true)
  if vim.api.nvim_buf_is_valid(buf) then
    pcall(vim.api.nvim_buf_delete, buf, { force = true })
  end
end

--- Focus the project session, starting it in the project folder when needed.
function M.open()
  local root = M.project_root()
  local win = find_window(root)
  if win then
    vim.api.nvim_set_current_win(win)
    return
  end
  M.start()
  vim.cmd("wincmd p")
end

--- Hand OpenCode a task. The server's directory is the project, so it can read
--- and edit that tree. A visual selection is attached as @this.
function M.task(visual)
  local lead = "Project " .. M.project_root() .. ". Task: "
  if visual then
    lead = "@this " .. lead
  end
  require("opencode").ask(lead)
end

return M
