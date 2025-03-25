require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "deepseek",
    },
    inline = {
      adapter = "deepseek",
    },
  },
  adapters = {
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          api_key = os.getenv('DEEPSEEK_API_TOKEN')
        },
        schema = {
          model = {
            -- comment out for reasoner
            default = "deepseek-chat"
          }
        }
      })
    end,
    huggingface = function()
      return require("codecompanion.adapters").extend("huggingface", {
        env = {
          api_key = os.getenv('HG_API_TOKEN')
        },
      })
    end,
  },
});
