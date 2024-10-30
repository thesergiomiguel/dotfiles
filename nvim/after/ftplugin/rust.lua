local bufnr = vim.api.nvim_get_current_buf()

local opts = {
  silent = true,
  buffer = bufnr,
}

local RustLsp = function(cmd, vspl)
  return function()
    if vspl == true then
      vim.cmd.wincmd 'v'
    end

    vim.cmd.RustLsp(cmd)
  end
end

vim.keymap.set({ 'n', 'x' }, '<M-r><M-r>', RustLsp 'run', opts)
vim.keymap.set({ 'n', 'x' }, '<M-r><M-l>', RustLsp 'runnables', opts)
vim.keymap.set({ 'n', 'x' }, '<M-r>ee', RustLsp { 'explainError', 'current' }, opts)
vim.keymap.set({ 'n', 'x' }, '<M-r>ed', RustLsp { 'renderDiagnostic', 'current' }, opts)
vim.keymap.set({ 'n', 'x' }, '<M-r>oc', RustLsp('openCargo', true), opts)
