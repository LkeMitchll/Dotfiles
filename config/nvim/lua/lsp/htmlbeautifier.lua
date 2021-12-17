local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")

local htmlbeautifier = {
  method = methods.FORMATTING,
  filetypes = { "eruby", "html" },
  generator = helpers.formatter_factory({
    command = "htmlbeautifier",
    to_stdin = true,
  }),
}

return htmlbeautifier
