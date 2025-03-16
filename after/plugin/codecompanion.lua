require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "huggingface",
    },
    inline = {
      adapter = "huggingface",
    },
  },
  adapters = {
    huggingface = function()
      return require("codecompanion.adapters").extend("huggingface", {
        env = {
          api_key = os.getenv('HG_API_TOKEN')
        },
      })
    end,
  },
});
