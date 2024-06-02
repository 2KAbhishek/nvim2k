local marks = require('marks')

marks.setup {
  default_mappings = true,
  builtin_marks = { ".", "<", ">", "^" },
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
  excluded_buftypes = {},
  -- supports up to 10 bookmark groups, easily open group of files
  bookmark_0 = {
    sign = "⚑",
    virt_text = "group-0",
    annotate = false,
  },
  bookmark_1 = {
    sign = "",
    virt_text = "watch",
    annotate = false,
  },
  mappings = {}
}
