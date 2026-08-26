-- ADHIHUB v1.3
-- Toggle: RightControl | Fly: E | Noclip: N | InfJump: V | FreeCam: C

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local old = game:GetService("CoreGui"):FindFirstChild("ADHIHUB")
if old then old:Destroy() end

-- THEME
local C = {
    BG       = Color3.fromRGB(10, 10, 16),
    Card     = Color3.fromRGB(16, 16, 24),
    Panel    = Color3.fromRGB(20, 20, 30),
    Surface  = Color3.fromRGB(26, 26, 38),
    Border   = Color3.fromRGB(34, 34, 50),
    Accent   = Color3.fromRGB(80, 120, 255),
    Accent2  = Color3.fromRGB(100, 150, 255),
    Red      = Color3.fromRGB(220, 55, 65),
    Orange   = Color3.fromRGB(230, 140, 40),
    Green    = Color3.fromRGB(55, 200, 110),
    Purple   = Color3.fromRGB(140, 90, 230),
    Teal     = Color3.fromRGB(50, 190, 180),
    Text     = Color3.fromRGB(200, 200, 215),
    Dim      = Color3.fromRGB(100, 100, 125),
    Muted    = Color3.fromRGB(55, 55, 75),
    On       = Color3.fromRGB(55, 190, 105),
    Off      = Color3.fromRGB(32, 32, 48),
}

-- SCREEN GUI
local SG = Instance.new("ScreenGui")
SG.Name = "ADHIHUB"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.Parent = game:GetService("CoreGui")

-- HELPERS
local function mk(cls, p)
    local i = Instance.new(cls)
    for k, v in pairs(p) do
        if k ~= "Parent" then i[k] = v end
    end
    if p.Parent then i.Parent = p.Parent end
    return i
end

local function crn(p, r) return mk("UICorner", {CornerRadius = UDim.new(0, r), Parent = p}) end
local function str(p, col, t, tr) return mk("UIStroke", {Color = col, Thickness = t or 1, Transparency = tr or 0, Parent = p}) end

local function tw(o, props, d, style, dir)
    local t = TweenService:Create(o, TweenInfo.new(d or 0.2, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
    t:Play()
    return t
end
local function qtw(o, p) return tw(o, p, 0.1) end
local function stw(o, p) return tw(o, p, 0.3) end
local function btw(o, p) return tw(o, p, 0.25) end

-- MAIN WINDOW
local Main = mk("Frame", {
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
crn(Main, 12)
str(Main, C.Border, 1, 0.4)

-- MINIMIZED FLOATING BUTTON
local MiniBtn = mk("TextButton", {
    Size = UDim2.new(0, 130, 0, 40),
    Position = UDim2.new(0, 12, 0, 12),
    BackgroundColor3 = C.Card,
    Text = "  ADHIHUB",
    TextColor3 = C.Accent,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
    Visible = false,
    AutoButtonColor = false,
    Parent = SG,
})
crn(MiniBtn, 10)
str(MiniBtn, C.Accent, 1, 0.3)
MiniBtn.MouseEnter:Connect(function()
    qtw(MiniBtn, {BackgroundColor3 = C.Surface})
    qtw(MiniBtn, {TextColor3 = C.Accent2})
end)
MiniBtn.MouseLeave:Connect(function()
    qtw(MiniBtn, {BackgroundColor3 = C.Card})
    qtw(MiniBtn, {TextColor3 = C.Accent})
end)

local function minimizeGUI()
    stw(Main, {Position = UDim2.new(0.5, -215, 1, 30)})
    task.delay(0.3, function()
        Main.Visible = false
        MiniBtn.Position = UDim2.new(0, 12, 0, -50)
        MiniBtn.Visible = true
        stw(MiniBtn, {Position = UDim2.new(0, 12, 0, 12)})
    end)
end

local function restoreGUI()
    MiniBtn.Visible = false
    Main.Position = UDim2.new(0.5, -215, 1, 30)
    Main.Visible = true
    btw(Main, {Position = UDim2.new(0.5, -215, 0.5, -245)})
end

MiniBtn.MouseButton1Click:Connect(restoreGUI)

-- TITLE BAR
local TitleBar = mk("Frame", {
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = C.BG,
    BorderSizePixel = 0,
    Parent = Main,
})
crn(TitleBar, 3)

-- Blue accent bar on left
mk("Frame", {
    Size = UDim2.new(0, 3, 0, 16),
    Position = UDim2.new(0, 12, 0.5, -8),
    BackgroundColor3 = C.Accent,
    BorderSizePixel = 0,
    Parent = TitleBar,
})

mk("TextLabel", {
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

-- Minimize button
local minBtn = mk("TextButton", {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -70, 0, 6),
    BackgroundColor3 = C.Surface,
    Text = "-",
    TextColor3 = C.Text,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    AutoButtonColor = false,
    Parent = TitleBar,
})
crn(minBtn, 8)
str(minBtn, C.Border, 1, 0.3)
minBtn.MouseEnter:Connect(function()
    qtw(minBtn, {BackgroundColor3 = C.Accent})
    qtw(minBtn, {TextColor3 = C.BG})
end)
minBtn.MouseLeave:Connect(function()
    qtw(minBtn, {BackgroundColor3 = C.Surface})
    qtw(minBtn, {TextColor3 = C.Text})
end)
minBtn.MouseButton1Click:Connect(minimizeGUI)

-- Close button
local closeBtn = mk("TextButton", {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -36, 0, 6),
    BackgroundColor3 = C.Surface,
    Text = "X",
    TextColor3 = C.Red,
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    AutoButtonColor = false,
    Parent = TitleBar,
})
crn(closeBtn, 8)
str(closeBtn, C.Border, 1, 0.3)
closeBtn.MouseEnter:Connect(function()
    qtw(closeBtn, {BackgroundColor3 = C.Red})
    qtw(closeBtn, {TextColor3 = C.BG})
end)
closeBtn.MouseLeave:Connect(function()
    qtw(closeBtn, {BackgroundColor3 = C.Surface})
    qtw(closeBtn, {TextColor3 = C.Red})
end)
closeBtn.MouseButton1Click:Connect(minimizeGUI)

-- TAB BAR
local TabBg = mk("Frame", {
    Size = UDim2.new(1, -16, 0, 34),
    Position = UDim2.new(0, 8, 0, 48),
    BackgroundColor3 = C.Card,
    BorderSizePixel = 0,
    Parent = Main,
})
crn(TabBg, 8)

mk("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    Padding = UDim.new(0, 4),
    Parent = TabBg,
})

local Tabs, Pages, Active = {}, {}, nil

local function addTab(name)
    local btn = mk("TextButton", {
        Size = UDim2.new(0, 82, 0, 26),
        BackgroundColor3 = C.Card,
        Text = name,
        TextColor3 = C.Dim,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        AutoButtonColor = false,
        Parent = TabBg,
    })
    crn(btn, 6)

    local page = mk("ScrollingFrame", {
        Size = UDim2.new(1, -12, 1, -102),
        Position = UDim2.new(0, 6, 0, 88),
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
    mk("UIListLayout", {Padding = UDim.new(0, 4), Parent = page})
    mk("UIPadding", {
        PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2),
        Parent = page,
    })

    Tabs[name] = btn
    Pages[name] = page

    btn.MouseButton1Click:Connect(function()
        for n, b in pairs(Tabs) do
            qtw(b, {BackgroundColor3 = C.Card})
            b.TextColor3 = C.Dim
            Pages[n].Visible = false
        end
        qtw(btn, {BackgroundColor3 = C.Accent})
        btn.TextColor3 = C.Text
        page.Visible = true
        Active = name
    end)
    btn.MouseEnter:Connect(function()
        if Active ~= name then qtw(btn, {BackgroundColor3 = C.Surface}) end
    end)
    btn.MouseLeave:Connect(function()
        if Active ~= name then qtw(btn, {BackgroundColor3 = C.Card}) end
    end)
    return page
end

-- WIDGETS
local function sec(p, t)
    local s = mk("Frame", {Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, Parent = p})
    mk("TextLabel", {
        Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0, 4, 0, 0),
        BackgroundTransparency = 1, Text = string.upper(t), TextColor3 = C.Accent,
        Font = Enum.Font.GothamBold, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, Parent = s,
    })
    mk("Frame", {
        Size = UDim2.new(0.4, 0, 0, 1), Position = UDim2.new(0.6, 4, 0.5, 0),
        BackgroundColor3 = C.Border, BorderSizePixel = 0, Parent = s,
    })
    return s
end

local function tog(p, t, def)
    local on = def or false
    local f = mk("Frame", {Size = UDim2.new(1, 0, 0, 36), BackgroundColor3 = C.Panel, BorderSizePixel = 0, Parent = p})
    crn(f, 8)
    local acc = mk("Frame", {
        Size = UDim2.new(0, 3, 0.5, 0), Position = UDim2.new(0, 0, 0.25, 0),
        BackgroundColor3 = C.Accent, Transparency = on and 0 or 1, BorderSizePixel = 0, Parent = f,
    })
    crn(acc, 2)
    mk("TextLabel", {
        Size = UDim2.new(1, -58, 1, 0), Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1, Text = t, TextColor3 = C.Text,
        Font = Enum.Font.Gotham, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = f,
    })
    local bg = mk("Frame", {
        Size = UDim2.new(0, 40, 0, 20), Position = UDim2.new(1, -52, 0.5, -10),
        BackgroundColor3 = on and C.On or C.Off, BorderSizePixel = 0, Parent = f,
    })
    crn(bg, 10)
    local dot = mk("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = on and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = on and C.Card or C.Dim, BorderSizePixel = 0, Parent = bg,
    })
    crn(dot, 8)
    local b = mk("TextButton", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "", AutoButtonColor = false, Parent = f,
    })
    local cb = nil
    b.MouseButton1Click:Connect(function()
        on = not on
        qtw(bg, {BackgroundColor3 = on and C.On or C.Off})
        btw(dot, {Position = on and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = on and C.Card or C.Dim})
        stw(acc, {Transparency = on and 0 or 1})
        if cb then cb(on) end
    end)
    return {
        Get = function() return on end,
        Set = function(v)
            on = v
            qtw(bg, {BackgroundColor3 = v and C.On or C.Off})
            btw(dot, {Position = v and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = v and C.Card or C.Dim})
            stw(acc, {Transparency = v and 0 or 1})
            if cb then cb(v) end
        end,
        OnChange = function(_, fn) cb = fn end,
    }
end

local function btrn(p, t, col, cb)
    local b = mk("TextButton", {
        Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = col or C.Accent,
        BackgroundTransparency = 0.08, Text = t, TextColor3 = C.Text,
        Font = Enum.Font.GothamBold, TextSize = 12, AutoButtonColor = false, Parent = p,
    })
    crn(b, 8)
    b.MouseEnter:Connect(function() qtw(b, {BackgroundTransparency = 0}) end)
    b.MouseLeave:Connect(function() qtw(b, {BackgroundTransparency = 0.08}) end)
    b.MouseButton1Click:Connect(function()
        btw(b, {BackgroundTransparency = 0.25})
        task.delay(0.1, function() stw(b, {BackgroundTransparency = 0.08}) end)
        if cb then cb() end
    end)
    return b
end

local function sldr(p, t, mn, mx, def, cb)
    local f = mk("Frame", {Size = UDim2.new(1, 0, 0, 48), BackgroundColor3 = C.Panel, BorderSizePixel = 0, Parent = p})
    crn(f, 8)
    mk("TextLabel", {
        Size = UDim2.new(0.6, 0, 0, 18), Position = UDim2.new(0, 10, 0, 4),
        BackgroundTransparency = 1, Text = t, TextColor3 = C.Text,
        Font = Enum.Font.Gotham, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = f,
    })
    local vl = mk("TextLabel", {
        Size = UDim2.new(0.35, 0, 0, 18), Position = UDim2.new(0.62, 0, 0, 4),
        BackgroundTransparency = 1, Text = tostring(def), TextColor3 = C.Accent,
        Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right, Parent = f,
    })
    local trk = mk("Frame", {
        Size = UDim2.new(1, -22, 0, 5), Position = UDim2.new(0, 11, 0, 30),
        BackgroundColor3 = C.Off, BorderSizePixel = 0, Parent = f,
    })
    crn(trk, 3)
    local rl = (def - mn) / (mx - mn)
    local fl = mk("Frame", {Size = UDim2.new(rl, 0, 1, 0), BackgroundColor3 = C.Accent, BorderSizePixel = 0, Parent = trk})
    crn(fl, 3)
    local th = mk("Frame", {
        Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(rl, -7, 0.5, -7),
        BackgroundColor3 = C.Accent2, BorderSizePixel = 0, Parent = trk,
    })
    crn(th, 7)
    local cur, drag = def, false
    local function upd(px)
        local r = math.clamp((px - trk.AbsolutePosition.X) / trk.AbsoluteSize.X, 0, 1)
        local v = math.floor(mn + (mx - mn) * r)
        rl, cur = r, v
        fl.Size = UDim2.new(r, 0, 1, 0)
        th.Position = UDim2.new(r, -7, 0.5, -7)
        vl.Text = tostring(v)
        if cb then cb(v) end
    end
    local ht = mk("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = trk})
    ht.MouseButton1Down:Connect(function()
        drag = true
        upd(UserInputService:GetMouseLocation().X)
        local cn
        cn = UserInputService.InputChanged:Connect(function(i)
            if drag and i.UserInputType == Enum.UserInputType.MouseMovement then upd(i.Position.X) end
        end)
        UserInputService.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false; if cn then cn:Disconnect() end end
        end)
    end)
    return {Get = function() return cur end, Set = function(v) cur = v; rl = (v - mn) / (mx - mn); fl.Size = UDim2.new(rl, 0, 1, 0); th.Position = UDim2.new(rl, -7, 0.5, -7); vl.Text = tostring(v); if cb then cb(v) end end}
end

local function lbl(p, t)
    return mk("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1,
        Text = "  " .. t, TextColor3 = C.Muted, Font = Enum.Font.Gotham,
        TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, Parent = p,
    })
end

-- ESP + CROSSHAIR + FOV CIRCLE (created early)
local espFolder = Instance.new("Folder")
espFolder.Name = "ADHIHUB_ESP"
espFolder.Parent = SG

local chH = mk("Frame", {Size = UDim2.new(0, 2, 0, 18), Position = UDim2.new(0.5, -1, 0.5, -9), BackgroundColor3 = C.Text, BorderSizePixel = 0, Visible = false, ZIndex = 50, Parent = SG})
local chV = mk("Frame", {Size = UDim2.new(0, 18, 0, 2), Position = UDim2.new(0.5, -9, 0.5, -1), BackgroundColor3 = C.Text, BorderSizePixel = 0, Visible = false, ZIndex = 50, Parent = SG})

local fovC = mk("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C.Accent,
    BackgroundTransparency = 0.88, BorderSizePixel = 1, BorderColor3 = C.Accent,
    Visible = false, ZIndex = 49, Parent = SG,
})
crn(fovC, 9999)

-- =============================================
-- TAB: FLY
-- =============================================
local flyPage = addTab("Fly")
sec(flyPage, "MOVEMENT")
local flyTgl = tog(flyPage, "Fly", false)
local noclTgl = tog(flyPage, "Noclip", false)
local infJTgl = tog(flyPage, "Infinite Jump (V)", false)
local ctpTgl = tog(flyPage, "Click TP (Mouse)", false)
sec(flyPage, "FLY SETTINGS")
local fspd = sldr(flyPage, "Fly Speed", 1, 50, 16)
lbl(flyPage, "SPACE = Up  |  Q = Down")

-- =============================================
-- TAB: VISUAL
-- =============================================
local visPage = addTab("Visual")
sec(visPage, "RENDERING")
local fbTgl = tog(visPage, "Fullbright", false)
local fogTgl = tog(visPage, "Remove Fog", false)
local chTgl = tog(visPage, "Crosshair", false)
sec(visPage, "PLAYERS")
local espTgl = tog(visPage, "ESP (Player Names)", false)

-- =============================================
-- TAB: MISC
-- =============================================
local miscPage = addTab("Misc")
sec(miscPage, "PLAYER")
local spdS = sldr(miscPage, "Walk Speed", 16, 300, 16, function(v)
    local ch = player.Character
    if ch and ch:FindFirstChild("Humanoid") then ch.Humanoid.WalkSpeed = v end
end)
local jmpS = sldr(miscPage, "Jump Power", 50, 300, 50, function(v)
    local ch = player.Character
    if ch and ch:FindFirstChild("Humanoid") then ch.Humanoid.JumpPower = v end
end)
btrn(miscPage, "RESET PLAYER", C.Orange, function() spdS.Set(16); jmpS.Set(50) end)

sec(miscPage, "WORLD")
local gravS = sldr(miscPage, "Gravity", 0, 200, 196, function(v) workspace.Gravity = v end)
local fovS = sldr(miscPage, "FOV", 30, 120, 70, function(v) camera.FieldOfView = v end)
btrn(miscPage, "RESET WORLD", C.Orange, function() gravS.Set(196); fovS.Set(70) end)

sec(miscPage, "EXTRAS")
local godTgl = tog(miscPage, "God Mode", false)
local invisTgl = tog(miscPage, "Invisible", false)
local flingTgl = tog(miscPage, "Fling", false)
local reachTgl = tog(miscPage, "Reach (20 studs)", false)
local spinTgl = tog(miscPage, "Spin Bot", false)
local afkTgl = tog(miscPage, "Anti-AFK", false)
local acolTgl = tog(miscPage, "Auto Collect", false)

btrn(miscPage, "BRING ALL TOOLS", C.Accent, function()
    local ch = player.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    for _, o in ipairs(workspace:GetDescendants()) do
        if o:IsA("Tool") and o:FindFirstChild("Handle") then
            o.Handle.CFrame = ch.HumanoidRootPart.CFrame
        end
    end
end)
btrn(miscPage, "BTOOLS (Local)", C.Purple, function()
    local bp = player:FindFirstChildOfClass("Backpack")
    if bp then
        for _, n in ipairs({"Hammer", "Clone", "Delete"}) do
            local t = Instance.new("Tool"); t.Name = n; t.RequiresHandle = false; t.Parent = bp
        end
    end
end)

sec(miscPage, "SERVER")
local tpIn = mk("TextBox", {
    Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = C.Card, BorderSizePixel = 0,
    Text = "", PlaceholderText = "Player name to TP...", PlaceholderColor3 = C.Muted,
    TextColor3 = C.Text, Font = Enum.Font.Gotham, TextSize = 12, ClearTextOnFocus = false, Parent = miscPage,
})
crn(tpIn, 6)
str(tpIn, C.Border, 1, 0.5)

btrn(miscPage, "TELEPORT TO PLAYER", C.Accent, function()
    local n = tpIn.Text; if n == "" then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and (p.Name:lower():find(n:lower()) or p.DisplayName:lower():find(n:lower())) then
            local tc, mc = p.Character, player.Character
            if tc and tc:FindFirstChild("HumanoidRootPart") and mc and mc:FindFirstChild("HumanoidRootPart") then
                mc.HumanoidRootPart.CFrame = tc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            end
            break
        end
    end
end)
btrn(miscPage, "REJOIN", C.Orange, function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)
btrn(miscPage, "SERVER HOP", C.Teal, function()
    pcall(function()
        local r = game:GetService("HttpService"):JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
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
sec(miscPage, "DISPLAY")
btrn(miscPage, "DESTROY GUI", C.Red, function() SG:Destroy() end)

-- =============================================
-- TAB: ADV
-- =============================================
local advPage = addTab("ADV")
sec(advPage, "COMBAT")
local aimTgl = tog(advPage, "Aimbot (Hold Right Click)", false)
local hbTgl = tog(advPage, "Hitbox Expander (20x)", false)
sec(advPage, "AIMBOT SETTINGS")
local aimFov = sldr(advPage, "FOV Radius", 30, 500, 120)
local aimSm = sldr(advPage, "Smoothness", 1, 20, 5)
lbl(advPage, "Hold RIGHT CLICK to aim")
sec(advPage, "UTILITIES")
local fcTgl = tog(advPage, "Free Cam (Spy Cam)", false)
local akTgl = tog(advPage, "Anti-Kick / Anti-Ban", false)
lbl(advPage, "Free Cam: WASD | Q down | Space up")

-- =============================================
-- FLY
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
    if flyBV then flyBV:Destroy(); flyBV = nil end
    if flyBG then flyBG:Destroy(); flyBG = nil end
    local ch = player.Character
    if ch then
        local hum = ch:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end

flyTgl:OnChange(function(en) if en then startFly() else stopFly() end end)

RunService.RenderStepped:Connect(function(dt)
    if not flying then return end
    local ch = player.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    local cf = camera.CFrame
    local spd = fspd.Get()
    local v = Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then v = v + cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then v = v - cf.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then v = v - cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then v = v + cf.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then v = v + Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then v = v - Vector3.new(0, 1, 0) end
    if v.Magnitude > 0 then
        if flyBV then flyBV.Velocity = v.Unit * spd end
    else
        if flyBV then flyBV.Velocity = Vector3.zero end
    end
    if flyBG then flyBG.CFrame = cf end
end)

-- =============================================
-- NOCLIP
-- =============================================
local noclConn = nil
noclTgl:OnChange(function(en)
    if en then
        noclConn = RunService.Stepped:Connect(function()
            local ch = player.Character
            if ch then
                for _, p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    else
        if noclConn then noclConn:Disconnect(); noclConn = nil end
    end
end)

-- =============================================
-- INFINITE JUMP
-- =============================================
UserInputService.JumpRequest:Connect(function()
    if infJTgl.Get() then
        local ch = player.Character
        if ch and ch:FindFirstChild("Humanoid") then
            ch.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- =============================================
-- CLICK TP
-- =============================================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and ctpTgl.Get() then
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
-- FULLBRIGHT
-- =============================================
local oBri, oClk
fbTgl:OnChange(function(en)
    if en then
        oBri = Lighting.Brightness; oClk = Lighting.ClockTime
        Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.GlobalShadows = false
    else
        Lighting.Brightness = oBri or 1; Lighting.ClockTime = oClk or 12; Lighting.GlobalShadows = true
    end
end)

-- =============================================
-- REMOVE FOG
-- =============================================
local oFE, oFS
fogTgl:OnChange(function(en)
    if en then
        oFE = Lighting.FogEnd; oFS = Lighting.FogStart
        Lighting.FogEnd = 1e6; Lighting.FogStart = 0
    else
        Lighting.FogEnd = oFE or 1e5; Lighting.FogStart = oFS or 0
    end
end)

-- =============================================
-- CROSSHAIR
-- =============================================
chTgl:OnChange(function(en) chH.Visible = en; chV.Visible = en end)

-- =============================================
-- ESP
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
    local function oc(c)
        local hrp = c:WaitForChild("HumanoidRootPart", 5)
        if hrp then bb.Adornee = hrp end
    end
    if target.Character then oc(target.Character) end
    target.CharacterAdded:Connect(oc)
end

espTgl:OnChange(function(en)
    if en then
        for _, p in ipairs(Players:GetPlayers()) do addESP(p) end
        Players.PlayerAdded:Connect(function(p) if espTgl.Get() then addESP(p) end end)
    else
        for _, c in ipairs(espFolder:GetChildren()) do c:Destroy() end
    end
end)

-- =============================================
-- GOD MODE
-- =============================================
local oMH, oH
godTgl:OnChange(function(en)
    local ch = player.Character
    if not ch or not ch:FindFirstChild("Humanoid") then return end
    if en then
        oMH = ch.Humanoid.MaxHealth; oH = ch.Humanoid.Health
        ch.Humanoid.MaxHealth = 1e9; ch.Humanoid.Health = 1e9
    else
        ch.Humanoid.MaxHealth = oMH or 100; ch.Humanoid.Health = oH or 100
    end
end)

-- =============================================
-- INVISIBLE (FIXED - all part types)
-- =============================================
local invisCn = nil

local function setTrans(ch, v)
    for _, o in ipairs(ch:GetDescendants()) do
        if o:IsA("BasePart") then
            o.LocalTransparencyModifier = v
            o.Transparency = v
        elseif o:IsA("Decal") or o:IsA("Texture") then
            o.Transparency = v
        elseif o:IsA("SurfaceGui") or o:IsA("BillboardGui") or o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Beam") then
            o.Enabled = v ~= 1
        elseif o:IsA("Accessory") then
            local handle = o:FindFirstChild("Handle")
            if handle then handle.Transparency = v end
        end
    end
end

invisTgl:OnChange(function(en)
    local ch = player.Character
    if not ch then return end
    if en then
        setTrans(ch, 1)
        invisCn = RunService.Stepped:Connect(function()
            local c = player.Character
            if c then setTrans(c, 1) end
        end)
    else
        if invisCn then invisCn:Disconnect(); invisCn = nil end
        setTrans(ch, 0)
    end
end)

-- =============================================
-- FLING
-- =============================================
local flConns = {}
local function startFling()
    local ch = player.Character
    if not ch then return end
    for _, part in ipairs(ch:GetDescendants()) do
        if part:IsA("BasePart") then
            local c = part.Touched:Connect(function(hit)
                if not flingTgl.Get() or not hit or not hit.Parent then return end
                local hc = hit.Parent
                if hc == ch then return end
                local hh = hc:FindFirstChildOfClass("Humanoid")
                if not hh or hh.Health <= 0 then return end
                local hr = hc:FindFirstChild("HumanoidRootPart")
                local mr = ch:FindFirstChild("HumanoidRootPart")
                if not hr or not mr then return end
                hr.Velocity = (hr.Position - mr.Position).Unit * 200 + Vector3.new(0, 100, 0)
                hr.RotVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
            end)
            table.insert(flConns, c)
        end
    end
end

local function stopFling()
    for _, c in ipairs(flConns) do if c.Connected then c:Disconnect() end end
    flConns = {}
end

flingTgl:OnChange(function(en) if en then startFling() else stopFling() end end)

-- =============================================
-- REACH
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
-- SPIN BOT
-- =============================================
local spinA = 0
RunService.RenderStepped:Connect(function()
    if not spinTgl.Get() then return end
    local ch = player.Character
    if ch and ch:FindFirstChild("HumanoidRootPart") then
        spinA = (spinA + 3) % 360
        local cf = ch.HumanoidRootPart.CFrame
        ch.HumanoidRootPart.CFrame = CFrame.new(cf.Position) * CFrame.Angles(0, math.rad(spinA), 0) * (cf - cf.Position)
    end
end)

-- =============================================
-- ANTI-AFK
-- =============================================
local vu = game:GetService("VirtualUser")
player.Idled:Connect(function()
    if afkTgl.Get() then vu:CaptureController(); vu:ClickButton2(Vector2.new()) end
end)

-- =============================================
-- AUTO COLLECT
-- =============================================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not acolTgl.Get() then return end
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
-- AIMBOT
-- =============================================
local aimHold = false

local function getClosest()
    local best, bestD = nil, aimFov.Get()
    local m = UserInputService:GetMouseLocation()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local sp, ok = camera:WorldToScreenPoint(p.Character.Head.Position)
            if ok then
                local d = (Vector2.new(m.X, m.Y) - Vector2.new(sp.X, sp.Y)).Magnitude
                if d < bestD then bestD = d; best = p end
            end
        end
    end
    return best
end

aimTgl:OnChange(function(en)
    fovC.Visible = en
    if en then local d = aimFov.Get() * 2; fovC.Size = UDim2.new(0, d, 0, d) end
end)

aimFov:OnChange(function(v)
    local d = v * 2; fovC.Size = UDim2.new(0, d, 0, d)
end)

RunService.RenderStepped:Connect(function()
    if not aimHold or not aimTgl.Get() then return end
    local t = getClosest()
    if t and t.Character and t.Character:FindFirstChild("Head") then
        local cf = camera.CFrame
        camera.CFrame = cf:Lerp(CFrame.new(cf.Position, t.Character.Head.Position), 1 / aimSm.Get())
    end
end)

-- =============================================
-- FREE CAM (FIXED - uses dt, no task.wait)
-- =============================================
local fcOn = false
local fcConn = nil
local savedType, savedCF

local function startFC()
    if fcOn then return end
    fcOn = true
    savedType = camera.CameraType
    savedCF = camera.CFrame
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = savedCF

    fcConn = RunService.RenderStepped:Connect(function(dt)
        if not fcOn then return end
        local cf = camera.CFrame
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then dir = dir - Vector3.new(0, 1, 0) end
        if dir.Magnitude > 0 then
            camera.CFrame = camera.CFrame + (dir.Unit * 80 * dt)
        end
    end)
end

local function stopFC()
    if not fcOn then return end
    fcOn = false
    if fcConn then fcConn:Disconnect(); fcConn = nil end
    camera.CameraType = savedType or Enum.CameraType.Custom
    if savedCF then camera.CFrame = savedCF end
end

fcTgl:OnChange(function(en) if en then startFC() else stopFC() end end)

-- =============================================
-- ANTI-KICK (IMPROVED - multiple methods)
-- =============================================
local akEnabled = false

akTgl:OnChange(function(en)
    akEnabled = en
    if en then warn("[ADHIHUB] Anti-Kick: ON")
    else warn("[ADHIHUB] Anti-Kick: OFF") end
end)

-- Method 1: namecall hook
pcall(function()
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        if akEnabled and not checkcaller() then
            local m = getnamecallmethod()
            if m == "Kick" and self == player then
                warn("[ADHIHUB] Kick blocked (namecall)")
                return nil
            end
            if m == "Shutdown" then
                warn("[ADHIHUB] Shutdown blocked (namecall)")
                return nil
            end
        end
        return old(self, ...)
    end)
end)

-- Method 2: __index hook
pcall(function()
    local old
    old = hookmetamethod(game, "__index", function(self, key)
        if akEnabled and not checkcaller() and self == player and key == "Kick" then
            return function() warn("[ADHIHUB] Kick blocked (index)") end
        end
        return old(self, key)
    end)
end)

-- Method 3: __newindex hook for Kick
pcall(function()
    local old
    old = hookmetamethod(game, "__newindex", function(self, key, val)
        if akEnabled and not checkcaller() and self == player and key == "Kick" then
            warn("[ADHIHUB] Kick assignment blocked")
            return nil
        end
        return old(self, key, val)
    end)
end)

-- Method 4: Block suspicious scripts
local function blockBad(char)
    if not akEnabled then return end
    task.wait(0.5)
    for _, d in ipairs(char:GetDescendants()) do
        if d:IsA("BaseScript") then
            local n = d.Name:lower()
            local bad = false
            for _, kw in ipairs({"kick", "ban", "admin", "punish", "delete", "freeze", "jail"}) do
                if n:find(kw) then bad = true; break end
            end
            if not bad and d:IsA("LocalScript") then
                pcall(function()
                    local src = d.Source:lower()
                    for _, kw in ipairs({"player:kick", "player.kick", ":kick(", ".kick(", "game:shutdown"}) do
                        if src:find(kw) then bad = true; break end
                    end
                end)
            end
            if bad then
                d.Disabled = true
                pcall(function() d:Destroy() end)
                warn("[ADHIHUB] Blocked: " .. d.Name)
            end
        end
    end
end

player.CharacterAdded:Connect(function(char)
    if akEnabled then blockBad(char) end
    char.DescendantAdded:Connect(function(d)
        if not akEnabled then return end
        if d:IsA("BaseScript") then
            local n = d.Name:lower()
            for _, kw in ipairs({"kick", "ban", "admin", "punish", "delete"}) do
                if n:find(kw) then
                    task.delay(0.1, function()
                        pcall(function() d.Disabled = true; d:Destroy() end)
                    end)
                    warn("[ADHIHUB] Blocked: " .. d.Name)
                    return
                end
            end
        end
    end)
end)

-- =============================================
-- HITBOX EXPANDER
-- =============================================
local hbConns = {}
local function expandAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local h = p.Character.HumanoidRootPart
            h.Size = Vector3.new(20, 20, 20)
            h.Transparency = 0.6
            h.BrickColor = BrickColor.new("Really red")
            h.Material = Enum.Material.ForceField
            h.CanCollide = false
        end
    end
end
local function resetAll()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local h = p.Character.HumanoidRootPart
            h.Size = Vector3.new(2, 2, 1); h.Transparency = 1
        end
    end
end

hbTgl:OnChange(function(en)
    if en then
        expandAll()
        for _, c in ipairs(hbConns) do if c.Connected then c:Disconnect() end end
        hbConns = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                table.insert(hbConns, p.CharacterAdded:Connect(function()
                    task.wait(0.5); if hbTgl.Get() then expandAll() end
                end))
            end
        end
        Players.PlayerAdded:Connect(function(p)
            if hbTgl.Get() then
                table.insert(hbConns, p.CharacterAdded:Connect(function()
                    task.wait(0.5); if hbTgl.Get() then expandAll() end
                end))
            end
        end)
    else
        resetAll()
        for _, c in ipairs(hbConns) do if c.Connected then c:Disconnect() end end
        hbConns = {}
    end
end)

-- =============================================
-- INPUT HANDLER
-- =============================================
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.RightControl then
        if Main.Visible then minimizeGUI() else restoreGUI() end
    elseif input.KeyCode == Enum.KeyCode.E then
        if flying then stopFly() else startFly() end
    elseif input.KeyCode == Enum.KeyCode.N then
        noclTgl.Set(not noclTgl.Get())
    elseif input.KeyCode == Enum.KeyCode.V then
        infJTgl.Set(not infJTgl.Get())
    elseif input.KeyCode == Enum.KeyCode.C then
        fcTgl.Set(not fcTgl.Get())
    elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimHold = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimHold = false
    end
end)

-- =============================================
-- RESPAWN
-- =============================================
player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if flying then startFly() end
end)

-- =============================================
-- INIT
-- =============================================
qtw(Tabs["Fly"], {BackgroundColor3 = C.Accent})
Tabs["Fly"].TextColor3 = C.Text
Pages["Fly"].Visible = true
Active = "Fly"

Main.Position = UDim2.new(0.5, -215, 0.5, -200)
stw(Main, {Position = UDim2.new(0.5, -215, 0.5, -245)})

print("===================================")
print("  ADHIHUB v1.3 - Loaded!")
print("  Toggle: RightControl")
print("  Fly: E | Noclip: N | InfJump: V")
print("  Free Cam: C | Aimbot: Hold RMB")
print("===================================")