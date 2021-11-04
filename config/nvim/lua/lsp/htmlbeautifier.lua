local htmlbeautifier = {}
local methods = require("null-ls.methods").internal
local helpers = require("null-ls.helpers")

htmlbeautifier.method = methods.FORMATTING
htmlbeautifier.filetypes = { "eruby", "html" }

htmlbeautifier.generator = helpers.formatter_factory({
  command = "htmlbeautifier",
  to_stdin = true,
})

return htmlbeautifier
