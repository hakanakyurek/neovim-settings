return {
  "kmontocam/nvim-conda",
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { "<leader>cp", "<cmd>CondaActivate<cr>", desc = "Select Conda environment" },
  },
}
