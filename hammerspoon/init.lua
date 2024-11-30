require("hs.ipc") -- todo maybe remove this?

-- hyperKey = {'shift', 'control', 'option', 'command'}
-- hyperKey = {'esc'} doesn't work :(
local hyperKey = {"option"}

-- reload config
hs.hotkey.bind(hyperKey, "r", function()
  hs.reload()
end)

local appShortcutMap = {
  t = "TiMe",
  s = "Sublime Text",
  i = "IntelliJ IDEA",
  m = "Sublime Merge",
  b = "Bruno",
  k = "Толк"
}

appShortcutMap["a"] = "Safari"
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

local function switchLayout()
  -- currentLayoutIndex = currentLayoutIndex % #layouts + 1
  -- hs.keycodes.setLayout(layouts[currentLayoutIndex])
  if hs.keycodes.currentLayout() == "ABC" then
    hs.keycodes.setLayout("Russian – PC")
  else
    hs.keycodes.setLayout("ABC")
  end
end

hs.hotkey.bind("command", "space", switchLayout)

-- Tile windows
-- for key, rect in pairs({
--   ["Q"] = {x = 0, y = 0, w = 0.5, h = 0.5},
--   ["W"] = {x = 0, y = 0, w = 1, h = 0.5},
--   ["E"] = {x = 0.5, y = 0, w = 0.5, h = 0.5},
--   ["A"] = {x = 0, y = 0, w = 0.5, h = 1},
--   ["S"] = {x = 0, y = 0, w = 1, h = 1},
--   ["D"] = {x = 0.5, y = 0, w = 0.5, h = 1},
--   ["Z"] = {x = 0, y = 0.5, w = 0.5, h = 0.5},
--   ["X"] = {x = 0, y = 0.5, w = 1, h = 0.5},
--   ["C"] = {x = 0.5, y = 0.5, w = 0.5, h = 0.5}
-- }) do
--   hs.hotkey.bind({"⌃", "⌥", "⌘"}, key, function()
--     hs.window.focusedWindow():move(rect, nil, true)
--   end)
-- end

-- Send window to another monitor
hs.hotkey.bind({"⌃", "⌥", "⌘"}, "tab", function()
  hs.window.focusedWindow():moveToScreen(
    hs.window.focusedWindow():screen():next(), true, true)
end)

-- Dark mode

hs.hotkey.bind({"⌃", "⌥", "⌘"}, "return", function()
  hs.osascript.applescript(
    [[tell application "System Events" to tell appearance preferences to set dark mode to ]] ..
    (select(2, hs.osascript.applescript(
      [[tell application "System Events" to tell appearance preferences to return dark mode]])) and
    "false" or "true"))
end)

-- Go to sleep
hs.hotkey.bind({"⌘", "⌃"}, "s", function()
  hs.caffeinate.systemSleep()
end)


-- Spoons
anycomplete = hs.loadSpoon("Anycomplete")
anycomplete.engine = "duckduckgo"
anycomplete.bindHotkeys()

mouseFollowsFocus = hs.loadSpoon("MouseFollowsFocus")
mouseFollowsFocus:start()

-- hs.hotkey.bind(hyperKey, '`', function()
--   local screen = hs.mouse.getCurrentScreen()
--   local nextScreen = screen:next()
--   local rect = nextScreen:fullFrame()
--   local center = hs.geometry.rectMidPoint(rect)hs.mouse.setAbsolutePosition(center)
-- end)

hs.hotkey.bind({"⌃", "⌥", "⌘"}, "m", function()
  -- hs.alert.show("aboba")
  -- hs.notify.new({title="Pomodoro", informativeText="You can take a break now!", autoWithdraw=true, withdrawAfter=10, soundName="Submarine.aiff"}):send()
  hs.notify.new({title="Pomodoro", informativeText="You can take a break now!", autoWithdraw=true, withdrawAfter=10, soundName="Breeze"}):send()
  -- hs.notify.show("Title", "Subtitle", "Information")
end)
