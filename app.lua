local keyApps = {
    ['u'] = '/System/Applications/Dictionary.app',
    ['p'] = '/Applications/Google Chrome.app',
    ['.'] = '/Applications/Visual Studio Code.app'
}

for key, app in pairs(keyApps) do
    hs.hotkey.bind({"cmd", "ctrl"}, key, function()
        hs.application.launchOrFocus(app)
    end)
end