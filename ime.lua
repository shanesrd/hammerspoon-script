local ime = {}

local appImes = {
    ['Typora'] = 'c',
    ['Microsoft Word'] = 'c',
    ['Google Chrome'] = 'e'
}

ime.winFilter = hs.window.filter.new(function(win)
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

    return appImes[appName] ~= nil
end)

ime.winFilter:subscribe({hs.window.filter.windowFocused,
                     hs.window.filter.windowVisible},
    function(win, app, event)
        local ime = appImes[win:application():name()]
        
        if 'e' == ime then
            hs.keycodes.currentSourceID("com.apple.keylayout.US")
        elseif 'c' == ime then
            hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
        end
    end
)

return ime
