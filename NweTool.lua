-- ADHIHUB v1.2 - Premium Dark Theme
-- Toggle: RightControl | Fly: E | Noclip: N | InfJump: V | FreeCam: C

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- =============================================
-- CLEANUP OLD
-- =============================================
local old = game:GetService("CoreGui"):FindFirstChild("ADHIHUB")
if old then old:Destroy() end

-- =============================================
-- THEME - ALL DARK, NO WHITE ANYWHERE
-- =============================================
local C = {
    BG        = Color3.fromRGB(8, 8, 14),
    Card      = Color3.fromRGB(14, 14, 22),
    Panel     = Color3.fromRGB(18, 18, 28),
    Surface   = Color3.fromRGB(22, 22, 34),
    Border    = Color3.fromRGB(30, 30, 44),
    Accent    = Color3.fromRGB(80, 120, 255),
    Accent2   = Color3.fromRGB(100, 145, 255),
    Red       = Color3.fromRGB(220, 50, 60),
    Orange    = Color3.fromRGB(230, 140, 40),
    Green     = Color3.fromRGB(60, 200, 110),
    Purple    = Color3.fromRGB(140, 90, 230),
    Teal      = Color3.fromRGB(50, 190, 180),
    Text      = Color3.fromRGB(200, 200, 215),
    Dim       = Color3.fromRGB(90, 90, 115),
    Muted     = Color3.fromRGB(55, 55, 75),
    ToggleOn  = Color3.fromRGB(60, 190, 105),
    ToggleOff = Color3.fromRGB(30, 30, 45),
}

-- =============================================
-- SCREEN GUI
-- =============================================
local SG = Instance.new("ScreenGui")
SG.Name = "ADHIHUB"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.Parent = game:GetService("CoreGui")

-- =============================================
-- HELPERS
-- =============================================
local function make(cls, props)
    local i = Instance.new(cls)
    for k, v in pairs(props) do
        if k ~= "Parent" then i[k] = v end
    end
    if props.Parent then i.Parent = props.Parent end
    return i
end

local function corner(p, r)
    return make("UICorner", { CornerRadius = UDim.new(0, r), Parent = p })
end

local function stroke(p, col, t, tr)
    local s = make("UIStroke", { Color = col, Thickness = t or 1, Transparency = tr or 0, Parent = p })
    return s
end

local function tween(obj, props, dur)
    local t = TweenService:Create(obj, TweenInfo.new(dur or 0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function quick(obj, props)
    return tween(obj, props, 0.12)
end

local function smooth(obj, props)
    return tween(obj, props, 0.3)
end

local function pop(obj, props)
    return tween(obj, props, 0.25, Enum.EasingStyle.Back)
end

-- =============================================
-- MAIN WINDOW
-- =============================================
local Main = make("Frame", {
    Name = "ADHIHUB_Main",
    Size = UDim2.new(0, 430, 0, 490),
    Position = UDim2.new(0.5, -215, 0.5, -245),
    BackgroundColor3 = C.BG,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true,
    ClipsDescendants = true,
    Parent = SG,
})
corner(Main, 12)
stroke(Main, C.Border, 1, 0.4)

-- =============================================
-- MINIMIZED BUTTON
-- =============================================
local MiniBtn = make("TextButton", {
    Size = UDim2.new(0, 120, 0, 36),
    Position = UDim2.new(0, 10, 0, 10),
    BackgroundColor3 = C.Card,
    Text = "ADHIHUB",
    TextColor3 = C.Accent,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    Visible = false,
    AutoButtonColor = false,
    Parent = SG,
})
corner(MiniBtn, 10)
stroke(MiniBtn, C.Accent, 1, 0.4)
MiniBtn.MouseEnter:Connect(function()
    quick(MiniBtn, { BackgroundColor3 = C.Surface })
end)
MiniBtn.MouseLeave:Connect(function()
    quick(MiniBtn, { BackgroundColor3 = C.Card })
end)

local function minimizeGUI()
    pop(Main, { Position = UDim2.new(0.5, -215, 1, 20) })
    task.delay(0.25, function()
        Main.Visible = false
        MiniBtn.Visible = true
        MiniBtn.Position = UDim2.new(0, 10, 0, -50)
        smooth(MiniBtn, { Position = UDim2.new(0, 10, 0, 10) })
    end)
end

local function restoreGUI()
    MiniBtn.Visible = false
    Main.Position = UDim2.new(0.5, -215, 1, 20)
    Main.Visible = true
    pop(Main, { Position = UDim2.new(0.5, -215, 0.5, -245) })
end

MiniBtn.MouseButton1Click:Connect(restoreGUI)

-- =============================================
-- TITLE BAR
-- =============================================
local TitleBar = make("Frame", {
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = C.BG,
    BorderSizePixel = 0,
    Parent = Main,
})

make("Frame", {
    Size = UDim2.new(0, 3, 0, 16),
    Position = UDim2.new(0, 12, 0.5, -8),
    BackgroundColor3 = C.Accent,
    BorderSizePixel = 0,
    Parent = TitleBar,
})
corner(TitleBar, 3)

make("TextLabel", {
    Size = UDim2.new(0, 180, 1, 0),
    Position = UDim2.new(0, 22, 0, 0),
    BackgroundTransparency = 1,
    Text = "ADHIHUB",
    TextColor3 = C.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar,
})

local minBtn = make("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -66, 0, 7),
    BackgroundColor3 = C.Card,
    Text = "-",
    TextColor3 = C.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    AutoButtonColor = false,
    Parent = TitleBar,
})
corner(minBtn, 8)
stroke(minBtn, C.Border, 1, 0.3)
minBtn.MouseEnter:Connect(function() quick(minBtn, { BackgroundColor3 = C.Accent }) end)
minBtn.MouseLeave:Connect(function() quick(minBtn, { BackgroundColor3 = C.Card }) end)
minBtn.MouseButton1Click:Connect(minimizeGUI)

local closeBtn = make("TextButton", {
    Size = UDim2.new(0, 28, 0, 28),
    Position = UDim2.new(1, -32, 0, 7),
    BackgroundColor3 = C.Card,
    Text = "X",
    TextColor3 = C.Red,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    AutoButtonColor = false,
    Parent = TitleBar,
})
corner(closeBtn, 8)
stroke(closeBtn, C.Border, 1, 0.3)
closeBtn.MouseEnter:Connect(function() quick(closeBtn, { BackgroundColor3 = C.Red }) end)
closeBtn.MouseLeave:Connect(function() quick(closeBtn, { BackgroundColor3 = C.Card }) end)
closeBtn.MouseButton1Click:Connect(minimizeGUI)



-- =============================================
-- TAB BAR
-- =============================================
local TabBg = make("Frame", {
    Size = UDim2.new(1, -16, 0, 34),
    Position = UDim2.new(0, 8, 0, 46),
    BackgroundColor3 = C.Card,
    BorderSizePixel = 0,
    Parent = Main,
})
corner(TabBg, 8)

make("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    Padding = UDim.new(0, 3),
    Parent = TabBg,
})

local Tabs = {}
local Pages = {}
local Active = nil

local function addTab(name)
    local btn = make("TextButton", {
        Size = UDim2.new(0, 80, 0, 26),
        BackgroundColor3 = C.Card,
        Text = name,
        TextColor3 = C.Dim,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        AutoButtonColor = false,
        Parent = TabBg,
    })
    corner(btn, 6)

    local page = make("ScrollingFrame", {
        Size = UDim2.new(1, -12, 1, -100),
        Position = UDim2.new(0, 6, 0, 86),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = C.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = Main,
    })
    make("UIListLayout", { Padding = UDim.new(0, 4), Parent = page })
    make("UIPadding", {
        PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2),
        Parent = page,
    })

    Tabs[name] = btn
    Pages[name] = page

    btn.MouseButton1Click:Connect(function()
        for n, b in pairs(Tabs) do
            quick(b, { BackgroundColor3 = C.Card })
            b.TextColor3 = C.Dim
            Pages[n].Visible = false
        end
        quick(btn, { BackgroundColor3 = C.Accent })
        btn.TextColor3 = C.Text
        page.Visible = true
        Active = name
    end)

    btn.MouseEnter:Connect(function()
        if Active ~= name then quick(btn, { BackgroundColor3 = C.Surface }) end
    end)
    btn.MouseLeave:Connect(function()
        if Active ~= name then quick(btn, { BackgroundColor3 = C.Card }) end
    end)

    return page
end

-- =============================================
-- UI WIDGETS
-- =============================================
local function section(parent, text)
    local s = make("Frame", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Parent = parent,
    })
    make("TextLabel", {
        Size = UDim2.new(0.6, 0, 1, 0),
        Position = UDim2.new(0, 4, 0, 0),
        BackgroundTransparency = 1,
        Text = string.upper(text),
        TextColor3 = C.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = s,
    })
    make("Frame", {
        Size = UDim2.new(0.4, 0, 0, 1),
        Position = UDim2.new(0.6, 4, 0.5, 0),
        BackgroundColor3 = C.Border,
        BorderSizePixel = 0,
        Parent = s,
    })
    return s
end

local function toggle(parent, text, default)
    local on = default or false
    local f = make("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = C.Panel,
        BorderSizePixel = 0,
        Parent = parent,
    })
    corner(f, 8)

    local accent = make("Frame", {
        Size = UDim2.new(0, 3, 0.5, 0),
        Position = UDim2.new(0, 0, 0.25, 0),
        BackgroundColor3 = C.Accent,
        Transparency = on and 0 or 1,
        BorderSizePixel = 0,
        Parent = f,
    })
    corner(accent, 2)

    make("TextLabel", {
        Size = UDim2.new(1, -58, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = C.Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = f,
    })

    local bg = make("Frame", {
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -52, 0.5, -10),
        BackgroundColor3 = on and C.ToggleOn or C.ToggleOff,
        BorderSizePixel = 0,
        Parent = f,
    })
    corner(bg, 10)

    local dot = make("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = on and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = on and C.Card or C.Dim,
        BorderSizePixel = 0,
        Parent = bg,
    })
    corner(dot, 8)

    local btn = make("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = f,
    })

    local cb = nil

    btn.MouseButton1Click:Connect(function()
        on = not on
        quick(bg, { BackgroundColor3 = on and C.ToggleOn or C.ToggleOff })
        pop(dot, {
            Position = on and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
            BackgroundColor3 = on and C.Card or C.Dim,
        })
        smooth(accent, { Transparency = on and 0 or 1 })
        if cb then cb(on) end
    end)

    return {
        Get = function() return on end,
        Set = function(v)
            on = v
            quick(bg, { BackgroundColor3 = v and C.ToggleOn or C.ToggleOff })
            pop(dot, {
                Position = v and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
                BackgroundColor3 = v and C.Card or C.Dim,
            })
            smooth(accent, { Transparency = v and 0 or 1 })
            if cb then cb(v) end
        end,
        OnChange = function(_, fn) cb = fn end,
    }
end

local function btn(parent, text, color, callback)
    local b = make("TextButton", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = color or C.Accent,
        BackgroundTransparency = 0.08,
        Text = text,
        TextColor3 = C.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        AutoButtonColor = false,
        Parent = parent,
    })
    corner(b, 8)
    b.MouseEnter:Connect(function() quick(b, { BackgroundTransparency = 0 }) end)
    b.MouseLeave:Connect(function() quick(b, { BackgroundTransparency = 0.08 }) end)
    b.MouseButton1Click:Connect(function()
        pop(b, { BackgroundTransparency = 0.25 })
        task.delay(0.1, function() smooth(b, { BackgroundTransparency = 0.08 }) end)
        if callback then callback() end
    end)
    return b
end

local function slider(parent, text, min, max, def, cb)
    local f = make("Frame", {
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = C.Panel,
        BorderSizePixel = 0,
        Parent = parent,
    })
    corner(f, 8)

    make("TextLabel", {
        Size = UDim2.new(0.6, 0, 0, 18),
        Position = UDim2.new(0, 10, 0, 4),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = C.Text,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = f,
    })

    local val = make("TextLabel", {
        Size = UDim2.new(0.35, 0, 0, 18),
        Position = UDim2.new(0.62, 0, 0, 4),
        BackgroundTransparency = 1,
        Text = tostring(def),
        TextColor3 = C.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = f,
    })

    local track = make("Frame", {
        Size = UDim2.new(1, -22, 0, 5),
        Position = UDim2.new(0, 11, 0, 30),
        BackgroundColor3 = C.ToggleOff,
        BorderSizePixel = 0,
        Parent = f,
    })
    corner(track, 3)

    local rel = (def - min) / (max - min)

    local fill = make("Frame", {
        Size = UDim2.new(rel, 0, 1, 0),
        BackgroundColor3 = C.Accent,
        BorderSizePixel = 0,
        Parent = track,
    })
    corner(fill, 3)

    local thumb = make("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(rel, -7, 0.5, -7),
        BackgroundColor3 = C.Accent2,
        BorderSizePixel = 0,
        Parent = track,
    })
    corner(thumb, 7)

    local cur = def
    local dragging = false

    local function update(px)
        local r = math.clamp((px - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local v = math.floor(min + (max - min) * r)
        rel = r
        cur = v
        fill.Size = UDim2.new(r, 0, 1, 0)
        thumb.Position = UDim2.new(r, -7, 0.5, -7)
        val.Text = tostring(v)
        if cb then cb(v) end
    end

    local hit = make("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = track,
    })

    hit.MouseButton1Down:Connect(function()
        dragging = true
        update(UserInputService:GetMouseLocation().X)
        local conn
        conn = UserInputService.InputChanged:Connect(function(inp)
            if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
                update(inp.Position.X)
            end
        end)
        UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                if conn then conn:Disconnect() end
            end
        end)
    end)

    return {
        Get = function() return cur end,
        Set = function(v)
            cur = v
            rel = (v - min) / (max - min)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            thumb.Position = UDim2.new(rel, -7, 0.5, -7)
            val.Text = tostring(v)
            if cb then cb(v) end
        end,
    }
end

local function label(parent, text)
    return make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = "  " .. text,
        TextColor3 = C.Muted,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = parent,
    })
end

-- =============================================
-- ESP ELEMENTS (created early, referenced later)
-- =============================================
local espFolder = Instance.new("Folder")
espFolder.Name = "ADHIHUB_ESP"
espFolder.Parent = SG

local crosshairH = make("Frame", {
    Size = UDim2.new(0, 2, 0, 18),
    Position = UDim2.new(0.5, -1, 0.5, -9),
    BackgroundColor3 = C.Text,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 50,
    Parent = SG,
})

local crosshairV = make("Frame", {
    Size = UDim2.new(0, 18, 0, 2),
    Position = UDim2.new(0.5, -9, 0.5, -1),
    BackgroundColor3 = C.Text,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 50,
    Parent = SG,
})

local fovCircle = make("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = C.Accent,
    BackgroundTransparency = 0.88,
    BorderSizePixel = 1,
    BorderColor3 = C.Accent,
    Visible = false,
    ZIndex = 49,
    Parent = SG,
})
corner(fovCircle, 9999)

-- =============================================
-- TAB: FLY
-- =============================================
local flyPage = addTab("Fly")

section(flyPage, "MOVEMENT")
local flyTgl = toggle(flyPage, "Fly", false)
local noclipTgl = toggle(flyPage, "Noclip", false)
local infJumpTgl = toggle(flyPage, "Infinite Jump (V)", false)
local clickTPTgl = toggle(flyPage, "Click TP (Mouse)", false)

section(flyPage, "FLY SETTINGS")
local flySpd = slider(flyPage, "Fly Speed", 1, 50, 16)
label(flyPage, "SPACE = Up  |  Q = Down")

-- =============================================
-- TAB: VISUAL
-- =============================================
local visPage = addTab("Visual")

section(visPage, "RENDERING")
local fullbrightTgl = toggle(visPage, "Fullbright", false)
local fogTgl = toggle(visPage, "Remove Fog", false)
local crosshairTgl = toggle(visPage, "Crosshair", false)

section(visPage, "PLAYERS")
local espTgl = toggle(visPage, "ESP (Player Names)", false)

-- =============================================
-- TAB: MISC
-- =============================================
local miscPage = addTab("Misc")

section(miscPage, "PLAYER")
local speedSld = slider(miscPage, "Walk Speed", 16, 300, 16, function(v)
    local ch = player.Character
    if ch and ch:FindFirstChild("Humanoid") then ch.Humanoid.WalkSpeed = v end
end)
local jumpSld = slider(miscPage, "Jump Power", 50, 300, 50, function(v)
    local ch = player.Character
    if ch and ch:FindFirstChild("Humanoid") then ch.Humanoid.JumpPower = v end
end)
btn(miscPage, "RESET PLAYER", C.Orange, function()
    speedSld.Set(16)
    jumpSld.Set(50)
end)

section(miscPage, "WORLD")
local gravSld = slider(miscPage, "Gravity", 0, 200, 196, function(v) workspace.Gravity = v end)
local fovSld = slider(miscPage, "FOV", 30, 120, 70, function(v) camera.FieldOfView = v end)
btn(miscPage, "RESET WORLD", C.Orange, function()
    gravSld.Set(196)
    fovSld.Set(70)
end)

section(miscPage, "EXTRAS")
local godTgl = toggle(miscPage, "God Mode", false)
local invisTgl = toggle(miscPage, "Invisible", false)
local flingTgl = toggle(miscPage, "Fling", false)
local reachTgl = toggle(miscPage, "Reach (20 studs)", false)
local spinTgl = toggle(miscPage, "Spin Bot", false)
local antiAFKTgl = toggle(miscPage, "Anti-AFK", false)
local autoCollTgl = toggle(miscPage, "Auto Collect", false)

btn(miscPage, "BRING ALL TOOLS", C.Accent, function()
    local ch = player.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    for _, o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Tool") and o:FindFirstChild("Handle") then
            o.Handle.CFrame = ch.HumanoidRootPart.CFrame
        end
    end
end)

btn(miscPage, "BTOOLS (Local)", C.Purple, function()
    local bp = player:FindFirstChildOfClass("Backpack")
    if bp then
        for _, n in ipairs({"Hammer", "Clone", "Delete"}) do
            local t = Instance.new("Tool")
            t.Name = n
            t.RequiresHandle = false
            t.Parent = bp
        end
    end
end)

section(miscPage, "SERVER")
local tpInput = make("TextBox", {
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = C.Card,
    BorderSizePixel = 0,
    Text = "",
    PlaceholderText = "Player name to TP...",
    PlaceholderColor3 = C.Muted,
    TextColor3 = C.Text,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    ClearTextOnFocus = false,
    Parent = miscPage,
})
corner(tpInput, 6)
stroke(tpInput, C.Border, 1, 0.5)

btn(miscPage, "TELEPORT TO PLAYER", C.Accent, function()
    local name = tpInput.Text
    if name == "" then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and (p.Name:lower():find(name:lower()) or p.DisplayName:lower():find(name:lower())) then
            local tc = p.Character
            local mc = player.Character
            if tc and tc:FindFirstChild("HumanoidRootPart") and mc and mc:FindFirstChild("HumanoidRootPart") then
                mc.HumanoidRootPart.CFrame = tc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            end
            break
        end
    end
end)

btn(miscPage, "REJOIN", C.Orange, function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

btn(miscPage, "SERVER HOP", C.Teal, function()
    pcall(function()
        local r = game:GetService("HttpService"):JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
        if r and r.data then
            for _, s in ipairs(r.data) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id, player)
                    break
                end
            end
        end
    end)
end)

section(miscPage, "DISPLAY")
btn(miscPage, "DESTROY GUI", C.Red, function() SG:Destroy() end)

-- =============================================
-- TAB: ADV
-- =============================================
local advPage = addTab("ADV")

section(advPage, "COMBAT")
local aimbotTgl = toggle(advPage, "Aimbot (Hold Right Click)", false)
local hitboxTgl = toggle(advPage, "Hitbox Expander (20x)", false)

section(advPage, "AIMBOT SETTINGS")
local aimFovSld = slider(advPage, "FOV Radius", 30, 500, 120)
local aimSmoothSld = slider(advPage, "Smoothness", 1, 20, 5)
label(advPage, "Hold RIGHT CLICK to aim")

section(advPage, "UTILITIES")
local freeCamTgl = toggle(advPage, "Free Cam (Spy Cam)", false)
local antiKickTgl = toggle(advPage, "Anti-Kick / Anti-Ban", false)
label(advPage, "Free Cam: WASD | Q down | Space up")

-- =============================================
-- FEATURE: FLY
-- =============================================
local flying = false
local flyBV, flyBG

local function startFly()
    local ch = player.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    flying = true
    local hrp = ch.HumanoidRootPart
    local hum = ch:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = true end
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = hrp
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    flyBG.P = 9000
    flyBG.D = 500
    flyBG.Parent = hrp
end

local function stopFly()
    flying = false
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local ch = player.Character
    if ch then
        local hum = ch:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end

flyTgl:OnChange(function(en)
    if en then startFly() else stopFly() end
end)

RunService.RenderStepped:Connect(function()
    if not flying then return end
    local ch = player.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local cf = camera.CFrame
    local spd = flySpd.Get()
    local v = Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then v = v + cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then v = v - cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then v = v - cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then v = v + cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then v = v + Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then v = v - Vector3.new(0, 1, 0) end
    if flyBV then flyBV.Velocity = v * spd end
    if flyBG then flyBG.CFrame = cf end
end)

-- =============================================
-- FEATURE: NOCLIP
-- =============================================
local noclipConn = nil
noclipTgl:OnChange(function(en)
    if en then
        noclipConn = RunService.Stepped:Connect(function()
            local ch = player.Character
            if ch then
                for _, p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    end
end)

-- =============================================
-- FEATURE: INFINITE JUMP
-- =============================================
UserInputService.JumpRequest:Connect(function()
    if infJumpTgl.Get() then
        local ch = player.Character
        if ch and ch:FindFirstChild("Humanoid") then
            ch.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- =============================================
-- FEATURE: CLICK TP
-- =============================================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and clickTPTgl.Get() then
        local ch = player.Character
        if ch and ch:FindFirstChild("HumanoidRootPart") then
            local mouse = player:GetMouse()
            if mouse and mouse.Hit then
                ch.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end
    end
end)

-- =============================================
-- FEATURE: FULLBRIGHT
-- =============================================
local origBright, origClock
fullbrightTgl:OnChange(function(en)
    if en then
        origBright = Lighting.Brightness
        origClock = Lighting.ClockTime
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = origBright or 1
        Lighting.ClockTime = origClock or 12
        Lighting.GlobalShadows = true
    end
end)

-- =============================================
-- FEATURE: REMOVE FOG
-- =============================================
local origFogEnd, origFogStart
fogTgl:OnChange(function(en)
    if en then
        origFogEnd = Lighting.FogEnd
        origFogStart = Lighting.FogStart
        Lighting.FogEnd = 1000000
        Lighting.FogStart = 0
    else
        Lighting.FogEnd = origFogEnd or 100000
        Lighting.FogStart = origFogStart or 0
    end
end)

-- =============================================
-- FEATURE: CROSSHAIR
-- =============================================
crosshairTgl:OnChange(function(en)
    crosshairH.Visible = en
    crosshairV.Visible = en
end)

-- =============================================
-- FEATURE: ESP
-- =============================================
local function addESP(target)
    if target == player then return end
    local bb = Instance.new("BillboardGui")
    bb.Name = "ADHIHUB_ESP"
    bb.Size = UDim2.new(0, 100, 0, 28)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = espFolder
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = target.Name
    lbl.TextColor3 = Color3.fromRGB(255, 60, 70)
    lbl.TextStrokeTransparency = 0
    lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.Parent = bb
    local function onChar(char)
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if hrp then bb.Adornee = hrp end
    end
    if target.Character then onChar(target.Character) end
    target.CharacterAdded:Connect(onChar)
end

espTgl:OnChange(function(en)
    if en then
        for _, p in ipairs(Players:GetPlayers()) do addESP(p) end
        Players.PlayerAdded:Connect(function(p)
            if espTgl.Get() then addESP(p) end
        end)
    else
        for _, c in ipairs(espFolder:GetChildren()) do c:Destroy() end
    end
end)

-- =============================================
-- FEATURE: GOD MODE
-- =============================================
local origMaxHP, origHP
godTgl:OnChange(function(en)
    local ch = player.Character
    if not ch or not ch:FindFirstChild("Humanoid") then return end
    if en then
        origMaxHP = ch.Humanoid.MaxHealth
        origHP = ch.Humanoid.Health
        ch.Humanoid.MaxHealth = 1e9
        ch.Humanoid.Health = 1e9
    else
        ch.Humanoid.MaxHealth = origMaxHP or 100
        ch.Humanoid.Health = origHP or 100
    end
end)

-- =============================================
-- FEATURE: INVISIBLE (FIXED - handles ALL parts)
-- =============================================
local invisConn = nil

local function setAllTransparency(char, val)
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Transparency = val
        elseif obj:IsA("Decal") then
            obj.Transparency = val
        elseif obj:IsA("SurfaceGui") then
            obj.Enabled = val ~= 0
        elseif obj:IsA("BillboardGui") then
            obj.Enabled = val ~= 0
        elseif obj:IsA("ParticleEmitter") then
            obj.Enabled = val ~= 0
        elseif obj:IsA("Trail") then
            obj.Enabled = val ~= 0
        end
    end
end

invisTgl:OnChange(function(en)
    local ch = player.Character
    if not ch then return end
    if en then
        invisConn = RunService.RenderStepped:Connect(function()
            local c = player.Character
            if not c then return end
            setAllTransparency(c, 1)
        end)
    else
        if invisConn then invisConn:Disconnect() invisConn = nil end
        setAllTransparency(ch, 0)
    end
end)

-- =============================================
-- FEATURE: FLING
-- =============================================
local flingConns = {}

local function startFling()
    local ch = player.Character
    if not ch then return end
    for _, part in ipairs(ch:GetDescendants()) do
        if part:IsA("BasePart") then
            local c = part.Touched:Connect(function(hit)
                if not flingTgl.Get() then return end
                if not hit or not hit.Parent then return end
                local hc = hit.Parent
                if hc == ch then return end
                local hh = hc:FindFirstChildOfClass("Humanoid")
                if not hh or hh.Health <= 0 then return end
                local hr = hc:FindFirstChild("HumanoidRootPart")
                local mr = ch:FindFirstChild("HumanoidRootPart")
                if not hr or not mr then return end
                local dir = (hr.Position - mr.Position).Unit
                hr.Velocity = dir * 200 + Vector3.new(0, 100, 0)
                hr.RotVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
            end)
            table.insert(flingConns, c)
        end
    end
end

local function stopFling()
    for _, c in ipairs(flingConns) do
        if c.Connected then c:Disconnect() end
    end
    flingConns = {}
end

flingTgl:OnChange(function(en)
    if en then startFling() else stopFling() end
end)

-- =============================================
-- FEATURE: REACH
-- =============================================
reachTgl:OnChange(function(en)
    local ch = player.Character
    if not ch then return end
    for _, tool in ipairs(ch:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
            tool.Handle.Size = en and Vector3.new(2, 2, 40) or Vector3.new(2, 2, 1)
        end
    end
end)

player.Backpack.ChildAdded:Connect(function(tool)
    if reachTgl.Get() and tool:IsA("Tool") and tool:FindFirstChild("Handle") then
        tool.Handle.Size = Vector3.new(2, 2, 40)
    end
end)

-- =============================================
-- FEATURE: SPIN BOT
-- =============================================
local spinAngle = 0
RunService.RenderStepped:Connect(function()
    if not spinTgl.Get() then return end
    local ch = player.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        spinAngle = spinAngle + 3
        if spinAngle >= 360 then spinAngle = 0 end
        local cf = ch.HumanoidRootPart.CFrame
        ch.HumanoidRootPart.CFrame = CFrame.new(cf.Position) * CFrame.Angles(0, math.rad(spinAngle), 0) * (cf - cf.Position)
    end
end)

-- =============================================
-- FEATURE: ANTI-AFK
-- =============================================
local VirtualUser = game:GetService("VirtualUser")
player.Idled:Connect(function()
    if antiAFKTgl.Get() then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- =============================================
-- FEATURE: AUTO COLLECT
-- =============================================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not autoCollTgl.Get() then return end
            local ch = player.Character
            if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
            local pos = ch.HumanoidRootPart.Position
            for _, o in ipairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") and (o.Position - pos).Magnitude < 50 then
                    local n = o.Name:lower()
                    if o:FindFirstChildOfClass("TouchInterest") or n:find("coin") or n:find("gem") or n:find("orb") or n:find("pickup") then
                        o.CFrame = CFrame.new(pos)
                    end
                end
            end
        end)
    end
end)

-- =============================================
-- ADV: AIMBOT
-- =============================================
local aimHolding = false

local function getClosestPlayer()
    local best = nil
    local bestDist = aimFovSld.Get()
    local mouse = UserInputService:GetMouseLocation()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local sp, onScr = camera:WorldToScreenPoint(p.Character.Head.Position)
            if onScr then
                local d = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(sp.X, sp.Y)).Magnitude
                if d < bestDist then
                    bestDist = d
                    best = p
                end
            end
        end
    end
    return best
end

aimbotTgl:OnChange(function(en)
    fovCircle.Visible = en
    if en then
        local d = aimFovSld.Get() * 2
        fovCircle.Size = UDim2.new(0, d, 0, d)
    end
end)

aimFovSld:OnChange(function(v)
    local d = v * 2
    fovCircle.Size = UDim2.new(0, d, 0, d)
end)

RunService.RenderStepped:Connect(function()
    if not aimHolding or not aimbotTgl.Get() then return end
    local target = getClosestPlayer()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local headPos = target.Character.Head.Position
        local cf = camera.CFrame
        local sm = aimSmoothSld.Get()
        camera.CFrame = cf:Lerp(CFrame.new(cf.Position, headPos), 1 / sm)
    end
end)

-- =============================================
-- ADV: FREE CAM
-- =============================================
local freeCamOn = false
local freeCamConn = nil
local savedCamType, savedCamCF

local function startFreeCam()
    if freeCamOn then return end
    freeCamOn = true
    savedCamType = camera.CameraType
    savedCamCF = camera.CFrame
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = savedCamCF

    freeCamConn = RunService.RenderStepped:Connect(function()
        if not freeCamOn then return end
        local cf = camera.CFrame
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then dir = dir - Vector3.new(0, 1, 0) end
        if dir.Magnitude > 0 then
            local dt = task.wait()
            camera.CFrame = camera.CFrame + (dir.Unit * 80 * dt)
        else
            task.wait()
        end
    end)
end

local function stopFreeCam()
    if not freeCamOn then return end
    freeCamOn = false
    if freeCamConn then freeCamConn:Disconnect() freeCamConn = nil end
    camera.CameraType = savedCamType or Enum.CameraType.Custom
    if savedCamCF then camera.CFrame = savedCamCF end
end

freeCamTgl:OnChange(function(en)
    if en then startFreeCam() else stopFreeCam() end
end)

-- =============================================
-- ADV: ANTI-KICK / ANTI-BAN (IMPROVED)
-- =============================================
local antiKickEnabled = false
local blockedScripts = {}

antiKickTgl:OnChange(function(en)
    antiKickEnabled = en
    if en then
        warn("[ADHIHUB] Anti-Kick: ENABLED")
    else
        warn("[ADHIHUB] Anti-Kick: DISABLED")
    end
end)

-- Method 1: Hook player.Kick via metatable
pcall(function()
    local mt = getmetatable(player)
    if mt and mt.__index then
        local oldKick = mt.__index.Kick
        if oldKick then
            mt.__index.Kick = function(self, ...)
                if self == player and antiKickEnabled then
                    warn("[ADHIHUB] Kick blocked!")
                    return nil
                end
                return oldKick(self, ...)
            end
        end
    end
end)

-- Method 2: Hook __namecall metamethod
pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if antiKickEnabled then
            if method == "Kick" and self == player then
                warn("[ADHIHUB] Kick blocked via namecall!")
                return nil
            end
            if method == "Shutdown" then
                warn("[ADHIHUB] Shutdown blocked!")
                return nil
            end
        end
        return oldNamecall(self, ...)
    end)
end)

-- Method 3: Hook __index to block Kick reads
pcall(function()
    local oldIndex
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if antiKickEnabled and self == player and key == "Kick" then
            return function() warn("[ADHIHUB] Kick blocked via index!") end
        end
        return oldIndex(self, key)
    end)
end)

-- Method 4: Block suspicious scripts from running
local function blockBadScripts(char)
    if not antiKickEnabled then return end
    task.wait(1)
    for _, desc in ipairs(char:GetDescendants()) do
        if desc:IsA("BaseScript") then
            local n = desc.Name:lower()
            local blocked = false
            for _, kw in ipairs({"kick", "ban", "admin", "punish", "delete", "freeze", "jail", " arrest"}) do
                if n:find(kw) then blocked = true break end
            end
            if not blocked and desc:IsA("LocalScript") then
                local src = ""
                pcall(function() src = desc.Source:lower() end)
                for _, kw in ipairs({"player:kick", "player.kick", ":kick(", ".kick(", "game:shutdown", "shutdown"}) do
                    if src:find(kw) then blocked = true break end
                end
            end
            if blocked then
                desc.Disabled = true
                desc:Destroy()
                warn("[ADHIHUB] Blocked script: " .. desc.Name)
            end
        end
    end
end

player.CharacterAdded:Connect(function(char)
    if antiKickEnabled then
        blockBadScripts(char)
        char.DescendantAdded:Connect(function(desc)
            if not antiKickEnabled then return end
            if desc:IsA("BaseScript") then
                local n = desc.Name:lower()
                for _, kw in ipairs({"kick", "ban", "admin", "punish", "delete"}) do
                    if n:find(kw) then
                        task.delay(0.1, function()
                            pcall(function()
                                desc.Disabled = true
                                desc:Destroy()
                            end)
                        end)
                        warn("[ADHIHUB] Blocked script: " .. desc.Name)
                        return
                    end
                end
            end
        end)
    end
end)

-- =============================================
-- ADV: HITBOX EXPANDER
-- =============================================
local hitboxConns = {}

local function expandAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            hrp.Size = Vector3.new(20, 20, 20)
            hrp.Transparency = 0.6
            hrp.BrickColor = BrickColor.new("Really red")
            hrp.Material = Enum.Material.ForceField
            hrp.CanCollide = false
        end
    end
end

local function resetAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            hrp.Size = Vector3.new(2, 2, 1)
            hrp.Transparency = 1
        end
    end
end

hitboxTgl:OnChange(function(en)
    if en then
        expandAll()
        for _, c in ipairs(hitboxConns) do if c.Connected then c:Disconnect() end end
        hitboxConns = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                table.insert(hitboxConns, p.CharacterAdded:Connect(function()
                    task.wait(0.5)
                    if hitboxTgl.Get() then expandAll() end
                end))
            end
        end
        Players.PlayerAdded:Connect(function(p)
            if hitboxTgl.Get() then
                table.insert(hitboxConns, p.CharacterAdded:Connect(function()
                    task.wait(0.5)
                    if hitboxTgl.Get() then expandAll() end
                end))
            end
        end)
    else
        resetAll()
        for _, c in ipairs(hitboxConns) do if c.Connected then c:Disconnect() end end
        hitboxConns = {}
    end
end)

-- =============================================
-- INPUT HANDLER
-- =============================================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if Main.Visible then minimizeGUI() else restoreGUI() end
    elseif input.KeyCode == Enum.KeyCode.E then
        if flying then stopFly() else startFly() end
    elseif input.KeyCode == Enum.KeyCode.N then
        noclipTgl.Set(not noclipTgl.Get())
    elseif input.KeyCode == Enum.KeyCode.V then
        infJumpTgl.Set(not infJumpTgl.Get())
    elseif input.KeyCode == Enum.KeyCode.C then
        freeCamTgl.Set(not freeCamTgl.Get())
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimHolding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimHolding = false
    end
end)

-- =============================================
-- AUTO RECONNECT FLY ON RESPAWN
-- =============================================
player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flying then startFly() end
end)

-- =============================================
-- INIT: Show Fly tab by default
-- =============================================
quick(Tabs["Fly"], { BackgroundColor3 = C.Accent })
Tabs["Fly"].TextColor3 = C.Text
Pages["Fly"].Visible = true
Active = "Fly"

-- Entrance animation
Main.Position = UDim2.new(0.5, -215, 0.5, -200)
smooth(Main, { Position = UDim2.new(0.5, -215, 0.5, -245) })

print("===================================")
print("  ADHIHUB v1.2 - Loaded!")
print("  Toggle GUI: RightControl")
print("  Fly: E | Noclip: N | InfJump: V")
print("  Free Cam: C | Aimbot: Hold RMB")
print("===================================")
