local _s = {}
local function _xor(a,b) local r,p=0,1 for i=0,7 do if(math.floor(a/p)%2)~=(math.floor(b/p)%2)then r=r+p end p=p*2 end return r end
_s[0] = (function() local d={ 100,93,79,126,69,69,70 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[1] = (function() local d={ 92,27,4,26 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[2] = (function() local d={ 100,93,79,126,69,69,70,117,111,121,122 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[3] = (function() local d={ 108,70,83 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[4] = (function() local d={ 124,67,89,95,75,70 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[5] = (function() local d={ 103,67,89,73 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[6] = (function() local d={ 103,101,124,111,103,111,100,126 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[7] = (function() local d={ 108,70,83,10,121,90,79,79,78 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[8] = (function() local d={ 121,122,107,105,111,10,200,170,190,10,127,90,10,10,86,10,10,123,10,200,170,190,10,110,69,93,68 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[9] = (function() local d={ 120,111,100,110,111,120,99,100,109 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[10] = (function() local d={ 122,102,107,115,111,120,121 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[11] = (function() local d={ 111,114,126,120,107,121 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[12] = (function() local d={ 125,101,120,102,110 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[13] = (function() local d={ 110,99,121,122,102,107,115 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[14] = (function() local d={ 121,111,120,124,111,120 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[15] = (function() local d={ 122,102,107,115,111,120 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[16] = (function() local d={ 108,102,115,10,121,111,126,126,99,100,109,121 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[17] = (function() local d={ 99,68,76,67,68,67,94,79,10,96,95,71,90,10,2,124,3 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[18] = (function() local d={ 105,70,67,73,65,10,126,122,10,2,103,69,95,89,79,3 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[19] = (function() local d={ 108,95,70,70,72,88,67,77,66,94 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[20] = (function() local d={ 120,79,71,69,92,79,10,108,69,77 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[21] = (function() local d={ 105,88,69,89,89,66,75,67,88 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[22] = (function() local d={ 111,121,122,10,2,122,70,75,83,79,88,10,100,75,71,79,89,3 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[23] = (function() local d={ 109,69,78,10,103,69,78,79 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[24] = (function() local d={ 99,68,92,67,89,67,72,70,79 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[25] = (function() local d={ 108,70,67,68,77 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[26] = (function() local d={ 120,79,75,73,66,10,2,24,26,10,89,94,95,78,89,3 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[27] = (function() local d={ 121,90,67,68,10,104,69,94 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[28] = (function() local d={ 107,68,94,67,7,107,108,97 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[29] = (function() local d={ 107,95,94,69,10,105,69,70,70,79,73,94 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[30] = (function() local d={ 104,120,99,100,109,10,107,102,102,10,126,101,101,102,121 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[31] = (function() local d={ 104,126,101,101,102,121,10,2,102,69,73,75,70,3 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[32] = (function() local d={ 126,111,102,111,122,101,120,126,10,126,101,10,122,102,107,115,111,120 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[33] = (function() local d={ 120,111,96,101,99,100 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[34] = (function() local d={ 121,111,120,124,111,120,10,98,101,122 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[35] = (function() local d={ 110,111,121,126,120,101,115,10,109,127,99 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[36] = (function() local d={ 120,111,121,111,126,10,121,122,111,111,110 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[37] = (function() local d={ 120,111,121,111,126,10,125,101,120,102,110 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[38] = (function() local d={ 122,70,75,83,79,88,10,68,75,71,79,10,94,69,10,126,122,4,4,4 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[39] = (function() local d={ 66,94,94,90,89,16,5,5,77,75,71,79,89,4,88,69,72,70,69,82,4,73,69,71,5,92,27,5,77,75,71,79,89,5 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()
_s[40] = (function() local d={ 5,89,79,88,92,79,88,89,5,122,95,72,70,67,73,21,89,69,88,94,101,88,78,79,88,23,107,89,73,12,70,67,71,67,94,23,27,26,26 }; local r=""; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()

--[[
    NweTool v1.0 — Feature Hub
    Toggle GUI: Right Control
    Fly: E | Noclip: N | InfJump: V
]]

-- ═══════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ═══════════════════════════════════════════════
-- THEME
-- ═══════════════════════════════════════════════

local Theme = {
    BG = Color3.fromRGB(15, 15, 22),
    Card = Color3.fromRGB(22, 22, 32),
    Panel = Color3.fromRGB(18, 18, 28),
    Accent = Color3.fromRGB(90, 130, 255),
    AccentGlow = Color3.fromRGB(110, 150, 255),
    Red = Color3.fromRGB(255, 55, 65),
    Orange = Color3.fromRGB(255, 155, 45),
    Gold = Color3.fromRGB(255, 210, 50),
    Green = Color3.fromRGB(55, 220, 115),
    Text = Color3.fromRGB(235, 235, 245),
    TextDim = Color3.fromRGB(110, 110, 130),
    TextMuted = Color3.fromRGB(70, 70, 90),
    Border = Color3.fromRGB(40, 40, 55),
    ToggleOn = Color3.fromRGB(75, 200, 115),
    ToggleOff = Color3.fromRGB(45, 45, 60),
}

-- ═══════════════════════════════════════════════
-- CLEANUP
-- ═══════════════════════════════════════════════

if game:GetService("CoreGui"):FindFirstChild(_s[0]) then
    game:GetService("CoreGui"):FindFirstChild(_s[0]):Destroy()
end

-- ═══════════════════════════════════════════════
-- SCREEN GUI
-- ═══════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = _s[0]
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- ═══════════════════════════════════════════════
-- UTILITY
-- ═══════════════════════════════════════════════

local function create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Parent" then inst[k] = v end
    end
    if props.Parent then inst.Parent = props.Parent end
    return inst
end

local function addCorner(parent, r)
    return create("UICorner", { CornerRadius = UDim.new(0, r), Parent = parent })
end

local function addStroke(parent, color, t)
    return create("UIStroke", { Color = color, Thickness = t, Parent = parent })
end

local function addPadding(parent, t, b, l, r)
    return create("UIPadding", {
        PaddingTop = UDim.new(0, t), PaddingBottom = UDim.new(0, b),
        PaddingLeft = UDim.new(0, l), PaddingRight = UDim.new(0, r),
        Parent = parent,
    })
end

local function tween(obj, props, dur, style)
    local t = TweenService:Create(obj, TweenInfo.new(dur or 0.25, style or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

-- ═══════════════════════════════════════════════
-- MAIN FRAME
-- ═══════════════════════════════════════════════

local MainFrame = create("Frame", {
    Name = "MainWindow", Size = UDim2.new(0, 460, 0, 520),
    Position = UDim2.new(0.5, -230, 0.5, -260),
    BackgroundColor3 = Theme.BG, BackgroundTransparency = 0.02,
    BorderSizePixel = 0, Active = true, Draggable = true,
    ClipsDescendants = true,
    Parent = ScreenGui,
})
addCorner(MainFrame, 12)
addStroke(MainFrame, Theme.Border, 1)

-- Subtle glow behind GUI
create("ImageLabel", {
    Size = UDim2.new(1, 40, 1, 40), Position = UDim2.new(0, -20, 0, -20),
    BackgroundTransparency = 1, ImageColor3 = Theme.Accent,
    ImageTransparency = 0.9, Image = "rbxassetid://6022668800",
    ZIndex = -1, Parent = MainFrame,
})

-- ═══════════════════════════════════════════════
-- TITLE BAR
-- ═══════════════════════════════════════════════

local TitleBar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 44),
    BackgroundColor3 = Theme.Accent, BackgroundTransparency = 0.05,
    BorderSizePixel = 0, Parent = MainFrame,
})

create("TextLabel", {
    Size = UDim2.new(1, -80, 1, 0), Position = UDim2.new(0, 14, 0, 0),
    BackgroundTransparency = 1, Text = _s[0],
    TextColor3 = Theme.Text, Font = Enum.Font.GothamBold, TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar,
})

create("TextLabel", {
    Size = UDim2.new(0, 40, 1, 0), Position = UDim2.new(0, 90, 0, 0),
    BackgroundTransparency = 1, Text = _s[1],
    TextColor3 = Theme.TextDim, Font = Enum.Font.Gotham, TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar,
})

-- Minimized floating button
local MinimizedBtn = create("TextButton", {
    Size = UDim2.new(0, 100, 0, 36),
    Position = UDim2.new(0, 10, 0, 10),
    BackgroundColor3 = Theme.BG, BackgroundTransparency = 0.05,
    Text = _s[0], TextColor3 = Theme.Accent,
    Font = Enum.Font.GothamBold, TextSize = 13,
    Visible = false, AutoButtonColor = false,
    Parent = ScreenGui,
})
addCorner(MinimizedBtn, 10)
addStroke(MinimizedBtn, Theme.Accent, 1)

local function minimizeGUI()
    MainFrame.Visible = false
    MinimizedBtn.Visible = true
end

local function restoreGUI()
    MainFrame.Visible = true
    MinimizedBtn.Visible = false
end

MinimizedBtn.MouseButton1Click:Connect(restoreGUI)

-- Minimize (—)
local MinBtn = create("TextButton", {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -72, 0, 7),
    BackgroundColor3 = Theme.Accent, BackgroundTransparency = 0.7,
    Text = "—", TextColor3 = Theme.Accent,
    Font = Enum.Font.GothamBold, TextSize = 16,
    AutoButtonColor = false, Parent = TitleBar,
})
addCorner(MinBtn, 8)
MinBtn.MouseEnter:Connect(function() tween(MinBtn, { BackgroundTransparency = 0.4 }, 0.15) end)
MinBtn.MouseLeave:Connect(function() tween(MinBtn, { BackgroundTransparency = 0.7 }, 0.15) end)
MinBtn.MouseButton1Click:Connect(minimizeGUI)

-- Close (×)
local CloseBtn = create("TextButton", {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -38, 0, 7),
    BackgroundColor3 = Theme.Red, BackgroundTransparency = 0.8,
    Text = "×", TextColor3 = Theme.Red,
    Font = Enum.Font.GothamBold, TextSize = 20,
    AutoButtonColor = false, Parent = TitleBar,
})
addCorner(CloseBtn, 8)
CloseBtn.MouseEnter:Connect(function() tween(CloseBtn, { BackgroundTransparency = 0.5 }, 0.15) end)
CloseBtn.MouseLeave:Connect(function() tween(CloseBtn, { BackgroundTransparency = 0.8 }, 0.15) end)
CloseBtn.MouseButton1Click:Connect(minimizeGUI)

-- ═══════════════════════════════════════════════
-- TAB SYSTEM
-- ═══════════════════════════════════════════════

local TabHolder = create("Frame", {
    Name = "Tabs", Size = UDim2.new(1, -16, 0, 36),
    Position = UDim2.new(0, 8, 0, 52),
    BackgroundTransparency = 1, Parent = MainFrame,
})

local TabContainer = create("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Theme.Card, BackgroundTransparency = 0.3,
    BorderSizePixel = 0, Parent = TabHolder,
})
addCorner(TabContainer, 8)

create("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    Padding = UDim.new(0, 4), Parent = TabContainer,
})
addPadding(TabContainer, 3, 3, 4, 4)

local TabButtons = {}
local TabPages = {}
local ActiveTab = nil

local function createTab(name)
    local btn = create("TextButton", {
        Size = UDim2.new(0, 90, 0, 28),
        BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1,
        Text = name, TextColor3 = Theme.TextDim,
        Font = Enum.Font.GothamSemibold, TextSize = 12,
        AutoButtonColor = false, Parent = TabContainer,
    })
    addCorner(btn, 6)

    local page = create("ScrollingFrame", {
        Name = name .. "Page", Size = UDim2.new(1, -16, 1, -110),
        Position = UDim2.new(0, 8, 0, 96),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        ClipsDescendants = true,
        ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false, Parent = MainFrame,
    })
    create("UIListLayout", { Padding = UDim.new(0, 6), Parent = page })
    addPadding(page, 4, 4, 2, 2)

    TabButtons[name] = btn
    TabPages[name] = page

    btn.MouseButton1Click:Connect(function()
        for n, b in pairs(TabButtons) do
            tween(b, { BackgroundTransparency = 1 }, 0.15)
            b.TextColor3 = Theme.TextDim
            TabPages[n].Visible = false
        end
        tween(btn, { BackgroundTransparency = 0 }, 0.15)
        btn.TextColor3 = Theme.Text
        page.Visible = true
        ActiveTab = name
    end)

    return btn, page
end

-- ═══════════════════════════════════════════════
-- UI COMPONENTS
-- ═══════════════════════════════════════════════

local function createSection(parent, text)
    local s = create("Frame", {
        Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 1,
        Parent = parent,
    })
    create("TextLabel", {
        Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0, 6, 0, 0),
        BackgroundTransparency = 1, Text = text, TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold, TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = s,
    })
    create("Frame", {
        Size = UDim2.new(0.55, 0, 0, 1), Position = UDim2.new(0, 80, 0.5, 0),
        BackgroundColor3 = Theme.Border, BorderSizePixel = 0, Parent = s,
    })
    return s
end

local function createToggle(parent, text, default)
    local toggled = default or false

    local frame = create("Frame", {
        Size = UDim2.new(1, 0, 0, 36), BackgroundColor3 = Theme.Panel,
        BackgroundTransparency = 0.1, BorderSizePixel = 0, Parent = parent,
    })
    addCorner(frame, 8)
    addStroke(frame, Theme.Border, 0.5)

    create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0), Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1, Text = text, TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham, TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = frame,
    })

    local toggleBG = create("Frame", {
        Size = UDim2.new(0, 40, 0, 20), Position = UDim2.new(1, -52, 0.5, -10),
        BackgroundColor3 = toggled and Theme.ToggleOn or Theme.ToggleOff,
        BorderSizePixel = 0, Parent = frame,
    })
    addCorner(toggleBG, 10)

    local toggleCircle = create("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = Theme.Text, BorderSizePixel = 0, Parent = toggleBG,
    })
    addCorner(toggleCircle, 8)

    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "", AutoButtonColor = false, Parent = frame,
    })

    local callback = nil

    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        tween(toggleBG, { BackgroundColor3 = toggled and Theme.ToggleOn or Theme.ToggleOff }, 0.2)
        tween(toggleCircle, {
            Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }, 0.2, Enum.EasingStyle.Back)
        if callback then callback(toggled) end
    end)

    return {
        Get = function() return toggled end,
        Set = function(v)
            toggled = v
            tween(toggleBG, { BackgroundColor3 = v and Theme.ToggleOn or Theme.ToggleOff }, 0.2)
            tween(toggleCircle, {
                Position = v and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            }, 0.2, Enum.EasingStyle.Back)
            if callback then callback(v) end
        end,
        SetCallback = function(self, cb) callback = cb end,
    }
end

local function createButton(parent, text, color, callback)
    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = color or Theme.Accent,
        BackgroundTransparency = 0.1, Text = text, TextColor3 = Theme.Text,
        Font = Enum.Font.GothamBold, TextSize = 14, AutoButtonColor = false,
        Parent = parent,
    })
    addCorner(btn, 8)
    btn.MouseEnter:Connect(function() tween(btn, { BackgroundTransparency = 0 }, 0.15) end)
    btn.MouseLeave:Connect(function() tween(btn, { BackgroundTransparency = 0.1 }, 0.15) end)
    btn.MouseButton1Click:Connect(function()
        tween(btn, { BackgroundTransparency = 0.4 }, 0.05)
        task.wait(0.05)
        tween(btn, { BackgroundTransparency = 0.1 }, 0.1)
        if callback then callback() end
    end)
    return btn
end

local function createSlider(parent, text, min, max, default, callback)
    local frame = create("Frame", {
        Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = Theme.Panel,
        BackgroundTransparency = 0.1, BorderSizePixel = 0, Parent = parent,
    })
    addCorner(frame, 8)
    addStroke(frame, Theme.Border, 0.5)

    local label = create("TextLabel", {
        Size = UDim2.new(0.6, 0, 0, 20), Position = UDim2.new(0, 12, 0, 4),
        BackgroundTransparency = 1, Text = text, TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham, TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = frame,
    })

    local valLabel = create("TextLabel", {
        Size = UDim2.new(0.35, 0, 0, 20), Position = UDim2.new(0.65, 0, 0, 4),
        BackgroundTransparency = 1, Text = tostring(default), TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold, TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right, Parent = frame,
    })

    local track = create("Frame", {
        Size = UDim2.new(1, -24, 0, 6), Position = UDim2.new(0, 12, 0, 30),
        BackgroundColor3 = Theme.ToggleOff, BorderSizePixel = 0, Parent = frame,
    })
    addCorner(track, 3)

    local fill = create("Frame", {
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = track,
    })
    addCorner(fill, 3)

    local thumb = create("Frame", {
        Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7),
        BackgroundColor3 = Theme.Text, BorderSizePixel = 0, Parent = track,
    })
    addCorner(thumb, 7)

    local dragging = false
    local currentVal = default

    local function update(inputX)
        local rel = math.clamp((inputX - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + (max - min) * rel)
        currentVal = val
        fill.Size = UDim2.new(rel, 0, 1, 0)
        thumb.Position = UDim2.new(rel, -7, 0.5, -7)
        valLabel.Text = tostring(val)
        if callback then callback(val) end
    end

    local inputBtn = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "", AutoButtonColor = false, Parent = track,
    })

    inputBtn.MouseButton1Down:Connect(function()
        dragging = true
        local conn
        conn = UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                update(input.Position.X)
            end
        end)
        update(UserInputService:GetMouseLocation().X)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                if conn then conn:Disconnect() end
            end
        end)
    end)

    return {
        Set = function(v)
            currentVal = v
            local rel = (v - min) / (max - min)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            thumb.Position = UDim2.new(rel, -7, 0.5, -7)
            valLabel.Text = tostring(v)
            if callback then callback(v) end
        end,
        Get = function() return currentVal end,
    }
end

local function createLabel(parent, text)
    return create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1,
        Text = "  " .. text, TextColor3 = Theme.TextMuted,
        Font = Enum.Font.Gotham, TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = parent,
    })
end

-- ═══════════════════════════════════════════════
-- TAB: FLY
-- ═══════════════════════════════════════════════

local _, FlyPage = createTab(_s[3])

createSection(FlyPage, _s[6])

local flyToggle = createToggle(FlyPage, _s[3], false)
local noclipToggle = createToggle(FlyPage, "Noclip", false)
local infiniteJumpToggle = createToggle(FlyPage, _s[17], false)
local clickTPToggle = createToggle(FlyPage, _s[18], false)

createSection(FlyPage, _s[16])

local flySpeed = createSlider(FlyPage, _s[7], 1, 50, 16, nil)

createLabel(FlyPage, _s[8])

-- ═══════════════════════════════════════════════
-- TAB: VISUAL
-- ═══════════════════════════════════════════════

local _, VisualPage = createTab(_s[4])

createSection(VisualPage, _s[9])

local fullbrightToggle = createToggle(VisualPage, _s[19], false)
local removeFogToggle = createToggle(VisualPage, _s[20], false)
local crosshairToggle = createToggle(VisualPage, _s[21], false)

createSection(VisualPage, _s[10])

local espToggle = createToggle(VisualPage, _s[22], false)

local crosshairH = create("Frame", {
    Size = UDim2.new(0, 2, 0, 20), Position = UDim2.new(0.5, -1, 0.5, -10),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0,
    Visible = false, ZIndex = 50, Parent = ScreenGui,
})
local crosshairV = create("Frame", {
    Size = UDim2.new(0, 20, 0, 2), Position = UDim2.new(0.5, -10, 0.5, -1),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0,
    Visible = false, ZIndex = 50, Parent = ScreenGui,
})

local espFolder = Instance.new("Folder")
espFolder.Name = _s[2]
espFolder.Parent = ScreenGui

-- ═══════════════════════════════════════════════
-- TAB: MISC
-- ═══════════════════════════════════════════════

local _, MiscPage = createTab(_s[5])

createSection(MiscPage, _s[15])

local speedSlider = createSlider(MiscPage, "Walk Speed", 16, 300, 16, function(val)
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = val
    end
end)

local jumpSlider = createSlider(MiscPage, "Jump Power", 50, 300, 50, function(val)
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = val
    end
end)

createButton(MiscPage, _s[36], Theme.Orange, function()
    speedSlider.Set(16)
    jumpSlider.Set(50)
end)

createSection(MiscPage, _s[12])

local gravitySlider = createSlider(MiscPage, "Gravity", 0, 200, 196, function(val)
    workspace.Gravity = val
end)

local fovSlider = createSlider(MiscPage, "FOV", 30, 120, 70, function(val)
    camera.FieldOfView = val
end)

createButton(MiscPage, _s[37], Theme.Orange, function()
    gravitySlider.Set(196)
    fovSlider.Set(70)
end)

createSection(MiscPage, _s[11])

local godModeToggle = createToggle(MiscPage, _s[23], false)
local invisibleToggle = createToggle(MiscPage, _s[24], false)
local flingToggle = createToggle(MiscPage, _s[25], false)
local reachToggle = createToggle(MiscPage, _s[26], false)
local spinBotToggle = createToggle(MiscPage, _s[27], false)
local antiAFKToggle = createToggle(MiscPage, _s[28], false)
local autoCollectToggle = createToggle(MiscPage, _s[29], false)

createButton(MiscPage, _s[30], Theme.Accent, function()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            obj.Handle.CFrame = char.HumanoidRootPart.CFrame
        end
    end
end)

createButton(MiscPage, _s[31], Theme.Accent, function()
    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        local hammer = Instance.new("Tool")
        hammer.Name = "Hammer"
        hammer.RequiresHandle = false
        hammer.Parent = backpack
        local clone = Instance.new("Tool")
        clone.Name = "Clone"
        clone.RequiresHandle = false
        clone.Parent = backpack
        local deleteTool = Instance.new("Tool")
        deleteTool.Name = "Delete"
        deleteTool.RequiresHandle = false
        deleteTool.Parent = backpack
    end
end)

createSection(MiscPage, _s[14])

local tpPlayerInput = create("TextBox", {
    Size = UDim2.new(1, 0, 0, 34),
    BackgroundColor3 = Theme.Card, BorderSizePixel = 0,
    Text = "", PlaceholderText = _s[38],
    PlaceholderColor3 = Theme.TextMuted, TextColor3 = Theme.Text,
    Font = Enum.Font.Gotham, TextSize = 13, ClearTextOnFocus = false,
    Parent = MiscPage,
})
addCorner(tpPlayerInput, 6)
addStroke(tpPlayerInput, Theme.Border, 0.5)

createButton(MiscPage, _s[32], Theme.Accent, function()
    local name = tpPlayerInput.Text
    if name == "" then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(name:lower()) or p.DisplayName:lower():find(name:lower()) then
            local targetChar = p.Character
            local myChar = player.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and myChar and myChar:FindFirstChild("HumanoidRootPart") then
                myChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            end
            break
        end
    end
end)

createButton(MiscPage, _s[33], Theme.Orange, function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

createButton(MiscPage, _s[34], Theme.Accent, function()
    local servers = game:GetService("HttpService"):JSONDecode(
        game:HttpGet(_s[39] .. game.PlaceId .. _s[40])
    )
    if servers and servers.data then
        for _, s in ipairs(servers.data) do
            if s.id ~= game.JobId and s.playing < s.maxPlayers then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id, player)
                break
            end
        end
    end
end)

createSection(MiscPage, _s[13])

createButton(MiscPage, _s[35], Theme.Red, function()
    ScreenGui:Destroy()
end)

-- ═══════════════════════════════════════════════
-- FEATURE LOGIC
-- ═══════════════════════════════════════════════

-- Fly
local flying = false
local flyBV, flyBG
local bodyGyro = nil

local function startFly()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    flying = true
    local hrp = char.HumanoidRootPart
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = true end
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.Parent = hrp
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 9000
    bodyGyro.D = 500
    bodyGyro.Parent = hrp
end

local function stopFly()
    flying = false
    if flyBV then flyBV:Destroy() flyBV = nil end
    if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end

flyToggle:SetCallback(function(enabled)
    if enabled then startFly() else stopFly() end
end)

RunService.RenderStepped:Connect(function()
    if flying then
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local camCF = camera.CFrame
        local speed = flySpeed.Get()
        local vel = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then vel = vel - Vector3.new(0, 1, 0) end
        flyBV.Velocity = vel * speed
        bodyGyro.CFrame = camCF
    end
end)

-- Noclip
local noclipConn = nil
noclipToggle:SetCallback(function(enabled)
    if enabled then
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpToggle.Get() then
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Click TP
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and clickTPToggle.Get() then
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local mouse = player:GetMouse()
            if mouse and mouse.Hit then
                char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end
    end
end)

-- Fullbright
local origBrightness = nil
local origClockTime = nil
fullbrightToggle:SetCallback(function(enabled)
    if enabled then
        origBrightness = Lighting.Brightness
        origClockTime = Lighting.ClockTime
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = origBrightness or 1
        Lighting.ClockTime = origClockTime or 12
        Lighting.GlobalShadows = true
    end
end)

-- Remove Fog
local origFogEnd = nil
local origFogStart = nil
removeFogToggle:SetCallback(function(enabled)
    if enabled then
        origFogEnd = Lighting.FogEnd
        origFogStart = Lighting.FogStart
        Lighting.FogEnd = 1000000
        Lighting.FogStart = 0
    else
        Lighting.FogEnd = origFogEnd or 100000
        Lighting.FogStart = origFogStart or 0
    end
end)

-- Crosshair
crosshairToggle:SetCallback(function(enabled)
    crosshairH.Visible = enabled
    crosshairV.Visible = enabled
end)

-- ESP
local function createESPForPlayer(target)
    if target == player then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = _s[2]
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = nil
    billboard.Parent = espFolder

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 80, 90)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.Parent = billboard

    local function onCharacterAdded(char)
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if hrp then billboard.Adornee = hrp end
    end

    if target.Character then onCharacterAdded(target.Character) end
    target.CharacterAdded:Connect(onCharacterAdded)
end

local function clearESP()
    for _, child in ipairs(espFolder:GetChildren()) do child:Destroy() end
end

espToggle:SetCallback(function(enabled)
    if enabled then
        for _, p in ipairs(Players:GetPlayers()) do createESPForPlayer(p) end
        Players.PlayerAdded:Connect(function(p)
            if espToggle.Get() then createESPForPlayer(p) end
        end)
    else
        clearESP()
    end
end)

-- God Mode
local origMaxHealth = nil
local origHealth = nil
godModeToggle:SetCallback(function(enabled)
    local char = player.Character
    if not char or not char:FindFirstChild("Humanoid") then return end
    if enabled then
        origMaxHealth = char.Humanoid.MaxHealth
        origHealth = char.Humanoid.Health
        char.Humanoid.MaxHealth = math.huge
        char.Humanoid.Health = math.huge
    else
        char.Humanoid.MaxHealth = origMaxHealth or 100
        char.Humanoid.Health = origHealth or 100
    end
end)

-- Invisible
local invisibleConn = nil
invisibleToggle:SetCallback(function(enabled)
    local char = player.Character
    if not char then return end
    if enabled then
        invisibleConn = RunService.RenderStepped:Connect(function()
            local ch = player.Character
            if not ch then return end
            for _, part in ipairs(ch:GetDescendants()) do
                if part:IsA("BasePart") then part.Transparency = 1
                elseif part:IsA("Decal") then part.Transparency = 1 end
            end
            local head = ch:FindFirstChild("Head")
            if head and head:FindFirstChild("face") then head.face.Transparency = 1 end
        end)
    else
        if invisibleConn then invisibleConn:Disconnect() invisibleConn = nil end
        local ch = player.Character
        if ch then
            for _, part in ipairs(ch:GetDescendants()) do
                if part:IsA("BasePart") then part.Transparency = 0
                elseif part:IsA("Decal") then part.Transparency = 0 end
            end
        end
    end
end)

-- Fling (Passive)
local flingTouchedConns = {}

local function startFling()
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            local c = part.Touched:Connect(function(hit)
                if not flingToggle.Get() then return end
                if not hit or not hit.Parent then return end
                local hitChar = hit.Parent
                if hitChar == char then return end
                local hitHumanoid = hitChar:FindFirstChildOfClass("Humanoid")
                if not hitHumanoid or hitHumanoid.Health <= 0 then return end
                local hitRoot = hitChar:FindFirstChild("HumanoidRootPart")
                if not hitRoot then return end
                local myRoot = char:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end
                local direction = (hitRoot.Position - myRoot.Position).Unit
                hitRoot.Velocity = direction * 200 + Vector3.new(0, 100, 0)
                hitRoot.RotVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
            end)
            table.insert(flingTouchedConns, c)
        end
    end
end

local function stopFling()
    for _, c in ipairs(flingTouchedConns) do
        if c.Connected then c:Disconnect() end
    end
    flingTouchedConns = {}
end

flingToggle:SetCallback(function(enabled)
    if enabled then startFling() else stopFling() end
end)

-- Reach
local function setReach(enabled)
    local char = player.Character
    if not char then return end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            local handle = tool:FindFirstChild("Handle")
            if handle then
                if enabled then
                    handle.Size = Vector3.new(2, 2, 40)
                else
                    handle.Size = Vector3.new(2, 2, 1)
                end
            end
        end
    end
end

reachToggle:SetCallback(function(enabled) setReach(enabled) end)

player.Backpack.ChildAdded:Connect(function(tool)
    if reachToggle.Get() and tool:IsA("Tool") and tool:FindFirstChild("Handle") then
        tool.Handle.Size = Vector3.new(2, 2, 40)
    end
end)

-- Spin Bot
local spinAngle = 0
RunService.RenderStepped:Connect(function()
    if spinBotToggle.Get() then
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            spinAngle = spinAngle + 3
            if spinAngle >= 360 then spinAngle = 0 end
            local rootCF = char.HumanoidRootPart.CFrame
            char.HumanoidRootPart.CFrame = CFrame.new(rootCF.Position) * CFrame.Angles(0, math.rad(spinAngle), 0) * (rootCF - rootCF.Position)
        end
    end
end)

-- Anti-AFK
local VirtualUser = game:GetService("VirtualUser")
player.Idled:Connect(function()
    if antiAFKToggle.Get() then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- Auto Collect
local function collectNearby()
    if not autoCollectToggle.Get() then return end
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local pos = char.HumanoidRootPart.Position
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Position - pos).Magnitude < 50 then
            if obj:FindFirstChildOfClass("TouchInterest") or obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("orb") or obj.Name:lower():find("pickup") then
                obj.CFrame = CFrame.new(pos)
            end
        end
    end
end

task.spawn(function()
    while task.wait(1) do pcall(collectNearby) end
end)

-- ═══════════════════════════════════════════════
-- TOGGLE GUI (Right Control)
-- ═══════════════════════════════════════════════

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if MainFrame.Visible then minimizeGUI() else restoreGUI() end
    elseif input.KeyCode == Enum.KeyCode.E then
        if flying then stopFly() else startFly() end
    elseif input.KeyCode == Enum.KeyCode.N then
        noclipToggle.Set(not noclipToggle.Get())
    elseif input.KeyCode == Enum.KeyCode.V then
        infiniteJumpToggle.Set(not infiniteJumpToggle.Get())
    end
end)

-- ═══════════════════════════════════════════════
-- AUTO RECONNECT
-- ═══════════════════════════════════════════════

player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flying then startFly() end
end)

-- ═══════════════════════════════════════════════
-- INIT — Show Fly tab by default
-- ═══════════════════════════════════════════════

for name, btn in pairs(TabButtons) do
    if name == _s[3] then
        tween(btn, { BackgroundTransparency = 0 }, 0.2)
        btn.TextColor3 = Theme.Text
        TabPages[name].Visible = true
        ActiveTab = name
    end
end

print("═══════════════════════════════════")
print("  NweTool v1.0 — Loaded!")
print("  Toggle GUI: Right Control")
print("  Fly: E | Noclip: N | InfJump: V")
print("═══════════════════════════════════")
