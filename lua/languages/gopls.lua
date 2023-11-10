return {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedvariable = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        shadow = true
      }
    }
  }
}
