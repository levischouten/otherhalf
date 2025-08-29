# OneHalf Neovim Theme

A Neovim colorscheme based on the OneHalf terminal theme, with support for both light and dark variants.

## Features

- **Auto-theming**: Automatically switches between light and dark mode based on Neovim's `background` setting
- **Manual variants**: Choose between `light`, `dark`, or `auto` variants
- **Transparency support**: Optional transparent background
- **Neo-tree integration**: Properly styled file explorer with consistent backgrounds
- **Modern syntax highlighting**: Full Treesitter support

## Installation

### Lazy.nvim
```lua
{
  "yourusername/otherhalf.nvim",
  config = function()
    require("otherhalf").setup({
      variant = "auto", -- "auto" | "dark" | "light"
      transparent = false,
      italics = true,
    })
    vim.cmd("colorscheme otherhalf")
  end,
}
```

### Packer
```lua
use {
  "yourusername/otherhalf.nvim",
  config = function()
    require("otherhalf").setup({
      variant = "auto", -- "auto" | "dark" | "light"
      transparent = false,
      italics = true,
    })
    vim.cmd("colorscheme otherhalf")
  end
}
```

## Configuration

```lua
require("otherhalf").setup({
  variant = "auto",     -- "auto" | "dark" | "light"
  transparent = false,  -- Enable transparent background
  italics = true,      -- Enable italic comments and keywords
})
```

## Auto-theming

When `variant = "auto"`, the theme will:
- Automatically detect your system's light/dark mode via Neovim's `background` setting
- Switch themes when you change `vim.o.background`
- Work with terminal themes that set the background automatically

## Manual Theme Switching

```vim
" Toggle between light and dark
:lua require("otherhalf").toggle()

" Or manually set background (when variant = "auto")
:set background=light
:set background=dark
```

## Color Palette

### Dark Variant
- Background: `#282c34`
- Foreground: `#dcdfe4`

### Light Variant  
- Background: `#fafafa`
- Foreground: `#383a42`

Both variants use the same OneHalf color palette for syntax highlighting, ensuring consistency across light and dark modes.
