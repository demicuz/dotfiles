require("hs.ipc")

-- hyperKey = {'shift', 'control', 'option', 'command'}
-- hyperKey = {'esc'} doesn't work :(
hyperKey = {"option"}

-- reload config
hs.hotkey.bind(hyperKey, "r", function()
  hs.reload()
end)

appShortcutMap = {
  t = "TiMe",
  s = "Sublime Text",
  i = "IntelliJ IDEA",
  m = "Sublime Merge",
  b = "Bruno",
  k = "Толк",
}

appShortcutMap["1"] = "Firefox"
appShortcutMap["2"] = "Obsidian"
appShortcutMap["3"] = "kitty"
appShortcutMap["4"] = "Finder"

for k, v in pairs(appShortcutMap) do
  hs.hotkey.bind(hyperKey, k, function()
    -- hs.application.launchOrFocus(v)
    if hs.application.get(v):isFrontmost() then
      hs.application.get(v):hide()
    else
      hs.application.launchOrFocus(v)
    end
  end)
end

local layouts = hs.keycodes.layouts()
-- print(hs.inspect(layouts))

local currentLayoutIndex = 1

function switchLayout()
    -- currentLayoutIndex = currentLayoutIndex % #layouts + 1
    -- hs.keycodes.setLayout(layouts[currentLayoutIndex])
    if hs.keycodes.currentLayout() == "ABC" then
      hs.keycodes.setLayout("Russian – PC")
    else
      hs.keycodes.setLayout("ABC")
    end
end

hs.hotkey.bind("command", "space", switchLayout)

-- hs.hotkey.bind("option", "l", function() hs.keycodes.setLayout("ABC") end)
-- hs.hotkey.bind("option", "n", function() hs.keycodes.setLayout("Russian") end)
