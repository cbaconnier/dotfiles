-- https://agentydragon.com/posts/2022-09-03-neovim-theme-switch.html

function synchronizeThemeWithSystem()
    if not vim.fn.executable('gsettings') then
        return
    end

    local colorScheme = vim.fn.system('gsettings get org.gnome.desktop.interface color-scheme')

    -- Remove newline characters and quote marks from the color scheme
    colorScheme = colorScheme:gsub("\n", ""):gsub("'", "")

    -- Temporarily set an another theme to force a refresh of the current one
    -- vim.cmd('colorscheme zellner')

    if colorScheme == 'prefer-dark' then
        vim.cmd('set background=dark')
        -- vim.cmd('colorscheme onedark')
    else
        vim.cmd('set background=light')
        -- vim.cmd('colorscheme onedark')
    end
end

synchronizeThemeWithSystem()
