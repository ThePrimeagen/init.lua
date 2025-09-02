return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")

    local function get_java_config()
      return {
        cmd = {
          "jdtls",
          "-data",
          vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("pom.xml", "gradle.build", ".git")(fname)
            or vim.fn.getcwd()
        end,
      }
    end

    -- Start or attach jdtls when opening Java files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        jdtls.start_or_attach(get_java_config())
      end,
    })
  end,
}
