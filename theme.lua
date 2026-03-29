-- theme.lua
-- Theming system for ManuOS UI components

local Theme = {}

-- Theme presets
Theme.themes = {
    dark = {
        background = 0x1e1e1e,
        surface = 0x2d2d2d,
        primary = 0x0078d4,
        accent = 0x50fa7b,
        error = 0xff5555,
        warning = 0xf1fa8c,
        text = 0xffffff,
        textSecondary = 0xbbbbbb,
        border = 0x444444,
        highlight = 0x3d3d3d,
    },
    light = {
        background = 0xffffff,
        surface = 0xf5f5f5,
        primary = 0x0078d4,
        accent = 0x107c10,
        error = 0xe81123,
        warning = 0xffd700,
        text = 0x000000,
        textSecondary = 0x666666,
        border = 0xcccccc,
        highlight = 0xeeeeee,
    },
    cyberpunk = {
        background = 0x0a0e27,
        surface = 0x1a1f3a,
        primary = 0x00ffff,
        accent = 0xff006e,
        error = 0xff0040,
        warning = 0xffbe0b,
        text = 0x00ffff,
        textSecondary = 0x00ff88,
        border = 0x00ffff,
        highlight = 0x2a2f4a,
    }
}

-- Current active theme
Theme.current = Theme.themes.dark

-- Set active theme by name
function Theme.setTheme(name)
    if Theme.themes[name] then
        Theme.current = Theme.themes[name]
        return true
    end
    return false
end

-- Get current theme color
function Theme.getColor(colorName)
    return Theme.current[colorName] or 0xffffff
end

-- Create custom theme
function Theme.createTheme(name, colors)
    Theme.themes[name] = colors
    return true
end

-- Get all available themes
function Theme.listThemes()
    local themes = {}
    for name, _ in pairs(Theme.themes) do
        table.insert(themes, name)
    end
    return themes
end

return Theme