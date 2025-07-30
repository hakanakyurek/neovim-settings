return {
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>gG", false },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gG", "<cmd>LazyGit<cr>", desc = "LazyGit (root dir)" }
    },
  },
}
