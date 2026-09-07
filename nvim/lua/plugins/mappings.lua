return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
        ["<Leader>gB"] = { "<cmd>Gitsigns blame<cr>", desc = "Toggle Git blame" },
      },
    },
  },
}
