return {
  'jiangmiao/auto-pairs',
  config = function()
    -- We use the default M-p as a more ergonomic alternative to `C-r "`
    -- `M-g p` sort of does the same, but escapes back to Normal
    vim.g.AutoPairsShortcutToggle = '<M-a>'

    -- Use FlyMode
    -- c.f. https://github.com/jiangmiao/auto-pairs?tab=readme-ov-file#fly-mode
    vim.g.AutoPairsFlyMode = true
  end,
}
