-- hyperKey = {'shift', 'control', 'option', 'command'}
-- hyperKey = {'esc'}
hyperKey = {'option'}

-- reload config
hs.hotkey.bind(hyperKey, "r", function()
  hs.reload()
end)

appShortcutMap = {
  f = 'Firefox',
  t = 'TiMe',
  k = 'kitty',
  s = 'Sublime Text',
  o = 'Obsidian',
  i = 'IntelliJ IDEA',
  m = 'Sublime Merge',
  p = 'Postman',
}

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
    currentLayoutIndex = currentLayoutIndex % #layouts + 1 
    hs.keycodes.setLayout(layouts[currentLayoutIndex])
end

hs.hotkey.bind("command", "space", switchLayout)

-- hs.hotkey.bind("option", "l", function() hs.keycodes.setLayout("ABC") end)
-- hs.hotkey.bind("option", "n", function() hs.keycodes.setLayout("Russian") end)
