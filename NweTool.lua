-- ADHIHUB v1.1 - Feature Hub
-- Toggle GUI: Right Control
-- Fly: E | Noclip: N | InfJump: V
-- Free Cam: C | Aimbot: Hold RMB

-- ===============================================
-- SERVICES
-- ===============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ===============================================
-- THEME - Deep Dark Premium
-- ===============================================

local Theme = {
    BG           = Color3.fromRGB(12, 12, 18),
    Card         = Color3.fromRGB(20, 20, 30),
    Panel        = Color3.fromRGB(16, 16, 26),
    Surface      = Color3.fromRGB(24, 24, 36),
    Accent       = Color3.fromRGB(85, 125, 255),
    AccentLight  = Color3.fromRGB(110, 155, 255),
    AccentDark   = Color3.fromRGB(60, 95, 220),
    AccentGlow   = Color3.fromRGB(130, 170, 255),
    Red          = Color3.fromRGB(255, 55, 65),
    RedSoft      = Color3.fromRGB(200, 50, 60),
    Orange       = Color3.fromRGB(255, 150, 40),
    OrangeSoft   = Color3.fromRGB(220, 130, 40),
    Gold         = Color3.fromRGB(255, 210, 50),
    Green        = Color3.fromRGB(55, 215, 115),
    GreenSoft    = Color3.fromRGB(45, 180, 100),
    Purple       = Color3.fromRGB(160, 100, 255),
    Teal         = Color3.fromRGB(50, 210, 200),
    Text         = Color3.fromRGB(240, 240, 250),
    TextDim      = Color3.fromRGB(130, 130, 155),
    TextMuted    = Color3.fromRGB(75, 75, 100),
    Border       = Color3.fromRGB(35, 35, 50),
    BorderLight  = Color3.fromRGB(50, 50, 68),
    ToggleOn     = Color3.fromRGB(75, 200, 115),
    ToggleOff    = Color3.fromRGB(40, 40, 55),
    Shadow       = Color3.fromRGB(0, 0, 0),
}

-- ===============================================
-- CLEANUP
-- ===============================================

if game:GetService("CoreGui"):FindFirstChild("ADHIHUB") then
    game:GetService("CoreGui"):FindFirstChild("ADHIHUB"):Destroy()
end

-- ===============================================
-- SCREEN GUI
-- ===============================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ADHIHUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- ===============================================
-- ANIMATION ENGINE
-- ===============================================

local function tw(obj, props, dur, style, dir)
    local info = TweenInfo.new(
        dur or 0.2,
        style or Enum.EasingStyle.Quint,
        dir or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local function quickTw(obj, props)
    return tw(obj, props, 0.15, Enum.EasingStyle.Quad)
end

local function smoothTw(obj, props)
    return tw(obj, props, 0.35, Enum.EasingStyle.Quint)
end

local function bounceTw(obj, props)
    return tw(obj, props, 0.3, Enum.EasingStyle.Back)
end

-- ===============================================
-- UI HELPERS
-- ===============================================

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

local function addStroke(parent, color, t, trans)
    local s = create("UIStroke", { Color = color, Thickness = t or 1, Parent = parent })
    if trans then s.Transparency = trans end
    return s
end

local function addPadding(parent, t, b, l, r)
    return create("UIPadding", {
        PaddingTop = UDim.new(0, t), PaddingBottom = UDim.new(0, b),
        PaddingLeft = UDim.new(0, l), PaddingRight = UDim.new(0, r),
        Parent = parent,
    })
end

local function addGradient(parent, c1, c2, rotation)
    local g = create("UIGradient", {
        Color = ColorSequence.new(c1, c2),
        Rotation = rotation or 90,
        Parent = parent,
    })
    return g
end

local function addShadow(parent)
    local shadow = create("ImageLabel", {
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 4),
        Size = UDim2.new(1, 30, 1, 30),
        Image = "rbxassetid://5554236805",
        ImageColor3 = Color3.new(0, 0, 0),
        ImageTransparency = 0.6,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(23, 23, 277, 277),
        Parent = parent,
    })
    return shadow
end

-- ===============================================
-- MAIN FRAME
-- ===============================================

local MainFrame = create("Frame", {
    Name = "MainWindow",
    Size = UDim2.new(0, 440, 0, 500),
    Position = UDim2.new(0.5, -220, 0.5, -250),
    BackgroundColor3 = Color3.fromRGB(10, 10, 16),
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true,
    ClipsDescendants = true,
    Parent = ScreenGui,
})
addCorner(MainFrame, 14)
addStroke(MainFrame, Theme.Border, 1, 0.3)
addShadow(MainFrame)

-- ===============================================
-- TITLE BAR
-- ===============================================

local TitleBar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 46),
    BackgroundColor3 = Color3.fromRGB(10, 10, 16),
    BackgroundTransparency = 0,
    BorderSizePixel = 0,
    Parent = MainFrame,
})

-- Title accent line
create("Frame", {
    Size = UDim2.new(0, 3, 0, 18),
    Position = UDim2.new(0, 14, 0.5, -9),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    Parent = TitleBar,
})
addCorner(create("Frame", { Size = UDim2.new(1, 0, 1, 0), Parent = TitleBar }), 3)

create("TextLabel", {
    Size = UDim2.new(0, 200, 1, 0),
    Position = UDim2.new(0, 24, 0, 0),
    BackgroundTransparency = 1,
    Text = "ADHIHUB",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 17,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar,
})

create("TextLabel", {
    Size = UDim2.new(0, 40, 1, 0),
    Position = UDim2.new(0, 108, 0, 0),
    BackgroundTransparency = 1,
    Text = "v1.1",
    TextColor3 = Theme.TextDim,
    Font = Enum.Font.Gotham,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar,
})

-- Minimized floating button
local MinimizedBtn = create("TextButton", {
    Size = UDim2.new(0, 120, 0, 40),
    Position = UDim2.new(0, 12, 0, 12),
    BackgroundColor3 = Color3.fromRGB(18, 18, 28),
    BackgroundTransparency = 0.05,
    Text = "ADHIHUB",
    TextColor3 = Theme.AccentLight,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    Visible = false,
    AutoButtonColor = false,
    Parent = ScreenGui,
})
addCorner(MinimizedBtn, 12)
addStroke(MinimizedBtn, Theme.Accent, 2, 0.3)
addShadow(MinimizedBtn)

-- Mini gradient background so it's clearly dark
local miniGrad = create("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 0.15,
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Parent = MinimizedBtn,
})
addCorner(miniGrad, 12)
addGradient(miniGrad, Theme.Card, Theme.BG, 90)

MinimizedBtn.MouseEnter:Connect(function()
    smoothTw(MinimizedBtn, { BackgroundColor3 = Color3.fromRGB(28, 28, 42) })
    smoothTw(MinimizedBtn, { TextColor3 = Theme.Text })
end)
MinimizedBtn.MouseLeave:Connect(function()
    smoothTw(MinimizedBtn, { BackgroundColor3 = Color3.fromRGB(18, 18, 28) })
    smoothTw(MinimizedBtn, { TextColor3 = Theme.AccentLight })
end)

local function minimizeGUI()
    bounceTw(MainFrame, { Position = UDim2.new(0.5, -220, 1, 20) })
    task.delay(0.25, function()
        MainFrame.Visible = false
        MinimizedBtn.Visible = true
        MinimizedBtn.Position = UDim2.new(0, 12, 0, -50)
        smoothTw(MinimizedBtn, { Position = UDim2.new(0, 12, 0, 12) })
    end)
end

local function restoreGUI()
    MinimizedBtn.Visible = false
    MainFrame.Position = UDim2.new(0.5, -220, 1, 20)
    MainFrame.Visible = true
    bounceTw(MainFrame, { Position = UDim2.new(0.5, -220, 0.5, -250) })
end

MinimizedBtn.MouseButton1Click:Connect(restoreGUI)

-- Minimize button (-)
local MinBtn = create("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -68, 0, 9),
    BackgroundColor3 = Theme.Accent,
    BackgroundTransparency = 0.85,
    Text = "-",
    TextColor3 = Theme.AccentLight,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    AutoButtonColor = false,
    Parent = TitleBar,
})
addCorner(MinBtn, 8)
MinBtn.MouseEnter:Connect(function()
    quickTw(MinBtn, { BackgroundTransparency = 0.6, TextColor3 = Theme.Text })
end)
MinBtn.MouseLeave:Connect(function()
    smoothTw(MinBtn, { BackgroundTransparency = 0.85, TextColor3 = Theme.AccentLight })
end)
MinBtn.MouseButton1Click:Connect(minimizeGUI)

-- Close button ()
local CloseBtn = create("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -36, 0, 9),
    BackgroundColor3 = Theme.Red,
    BackgroundTransparency = 0.85,
    Text = "",
    TextColor3 = Theme.Red,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    AutoButtonColor = false,
    Parent = TitleBar,
})
addCorner(CloseBtn, 8)
CloseBtn.MouseEnter:Connect(function()
    quickTw(CloseBtn, { BackgroundTransparency = 0.6, TextColor3 = Theme.Text })
end)
CloseBtn.MouseLeave:Connect(function()
    smoothTw(CloseBtn, { BackgroundTransparency = 0.85, TextColor3 = Theme.Red })
end)
CloseBtn.MouseButton1Click:Connect(minimizeGUI)

-- ===============================================
-- TAB SYSTEM
-- ===============================================

local TabHolder = create("Frame", {
    Size = UDim2.new(1, -16, 0, 36),
    Position = UDim2.new(0, 8, 0, 50),
    BackgroundTransparency = 1,
    Parent = MainFrame,
})

local TabBg = create("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Theme.Card,
    BackgroundTransparency = 0.2,
    BorderSizePixel = 0,
    Parent = TabHolder,
})
addCorner(TabBg, 10)

create("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    Padding = UDim.new(0, 3),
    Parent = TabBg,
})
addPadding(TabBg, 3, 3, 4, 4)

local TabButtons = {}
local TabPages = {}
local ActiveTab = nil

local function createTab(name)
    local btn = create("TextButton", {
        Size = UDim2.new(0, 85, 0, 28),
        BackgroundColor3 = Theme.Accent,
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Theme.TextDim,
        Font = Enum.Font.GothamSemibold,
        TextSize = 12,
        AutoButtonColor = false,
        Parent = TabBg,
    })
    addCorner(btn, 7)

    local indicator = create("Frame", {
        Size = UDim2.new(0.4, 0, 0, 2),
        Position = UDim2.new(0.3, 0, 1, -3),
        BackgroundColor3 = Theme.Accent,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = btn,
    })
    addCorner(indicator, 1)

    local page = create("ScrollingFrame", {
        Name = name .. "Page",
        Size = UDim2.new(1, -16, 1, -108),
        Position = UDim2.new(0, 8, 0, 94),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme.Accent,
        ScrollBarImageTransparency = 0.5,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = MainFrame,
    })
    create("UIListLayout", { Padding = UDim.new(0, 5), Parent = page })
    addPadding(page, 4, 4, 2, 2)

    TabButtons[name] = { Button = btn, Indicator = indicator }
    TabPages[name] = page

    btn.MouseButton1Click:Connect(function()
        for n, data in pairs(TabButtons) do
            smoothTw(data.Button, { BackgroundTransparency = 1 })
            data.Button.TextColor3 = Theme.TextDim
            smoothTw(data.Indicator, { BackgroundTransparency = 1 })
            TabPages[n].Visible = false
        end
        smoothTw(btn, { BackgroundTransparency = 0 })
        btn.TextColor3 = Theme.Text
        smoothTw(indicator, { BackgroundTransparency = 0 })
        page.Visible = true
        ActiveTab = name
    end)

    btn.MouseEnter:Connect(function()
        if ActiveTab ~= name then
            quickTw(btn, { TextColor3 = Theme.AccentLight })
        end
    end)
    btn.MouseLeave:Connect(function()
        if ActiveTab ~= name then
            quickTw(btn, { TextColor3 = Theme.TextDim })
        end
    end)

    return btn, page
end

-- ===============================================
-- UI COMPONENTS
-- ===============================================

local function createSection(parent, text)
    local s = create("Frame", {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundTransparency = 1,
        Parent = parent,
    })
    create("TextLabel", {
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0, 6, 0, 0),
        BackgroundTransparency = 1,
        Text = string.upper(text),
        TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = s,
    })
    create("Frame", {
        Size = UDim2.new(0.5, 0, 0, 1),
        Position = UDim2.new(0.5, 4, 0.5, 0),
        BackgroundColor3 = Theme.Border,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = s,
    })
    return s
end

local function createToggle(parent, text, default)
    local toggled = default or false

    local frame = create("Frame", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = Theme.Panel,
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        Parent = parent,
    })
    addCorner(frame, 10)

    local accentLine = create("Frame", {
        Size = UDim2.new(0, 3, 0.5, 0),
        Position = UDim2.new(0, 0, 0.25, 0),
        BackgroundColor3 = Theme.Accent,
        BackgroundTransparency = toggled and 0 or 1,
        BorderSizePixel = 0,
        Parent = frame,
    })
    addCorner(accentLine, 2)

    create("TextLabel", {
        Size = UDim2.new(1, -60, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame,
    })

    local toggleBG = create("Frame", {
        Size = UDim2.new(0, 42, 0, 22),
        Position = UDim2.new(1, -54, 0.5, -11),
        BackgroundColor3 = toggled and Theme.ToggleOn or Theme.ToggleOff,
        BorderSizePixel = 0,
        Parent = frame,
    })
    addCorner(toggleBG, 11)

    local toggleCircle = create("Frame", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
        BackgroundColor3 = toggled and Color3.new(1, 1, 1) or Theme.TextDim,
        BorderSizePixel = 0,
        Parent = toggleBG,
    })
    addCorner(toggleCircle, 9)

    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = frame,
    })

    local callback = nil

    btn.MouseEnter:Connect(function()
        if not toggled then
            quickTw(frame, { BackgroundTransparency = 0 })
        end
    end)
    btn.MouseLeave:Connect(function()
        if not toggled then
            smoothTw(frame, { BackgroundTransparency = 0.05 })
        end
    end)

    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        smoothTw(toggleBG, { BackgroundColor3 = toggled and Theme.ToggleOn or Theme.ToggleOff })
        bounceTw(toggleCircle, {
            Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
            BackgroundColor3 = toggled and Color3.new(1, 1, 1) or Theme.TextDim,
        })
        smoothTw(accentLine, { BackgroundTransparency = toggled and 0 or 1 })
        if toggled then
            quickTw(frame, { BackgroundTransparency = 0 })
        else
            smoothTw(frame, { BackgroundTransparency = 0.05 })
        end
        if callback then callback(toggled) end
    end)

    return {
        Get = function() return toggled end,
        Set = function(v)
            toggled = v
            smoothTw(toggleBG, { BackgroundColor3 = v and Theme.ToggleOn or Theme.ToggleOff })
            bounceTw(toggleCircle, {
                Position = v and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
                BackgroundColor3 = v and Color3.new(1, 1, 1) or Theme.TextDim,
            })
            smoothTw(accentLine, { BackgroundTransparency = v and 0 or 1 })
            if v then
                quickTw(frame, { BackgroundTransparency = 0 })
            else
                smoothTw(frame, { BackgroundTransparency = 0.05 })
            end
            if callback then callback(v) end
        end,
        SetCallback = function(self, cb) callback = cb end,
    }
end

local function createButton(parent, text, color, callback)
    local btn = create("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = color or Theme.Accent,
        BackgroundTransparency = 0.08,
        Text = text,
        TextColor3 = Theme.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        AutoButtonColor = false,
        Parent = parent,
    })
    addCorner(btn, 10)

    btn.MouseEnter:Connect(function()
        quickTw(btn, { BackgroundTransparency = 0 })
    end)
    btn.MouseLeave:Connect(function()
        smoothTw(btn, { BackgroundTransparency = 0.08 })
    end)
    btn.MouseButton1Click:Connect(function()
        bounceTw(btn, { BackgroundTransparency = 0.3 })
        task.delay(0.1, function()
            smoothTw(btn, { BackgroundTransparency = 0.08 })
        end)
        if callback then callback() end
    end)
    return btn
end

local function createSlider(parent, text, min, max, default, callback)
    local frame = create("Frame", {
        Size = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = Theme.Panel,
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        Parent = parent,
    })
    addCorner(frame, 10)

    create("TextLabel", {
        Size = UDim2.new(0.55, 0, 0, 20),
        Position = UDim2.new(0, 12, 0, 6),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Theme.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = frame,
    })

    local valLabel = create("TextLabel", {
        Size = UDim2.new(0.4, 0, 0, 20),
        Position = UDim2.new(0.6, 0, 0, 6),
        BackgroundTransparency = 1,
        Text = tostring(default),
        TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = frame,
    })

    local track = create("Frame", {
        Size = UDim2.new(1, -24, 0, 6),
        Position = UDim2.new(0, 12, 0, 32),
        BackgroundColor3 = Theme.ToggleOff,
        BorderSizePixel = 0,
        Parent = frame,
    })
    addCorner(track, 3)

    local rel = (default - min) / (max - min)

    local fill = create("Frame", {
        Size = UDim2.new(rel, 0, 1, 0),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Parent = track,
    })
    addCorner(fill, 3)

    local thumb = create("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(rel, -8, 0.5, -8),
        BackgroundColor3 = Theme.Text,
        BorderSizePixel = 0,
        Parent = track,
    })
    addCorner(thumb, 8)

    local thumbStroke = addStroke(thumb, Theme.Accent, 2)

    local dragging = false
    local currentVal = default

    local function update(inputX)
        local rel = math.clamp((inputX - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + (max - min) * rel)
        currentVal = val
        fill.Size = UDim2.new(rel, 0, 1, 0)
        thumb.Position = UDim2.new(rel, -8, 0.5, -8)
        valLabel.Text = tostring(val)
        if callback then callback(val) end
    end

    local inputBtn = create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = track,
    })

    inputBtn.MouseButton1Down:Connect(function()
        dragging = true
        quickTw(thumb, { Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(rel, -10, 0.5, -10) })
        local conn
        conn = UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local newRel = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                rel = newRel
                update(input.Position.X)
            end
        end)
        update(UserInputService:GetMouseLocation().X)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                bounceTw(thumb, { Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(rel, -8, 0.5, -8) })
                if conn then conn:Disconnect() end
            end
        end)
    end)

    return {
        Set = function(v)
            currentVal = v
            rel = (v - min) / (max - min)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            thumb.Position = UDim2.new(rel, -8, 0.5, -8)
            valLabel.Text = tostring(v)
            if callback then callback(v) end
        end,
        Get = function() return currentVal end,
    }
end

local function createLabel(parent, text)
    return create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = "  " .. text,
        TextColor3 = Theme.TextMuted,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = parent,
    })
end

-- ===============================================
-- TAB: FLY
-- ===============================================

local _, FlyPage = createTab("Fly")

createSection(FlyPage, "MOVEMENT")

local flyToggle = createToggle(FlyPage, "Fly", false)
local noclipToggle = createToggle(FlyPage, "Noclip", false)
local infiniteJumpToggle = createToggle(FlyPage, "Infinite Jump (V)", false)
local clickTPToggle = createToggle(FlyPage, "Click TP (Mouse)", false)

createSection(FlyPage, "FLY SETTINGS")

local flySpeed = createSlider(FlyPage, "Fly Speed", 1, 50, 16, nil)

createLabel(FlyPage, "SPACE - Up  |  Q - Down")

-- ===============================================
-- TAB: VISUAL
-- ===============================================

local _, VisualPage = createTab("Visual")

createSection(VisualPage, "RENDERING")

local fullbrightToggle = createToggle(VisualPage, "Fullbright", false)
local removeFogToggle = createToggle(VisualPage, "Remove Fog", false)
local crosshairToggle = createToggle(VisualPage, "Crosshair", false)

createSection(VisualPage, "PLAYERS")

local espToggle = createToggle(VisualPage, "ESP (Player Names)", false)

local crosshairH = create("Frame", {
    Size = UDim2.new(0, 2, 0, 20),
    Position = UDim2.new(0.5, -1, 0.5, -10),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BorderSizePixel = 0,
    Visible = false, ZIndex = 50,
    Parent = ScreenGui,
})
local crosshairV = create("Frame", {
    Size = UDim2.new(0, 20, 0, 2),
    Position = UDim2.new(0.5, -10, 0.5, -1),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BorderSizePixel = 0,
    Visible = false, ZIndex = 50,
    Parent = ScreenGui,
})

-- FOV Circle for Aimbot
local fovCircle = create("Frame", {
    Name = "FOVCircle",
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = Theme.Accent,
    BackgroundTransparency = 0.85,
    BorderSizePixel = 2,
    BorderColor3 = Theme.Accent,
    Visible = false, ZIndex = 49,
    Parent = ScreenGui,
})
addCorner(fovCircle, 9999)

local espFolder = Instance.new("Folder")
espFolder.Name = "ADHIHUB_ESP"
espFolder.Parent = ScreenGui

-- ===============================================
-- TAB: MISC
-- ===============================================

local _, MiscPage = createTab("Misc")

createSection(MiscPage, "PLAYER")

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

createButton(MiscPage, "RESET SPEED", Theme.Orange, function()
    speedSlider.Set(16)
    jumpSlider.Set(50)
end)

createSection(MiscPage, "WORLD")

local gravitySlider = createSlider(MiscPage, "Gravity", 0, 200, 196, function(val)
    workspace.Gravity = val
end)

local fovSlider = createSlider(MiscPage, "FOV", 30, 120, 70, function(val)
    camera.FieldOfView = val
end)

createButton(MiscPage, "RESET WORLD", Theme.Orange, function()
    gravitySlider.Set(196)
    fovSlider.Set(70)
end)

createSection(MiscPage, "EXTRAS")

local godModeToggle = createToggle(MiscPage, "God Mode", false)
local invisibleToggle = createToggle(MiscPage, "Invisible", false)
local flingToggle = createToggle(MiscPage, "Fling", false)
local reachToggle = createToggle(MiscPage, "Reach (20 studs)", false)
local spinBotToggle = createToggle(MiscPage, "Spin Bot", false)
local antiAFKToggle = createToggle(MiscPage, "Anti-AFK", false)
local autoCollectToggle = createToggle(MiscPage, "Auto Collect", false)

createButton(MiscPage, "BRING ALL TOOLS", Theme.Accent, function()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            obj.Handle.CFrame = char.HumanoidRootPart.CFrame
        end
    end
end)

createButton(MiscPage, "BTOOLS (Local)", Theme.Purple, function()
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

createSection(MiscPage, "SERVER")

local tpPlayerInput = create("TextBox", {
    Size = UDim2.new(1, 0, 0, 34),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Text = "",
    PlaceholderText = "Player name to TP...",
    PlaceholderColor3 = Color3.fromRGB(50, 50, 70),
    TextColor3 = Theme.Text,
    Font = Enum.Font.Gotham,
    TextSize = 13,
    ClearTextOnFocus = false,
    Parent = MiscPage,
})
addCorner(tpPlayerInput, 8)
addStroke(tpPlayerInput, Theme.Border, 1, 0.5)

createButton(MiscPage, "TELEPORT TO PLAYER", Theme.Accent, function()
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

createButton(MiscPage, "REJOIN", Theme.Orange, function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

createButton(MiscPage, "SERVER HOP", Theme.Teal, function()
    local servers = game:GetService("HttpService"):JSONDecode(
        game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
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

createSection(MiscPage, "DISPLAY")

createButton(MiscPage, "DESTROY GUI", Theme.Red, function()
    ScreenGui:Destroy()
end)

-- ===============================================
-- TAB: ADV (Advanced)
-- ===============================================

local _, AdvPage = createTab("ADV")

createSection(AdvPage, "COMBAT")

local aimbotToggle = createToggle(AdvPage, "Aimbot (Hold Right Click)", false)
local hitboxToggle = createToggle(AdvPage, "Hitbox Expander (20x)", false)

createSection(AdvPage, "AIMBOT SETTINGS")

local aimbotFOV = createSlider(AdvPage, "FOV Radius", 30, 500, 120, nil)
local aimbotSmooth = createSlider(AdvPage, "Smoothness", 1, 20, 5, nil)

createLabel(AdvPage, "Hold RIGHT CLICK to aim at nearest player")

createSection(AdvPage, "UTILITIES")

local freeCamToggle = createToggle(AdvPage, "Free Cam (Spy Cam)", false)
local antiKickToggle = createToggle(AdvPage, "Anti-Kick / Anti-Admin", false)

createLabel(AdvPage, "Free Cam: WASD move | Q down | Space up")

-- ===============================================
-- FEATURE LOGIC
-- ===============================================

-- Fly
local flying = false
local flyBV, flyBG, bodyGyro

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
local origBrightness, origClockTime
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
local origFogEnd, origFogStart
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
    billboard.Name = "ADHIHUB_ESP"
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
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
local origMaxHealth, origHealth
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
    if not player.Character then return end
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
        if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
            tool.Handle.Size = enabled and Vector3.new(2, 2, 40) or Vector3.new(2, 2, 1)
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

-- ===============================================
-- ADV: AIMBOT
-- ===============================================

local aimbotHolding = false

local function getClosestPlayerToMouse()
    local closest = nil
    local closestDist = aimbotFOV.Get()
    local mousePos = UserInputService:GetMouseLocation()
    local viewportSize = camera.ViewportSize

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local head = p.Character.Head
            local screenPos, onScreen = camera:WorldToScreenPoint(head.Position)
            if onScreen then
                local dx = mousePos.X - screenPos.X
                local dy = mousePos.Y - screenPos.Y
                local dist = math.sqrt(dx * dx + dy * dy)
                if dist < closestDist then
                    closestDist = dist
                    closest = p
                end
            end
        end
    end
    return closest
end

aimbotToggle:SetCallback(function(enabled)
    fovCircle.Visible = enabled
    if enabled then
        local diameter = aimbotFOV.Get() * 2
        fovCircle.Size = UDim2.new(0, diameter, 0, diameter)
    end
end)

aimbotFOV.Set = function(v)
    local diameter = v * 2
    fovCircle.Size = UDim2.new(0, diameter, 0, diameter)
end

RunService.RenderStepped:Connect(function()
    if aimbotHolding and aimbotToggle.Get() then
        local target = getClosestPlayerToMouse()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local headPos = target.Character.Head.Position
            local camCF = camera.CFrame
            local smooth = aimbotSmooth.Get()
            local targetCF = CFrame.new(camCF.Position, headPos)
            camera.CFrame = camCF:Lerp(targetCF, 1 / smooth)
        end
    end
end)

-- ===============================================
-- ADV: FREE CAM (Spy Cam)
-- ===============================================

local freeCamActive = false
local freeCamSpeed = 80
local freeCamConn = nil
local savedCameraType = nil
local savedCameraCF = nil
local savedCameraFocus = nil

local function startFreeCam()
    if freeCamActive then return end
    freeCamActive = true
    savedCameraType = camera.CameraType
    savedCameraCF = camera.CFrame
    savedCameraFocus = camera.Focus
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = savedCameraCF

    freeCamConn = RunService.RenderStepped:Connect(function()
        if not freeCamActive then return end
        local camCF = camera.CFrame
        local moveDir = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        if moveDir.Magnitude > 0 then
            camera.CFrame = camera.CFrame + (moveDir.Unit * freeCamSpeed * task.wait())
        end
    end)
end

local function stopFreeCam()
    if not freeCamActive then return end
    freeCamActive = false
    if freeCamConn then freeCamConn:Disconnect() freeCamConn = nil end
    camera.CameraType = savedCameraType or Enum.CameraType.Custom
    if savedCameraCF then camera.CFrame = savedCameraCF end
    if savedCameraFocus then camera.Focus = savedCameraFocus end
end

freeCamToggle:SetCallback(function(enabled)
    if enabled then startFreeCam() else stopFreeCam() end
end)

-- ===============================================
-- ADV: ANTI-KICK / ANTI-ADMIN
-- ===============================================

local antiKickConnections = {}

local function hookKickProtection()
    local mt = getmetatable(player)
    if mt and mt.__index then
        local oldKick = mt.__index.Kick
        if oldKick then
            mt.__index.Kick = function(self, ...)
                if antiKickToggle.Get() then
                    warn("[ADHIHUB] Kick blocked!")
                    return
                end
                return oldKick(self, ...)
            end
        end
    end

    pcall(function()
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            if antiKickToggle.Get() then
                local method = getnamecallmethod()
                if method == "Kick" and self == player then
                    warn("[ADHIHUB] Kick blocked via namecall!")
                    return
                end
            end
            return oldNamecall(self, ...)
        end)
    end)
end

pcall(hookKickProtection)

player.CharacterAdded:Connect(function(char)
    if not antiKickToggle.Get() then return end
    task.wait(1)
    for _, conn in ipairs(antiKickConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    antiKickConnections = {}

    local c = char.DescendantAdded:Connect(function(desc)
        if not antiKickToggle.Get() then return end
        if desc:IsA("Script") or desc:IsA("LocalScript") then
            local n = desc.Name:lower()
            if n:find("kick") or n:find("ban") or n:find("admin") or n:find("punish") or n:find("delete") then
                desc.Disabled = true
                warn("[ADHIHUB] Suspicious script blocked: " .. desc.Name)
            end
        end
    end)
    table.insert(antiKickConnections, c)
end)

antiKickToggle:SetCallback(function(enabled)
    if enabled then
        warn("[ADHIHUB] Anti-Kick: ENABLED")
    else
        warn("[ADHIHUB] Anti-Kick: DISABLED")
        for _, conn in ipairs(antiKickConnections) do
            if conn.Connected then conn:Disconnect() end
        end
        antiKickConnections = {}
    end
end)

-- ===============================================
-- ADV: HITBOX EXPANDER
-- ===============================================

local hitboxConnections = {}

local function expandHitboxes()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            hrp.Size = Vector3.new(20, 20, 20)
            hrp.Transparency = 0.7
            hrp.BrickColor = BrickColor.new("Really red")
            hrp.Material = Enum.Material.ForceField
        end
    end
end

local function resetHitboxes()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            hrp.Size = Vector3.new(2, 2, 1)
            hrp.Transparency = 1
        end
    end
end

hitboxToggle:SetCallback(function(enabled)
    if enabled then
        expandHitboxes()
        for _, conn in ipairs(hitboxConnections) do
            if conn.Connected then conn:Disconnect() end
        end
        hitboxConnections = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                local c = p.CharacterAdded:Connect(function(char)
                    task.wait(0.5)
                    if hitboxToggle.Get() then expandHitboxes() end
                end)
                table.insert(hitboxConnections, c)
            end
        end
        Players.PlayerAdded:Connect(function(p)
            if hitboxToggle.Get() then
                local c = p.CharacterAdded:Connect(function(char)
                    task.wait(0.5)
                    if hitboxToggle.Get() then expandHitboxes() end
                end)
                table.insert(hitboxConnections, c)
            end
        end)
    else
        resetHitboxes()
        for _, conn in ipairs(hitboxConnections) do
            if conn.Connected then conn:Disconnect() end
        end
        hitboxConnections = {}
    end
end)

-- ===============================================
-- INPUT HANDLER
-- ===============================================

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
    elseif input.KeyCode == Enum.KeyCode.C then
        freeCamToggle.Set(not freeCamToggle.Get())
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHolding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHolding = false
    end
end)

-- ===============================================
-- AUTO RECONNECT
-- ===============================================

player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flying then startFly() end
end)

-- ===============================================
-- INIT - Show Fly tab by default
-- ===============================================

for name, data in pairs(TabButtons) do
    if name == "Fly" then
        smoothTw(data.Button, { BackgroundTransparency = 0 })
        data.Button.TextColor3 = Theme.Text
        smoothTw(data.Indicator, { BackgroundTransparency = 0 })
        TabPages[name].Visible = true
        ActiveTab = name
    end
end

-- Entrance animation
MainFrame.Position = UDim2.new(0.5, -220, 0.5, -200)
MainFrame.GroupTransparency = 1
smoothTw(MainFrame, { GroupTransparency = 0 })
bounceTw(MainFrame, { Position = UDim2.new(0.5, -220, 0.5, -250) })

print("===================================")
print("  ADHIHUB v1.1 - Loaded!")
print("  Toggle GUI: Right Control")
print("  Fly: E | Noclip: N | InfJump: V")
print("  Free Cam: C | Aimbot: Hold RMB")
print("===================================")