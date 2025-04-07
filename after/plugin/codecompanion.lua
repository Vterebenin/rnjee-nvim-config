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
  prompt_library = {
    ["Review my code"] = {
      strategy = "chat",
      description = "Do a review of selected code",
      opts = {
        modes = { "v" },
        short_name = "expert",
        auto_submit = true,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return "I want you to act as a principal "
                .. context.filetype
                .. " developer. You have done a lot of code reviews and know how to improve any code."
                .. "make sure that you wrote a good idiomatic "
                .. context.filetype
                .. " code."
                .. "Also make sure to provide step by step explanations how you improved my code and why."
                .. "Answer any following questions and correct me if I'm wrong"
          end,
        },
        {
          role = "user",
          content = function(context)
            local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return "For a selected code, provided below, do a concise and precise code review:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
          end,
          opts = {
            contains_code = true,
          }
        },
      },
    },
    ["Create jest unit tests"] = {
      strategy = "chat",
      description = "Implement jest unit tests for selected code",
      opts = {
        modes = { "v" },
        short_name = "expert",
        auto_submit = true,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return "I want you to act as a senior "
                .. context.filetype
                .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
                .. "make sure that you wrote a good idiomatic "
                .. context.filetype
                .. " code"
          end,
        },
        {
          role = "user",
          content = function(context)
            local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return "Make jest unit tests for this code :\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
          end,
          opts = {
            contains_code = true,
          }
        },
      },
    },
    ["make TODO's"] = {
      strategy = "chat",
      description = "Implement all TODO in selected code",
      opts = {
        modes = { "v" },
        short_name = "expert",
        auto_submit = true,
        stop_context_insertion = true,
      },
      prompts = {
        {
          role = "system",
          content = function(context)
            return "I want you to act as a senior "
                .. context.filetype
                .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
                .. "if your implementation needs imports - do not include them in the code, assume that those are already included"
                .. "try to keep provided code as is as much as possible"
                .. "make sure that you wrote a good idiomatic "
                .. context.filetype
                .. " code"
          end,
        },
        {
          role = "user",
          content = function(context)
            local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

            return "Implement all TODO in this code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
          end,
          opts = {
            contains_code = true,
          }
        },
      },
    },
  },

});


local wk = require("which-key")
wk.add({
  { "<leader>zc", "<cmd>CodeCompanionChat<cr>",    desc = "companion chat",    mode = { "n", "v" } },
  { "<leader>za", "<cmd>CodeCompanionActions<cr>", desc = "companion actions", mode = { "n", "v" } },
})
