return {
  cmd = { 'stylelint-lsp', '--stdio' },
  filetypes = {
    'css',
    'less',
    'scss',
    'sugarss',
    'vue',
    'wxss',
  },
  root_markers = {
    '.stylelintrc',
    '.stylelintrc.cjs',
    '.stylelintrc.js',
    '.stylelintrc.json',
    '.stylelintrc.yaml',
    '.stylelintrc.yml',
    'stylelint.config.cjs',
    'stylelint.config.js', }
}
