return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
        ["<C-M-e>"] = { "zl", desc = "Scroll right" },
        ["<C-M-y>"] = { "zh", desc = "Scroll left" },
        ["<Leader>gB"] = { "<cmd>Gitsigns blame<cr>", desc = "Toggle Git blame" },
      },
    },
  },
}
