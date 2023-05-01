local M = {}

M.abc = {
  n = {
    ["<leader>a"] = { ":NvimTreeToggle <CR>", "File Explorer" },
    ["<leader>,"] = { ":undo <CR>", "Undo" },
    ["<leader>."] = { ":redo <CR>", "Redo" },

    ["<leader>z"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

return M
