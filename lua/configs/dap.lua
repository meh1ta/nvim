local dap = require 'dap'

-- gdb
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '-i', 'dap' },
}
-- lldb-vscode
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = "'",
}
-- vscode-cpptools
dap.adapters.cppdbg = {
  type = 'executable',
  --command = '<path-to-OpenDebugAD7>',
  command = '/home/admin/.vscode/extensions/ms-vscode.cpptools-1.17.5-linux-x64/debugAdapters/bin/OpenDebugAD7',
  id = 'cppdbg',
}

dap.configurations.cpp = {
  {
    type = 'cppdbg',
    name = 'Launch',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,

  }
}
