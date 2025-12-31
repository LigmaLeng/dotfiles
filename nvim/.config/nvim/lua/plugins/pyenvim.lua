return {
  {
    dir = "~/plugins/pyenvim.nvim",
    config = function()
      local success, result = pcall(function()
        require("pyenvim").setup()
      end)
      -- Notify on success
      if success then
        vim.notify("pyEnvim plugin loaded successfully!", vim.log.levels.INFO)
      else
        -- Notify on error
        vim.notify("Error loading pyEnvim plugin: " .. result, vim.log.levels.ERROR)
      end
    end,
    ft = { "python" },
  },
}
