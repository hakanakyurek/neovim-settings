return {
  {
    "sample-usr/rakis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rakis").setup({
        transparent = false,
      })

      local function apply_theme()
        local lat, lon = "48.1351", "11.5820"
        local url = "https://api.sunrise-sunset.org/json?lat=" .. lat .. "&lng=" .. lon .. "&formatted=0"
        local result = vim.fn.system("curl -s '" .. url .. "'")
        local data = vim.fn.json_decode(result)

        if data and data.results then
          local offset = 1
          local sr_h, sr_m = data.results.sunrise:match("T(%d+):(%d+)")
          local ss_h, ss_m = data.results.sunset:match("T(%d+):(%d+)")
          local sunrise = tonumber(sr_h) + offset + tonumber(sr_m) / 60
          local sunset = tonumber(ss_h) + offset + tonumber(ss_m) / 60

          local hour = tonumber(os.date("%H"))
          local min = tonumber(os.date("%M"))
          local time = hour + min / 60

          if time >= sunrise and time < sunset then
            vim.o.background = "light"
          else
            vim.o.background = "dark"
          end

            vim.cmd.colorscheme("rakis")

        end
      end

      apply_theme()

      vim.fn.timer_start(1000 * 60 * 60, function()
        apply_theme()
      end, { ["repeat"] = -1 })
    end,
  },
}
