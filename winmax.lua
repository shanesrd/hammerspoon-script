local winmax = {}

local apps = {
    ['Microsoft Edge'] = true,
    ['Microsoft Word'] = true,
    ['Microsoft Excel'] = true,
    ['Preview'] = true
}

winmax.winFilter = hs.window.filter.new(function(win)
    if not win then
        return false
    end

    local winApp = win:application()
    if not winApp then
        return false
    end
    
    local appName = winApp:name()
    if not appName then
        return false
    end

    return apps[appName]
end)

winmax.winFilter:subscribe({hs.window.filter.windowFocused},
    function(win, app, event)
        win:maximize()
    end
)

return winmax
