--[[
    Pi3t3p0st HAHA
    If you see this, you're gay and a  
    Toggle met INSERT Key
--]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Config
local Config = {
    ESPEnabled = false,
    ESPName = true,
    ESPHealth = true,
    ESPDistance = true,
    ESPHighlight = true,
    ESPColor = Color3.fromRGB(180, 80, 255),
    ESPTransparency = 0.7,
    ESPThickness = 2,
    ESPTextSize = 13,
    ESPMaxDistance = 1000,

    FastRunEnabled = false,
    WalkSpeed = 300,
    JumpPower = 200,
    InfiniteJump = false,
    FlyEnabled = false,
    FlySpeed = 100,
    Noclip = false,
    WallWalk = false,
    GodMode = false,

    FullBright = false,
    AntiAFK = false,
}

-- GUI Parent
local function GetGuiParent()
    local success, result = pcall(function()
        if gethui then return gethui() end
        return CoreGui
    end)
    if success and result then return result end
    return LocalPlayer:WaitForChild("PlayerGui")
end

pcall(function()
    local old = GetGuiParent():FindFirstChild("Pi3t3p0st")
    if old then old:Destroy() end
end)

-- ========== THEME ==========
local Theme = {
    Background = Color3.fromRGB(10, 10, 16),
    Secondary = Color3.fromRGB(18, 18, 26),
    Tertiary = Color3.fromRGB(28, 28, 40),
    Accent = Color3.fromRGB(180, 80, 255),
    Accent2 = Color3.fromRGB(120, 60, 220),
    Accent3 = Color3.fromRGB(90, 200, 255),
    Text = Color3.fromRGB(240, 240, 250),
    SubText = Color3.fromRGB(140, 140, 165),
    Success = Color3.fromRGB(80, 220, 140),
    Danger = Color3.fromRGB(255, 70, 90),
}

-- ========== GUI ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Pi3t3p0st"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = GetGuiParent()

-- Shadow
local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(0, 380, 0, 560)
Shadow.Position = UDim2.new(0.5, -190, 0.5, -280)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.4
Shadow.BorderSizePixel = 0
Shadow.ZIndex = 1
Shadow.Parent = ScreenGui

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 20)
ShadowCorner.Parent = Shadow

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 560)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -280)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Theme.Accent
MainStroke.Parent = MainFrame

local StrokeGradient = Instance.new("UIGradient")
StrokeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 80, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 180))
}
StrokeGradient.Rotation = 45
StrokeGradient.Parent = MainStroke

MainFrame:GetPropertyChangedSignal("Position"):Connect(function()
    Shadow.Position = MainFrame.Position
end)

-- ========== HEADER ==========
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 76)
Header.BackgroundColor3 = Theme.Secondary
Header.BorderSizePixel = 0
Header.ZIndex = 3
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 20)
HeaderCorner.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 40, 180)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 130, 220))
}
HeaderGradient.Rotation = 30
HeaderGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.3),
    NumberSequenceKeypoint.new(1, 0.55)
}
HeaderGradient.Parent = Header

local HeaderFix = Instance.new("Frame")
HeaderFix.Size = UDim2.new(1, 0, 0, 20)
HeaderFix.Position = UDim2.new(0, 0, 1, -20)
HeaderFix.BackgroundColor3 = Theme.Secondary
HeaderFix.BorderSizePixel = 0
HeaderFix.ZIndex = 3
HeaderFix.Parent = Header

-- Logo
local LogoWrap = Instance.new("Frame")
LogoWrap.Size = UDim2.new(0, 52, 0, 52)
LogoWrap.Position = UDim2.new(0, 15, 0.5, -26)
LogoWrap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogoWrap.BackgroundTransparency = 0.9
LogoWrap.BorderSizePixel = 0
LogoWrap.ZIndex = 5
LogoWrap.Parent = Header

local LogoWrapCorner = Instance.new("UICorner")
LogoWrapCorner.CornerRadius = UDim.new(1, 0)
LogoWrapCorner.Parent = LogoWrap

local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(1, -8, 1, -8)
Logo.Position = UDim2.new(0, 4, 0, 4)
Logo.BackgroundColor3 = Theme.Accent
Logo.BorderSizePixel = 0
Logo.ZIndex = 6
Logo.Parent = LogoWrap

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = Logo

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 200, 255))
}
LogoGradient.Rotation = 45
LogoGradient.Parent = Logo

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "P"
LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoText.Font = Enum.Font.GothamBlack
LogoText.TextSize = 26
LogoText.ZIndex = 7
LogoText.Parent = Logo

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -180, 0, 26)
Title.Position = UDim2.new(0, 78, 0, 14)
Title.BackgroundTransparency = 1
Title.Text = "Pi3t3p0st"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 5
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -180, 0, 14)
SubTitle.Position = UDim2.new(0, 78, 0, 42)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Fuck me"
SubTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
SubTitle.Font = Enum.Font.GothamSemibold
SubTitle.TextSize = 11
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.ZIndex = 5
SubTitle.Parent = Header

-- Minimize
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 32, 0, 32)
MinBtn.Position = UDim2.new(1, -80, 0, 22)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.BackgroundTransparency = 0.88
MinBtn.BorderSizePixel = 0
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.ZIndex = 6
MinBtn.AutoButtonColor = false
MinBtn.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinBtn

-- Close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0, 22)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 90)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "NIGA"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 15
CloseBtn.ZIndex = 6
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(255, 90, 120),
        Size = UDim2.new(0, 34, 0, 34),
        Position = UDim2.new(1, -43, 0, 21)
    }):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(255, 60, 90),
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -42, 0, 22)
    }):Play()
end)

-- ========== TABS ==========
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -30, 0, 38)
TabBar.Position = UDim2.new(0, 15, 0, 86)
TabBar.BackgroundColor3 = Theme.Secondary
TabBar.BorderSizePixel = 0
TabBar.ZIndex = 3
TabBar.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 10)
TabCorner.Parent = TabBar

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 4)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabBar

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 4)
TabPadding.PaddingBottom = UDim.new(0, 4)
TabPadding.PaddingLeft = UDim.new(0, 4)
TabPadding.PaddingRight = UDim.new(0, 4)
TabPadding.Parent = TabBar

local PagesContainer = Instance.new("Frame")
PagesContainer.Size = UDim2.new(1, -30, 1, -140)
PagesContainer.Position = UDim2.new(0, 15, 0, 134)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = MainFrame

local Pages = {}
local tabs = {}
local activeTab = nil

local function CreatePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Theme.Accent
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = PagesContainer

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    Pages[name] = page
    return page
end

local function CreateTab(name, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 63, 1, 0)
    btn.BackgroundColor3 = Theme.Tertiary
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 4
    btn.Parent = TabBar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = icon
    label.TextColor3 = Theme.SubText
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.ZIndex = 5
    label.Parent = btn

    tabs[name] = { btn = btn, label = label, page = CreatePage(name) }

    btn.MouseButton1Click:Connect(function()
        if activeTab == name then return end
        for n, t in pairs(tabs) do
            t.btn.BackgroundTransparency = 1
            t.label.TextColor3 = Theme.SubText
            t.page.Visible = false
        end
        activeTab = name
        btn.BackgroundTransparency = 0
        btn.BackgroundColor3 = Theme.Accent
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabs[name].page.Visible = true
    end)

    return btn
end

-- ========== UI COMPONENTS ==========
local function CreateSectionLabel(parent, text)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 22)
    Label.BackgroundTransparency = 1
    Label.Text = "◆ " .. text
    Label.TextColor3 = Theme.Accent
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = parent

    local Pad = Instance.new("UIPadding")
    Pad.PaddingLeft = UDim.new(0, 4)
    Pad.Parent = Label
    return Label
end

local function CreateToggle(parent, text, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 42)
    Container.BackgroundColor3 = Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Container

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Accent
    Stroke.Thickness = 1
    Stroke.Transparency = 0.9
    Stroke.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -80, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Theme.Text
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 46, 0, 24)
    ToggleBtn.Position = UDim2.new(1, -60, 0.5, -12)
    ToggleBtn.BackgroundColor3 = default and Theme.Accent or Theme.Tertiary
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Text = ""
    ToggleBtn.AutoButtonColor = false
    ToggleBtn.Parent = Container

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 18, 0, 18)
    Knob.Position = default and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = ToggleBtn

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local state = default

    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Theme.Accent or Theme.Tertiary
        }):Play()
        TweenService:Create(Knob, TweenInfo.new(0.2), {
            Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        }):Play()
        if callback then
            local ok, err = pcall(callback, state)
            if not ok then warn("[Pi3t3p0st] Toggle error:", err) end
        end
    end)

    return Container
end

local function CreateSlider(parent, text, min, max, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 58)
    Container.BackgroundColor3 = Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Container

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Accent
    Stroke.Thickness = 1
    Stroke.Transparency = 0.9
    Stroke.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 20)
    Label.Position = UDim2.new(0, 15, 0, 6)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Theme.Text
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.4, -15, 0, 20)
    ValueLabel.Position = UDim2.new(0.6, 0, 0, 6)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Theme.Accent
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 12
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = Container

    local BarBG = Instance.new("Frame")
    BarBG.Size = UDim2.new(1, -30, 0, 6)
    BarBG.Position = UDim2.new(0, 15, 0, 40)
    BarBG.BackgroundColor3 = Theme.Tertiary
    BarBG.BorderSizePixel = 0
    BarBG.Parent = Container

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = BarBG

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Accent
    Fill.BorderSizePixel = 0
    Fill.Parent = BarBG

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill

    local SliderKnob = Instance.new("Frame")
    SliderKnob.Size = UDim2.new(0, 16, 0, 16)
    SliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
    SliderKnob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = BarBG

    local SliderKnobCorner = Instance.new("UICorner")
    SliderKnobCorner.CornerRadius = UDim.new(1, 0)
    SliderKnobCorner.Parent = SliderKnob

    local ClickArea = Instance.new("TextButton")
    ClickArea.Size = UDim2.new(1, 0, 0, 20)
    ClickArea.Position = UDim2.new(0, 0, 0.5, -10)
    ClickArea.BackgroundTransparency = 1
    ClickArea.Text = ""
    ClickArea.Parent = BarBG

    local dragging = false

    local function UpdateFromX(x)
        local rel = math.clamp((x - BarBG.AbsolutePosition.X) / BarBG.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + rel * (max - min))
        Fill.Size = UDim2.new(rel, 0, 1, 0)
        SliderKnob.Position = UDim2.new(rel, 0, 0.5, 0)
        ValueLabel.Text = tostring(value)
        if callback then
            local ok, err = pcall(callback, value)
            if not ok then warn("[Pi3t3p0st] Slider error:", err) end
        end
    end

    ClickArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateFromX(input.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateFromX(input.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return Container
end

local function CreateColorPicker(parent, text, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 84)
    Container.BackgroundColor3 = Theme.Secondary
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Container

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Theme.Accent
    Stroke.Thickness = 1
    Stroke.Transparency = 0.9
    Stroke.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 0, 20)
    Label.Position = UDim2.new(0, 15, 0, 6)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Theme.Text
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local Swatch = Instance.new("Frame")
    Swatch.Size = UDim2.new(0, 44, 0, 22)
    Swatch.Position = UDim2.new(1, -60, 0, 5)
    Swatch.BackgroundColor3 = default
    Swatch.BorderSizePixel = 0
    Swatch.Parent = Container

    local SwatchCorner = Instance.new("UICorner")
    SwatchCorner.CornerRadius = UDim.new(0, 6)
    SwatchCorner.Parent = Swatch

    local presets = {
        Color3.fromRGB(180, 80, 255),
        Color3.fromRGB(255, 80, 180),
        Color3.fromRGB(90, 200, 255),
        Color3.fromRGB(80, 255, 140),
        Color3.fromRGB(255, 200, 60),
        Color3.fromRGB(255, 100, 60),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(255, 40, 40),
    }

    local PresetFrame = Instance.new("Frame")
    PresetFrame.Size = UDim2.new(1, -30, 0, 28)
    PresetFrame.Position = UDim2.new(0, 15, 0, 44)
    PresetFrame.BackgroundTransparency = 1
    PresetFrame.Parent = Container

    local PresetLayout = Instance.new("UIListLayout")
    PresetLayout.FillDirection = Enum.FillDirection.Horizontal
    PresetLayout.Padding = UDim.new(0, 6)
    PresetLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PresetLayout.Parent = PresetFrame

    for _, color in ipairs(presets) do
        local swatchBtn = Instance.new("TextButton")
        swatchBtn.Size = UDim2.new(0, 28, 0, 28)
        swatchBtn.BackgroundColor3 = color
        swatchBtn.BorderSizePixel = 0
        swatchBtn.Text = ""
        swatchBtn.AutoButtonColor = false
        swatchBtn.Parent = PresetFrame

        local sc = Instance.new("UICorner")
        sc.CornerRadius = UDim.new(1, 0)
        sc.Parent = swatchBtn

        swatchBtn.MouseButton1Click:Connect(function()
            Swatch.BackgroundColor3 = color
            if callback then
                local ok, err = pcall(callback, color)
                if not ok then warn("[Pi3t3p0st] Color error:", err) end
            end
        end)
    end

    return Container
end

-- ========== ESP FUNCTIONS ==========
local ESPObjects = {}

local function CreateESPForCharacter(player, character)
    if not character or player == LocalPlayer then return end
    if not character.Parent then return end

    local head = character:FindFirstChild("Head")
    if not head then
        head = character:WaitForChild("Head", 5)
    end
    if not head then return end

    local existing = ESPObjects[player]
    if existing and existing.Parent then existing:Destroy() end
    
    for _, v in pairs(character:GetChildren()) do
        if v:IsA("Highlight") and v.Name == "ESP_Highlight_" .. player.Name then
            v:Destroy()
        end
    end

    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "Pi3t3p0st_ESP_" .. player.Name
    Billboard.Adornee = head
    Billboard.Size = UDim2.new(0, 200, 0, 60)
    Billboard.StudsOffset = Vector3.new(0, 3, 0)
    Billboard.AlwaysOnTop = true
    Billboard.LightInfluence = 1
    Billboard.MaxDistance = Config.ESPMaxDistance
    Billboard.Parent = Camera

    ESPObjects[player] = Billboard

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Name = "NameLabel"
    NameLabel.Size = UDim2.new(1, 0, 0, 16)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = player.Name
    NameLabel.TextColor3 = Config.ESPColor
    NameLabel.TextStrokeTransparency = 0
    NameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextSize = Config.ESPTextSize
    NameLabel.Parent = Billboard

    local DistLabel = Instance.new("TextLabel")
    DistLabel.Name = "DistLabel"
    DistLabel.Size = UDim2.new(1, 0, 0, 14)
    DistLabel.Position = UDim2.new(0, 0, 0, 16)
    DistLabel.BackgroundTransparency = 1
    DistLabel.Text = "0m"
    DistLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DistLabel.TextStrokeTransparency = 0
    DistLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    DistLabel.Font = Enum.Font.Gotham
    DistLabel.TextSize = Config.ESPTextSize - 2
    DistLabel.Parent = Billboard

    local HealthBG = Instance.new("Frame")
    HealthBG.Name = "HealthBG"
    HealthBG.Size = UDim2.new(0.7, 0, 0, 6)
    HealthBG.Position = UDim2.new(0.15, 0, 0, 34)
    HealthBG.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    HealthBG.BorderSizePixel = 0
    HealthBG.Parent = Billboard

    local HBCorner = Instance.new("UICorner")
    HBCorner.CornerRadius = UDim.new(1, 0)
    HBCorner.Parent = HealthBG

    local HealthBar = Instance.new("Frame")
    HealthBar.Name = "HealthBar"
    HealthBar.Size = UDim2.new(1, 0, 1, 0)
    HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    HealthBar.BorderSizePixel = 0
    HealthBar.Parent = HealthBG

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = HealthBar

    local Highlight = Instance.new("Highlight")
    Highlight.Name = "ESP_Highlight_" .. player.Name
    Highlight.Adornee = character
    Highlight.FillColor = Config.ESPColor
    Highlight.FillTransparency = Config.ESPTransparency
    Highlight.OutlineColor = Config.ESPColor
    Highlight.OutlineTransparency = 0.3
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Enabled = Config.ESPHighlight
    Highlight.Parent = character
end

local function SpawnESP(player)
    if player == LocalPlayer then return end
    if player.Character then
        CreateESPForCharacter(player, player.Character)
    end
    player.CharacterAdded:Connect(function(char)
        if Config.ESPEnabled then
            task.wait(0.3)
            CreateESPForCharacter(player, char)
        end
    end)
end

-- ========== WALL WALK (with camera tilt) ==========
local wallWalkConn = nil
local wallWalkBV = nil
local wallWalkBG = nil
local savedCameraType = nil

local function WallWalkSetup()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end

    -- Cleanup old
    for _, v in pairs(root:GetChildren()) do
        if v.Name == "Pi3t3p0stWallWalk" then v:Destroy() end
    end

    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude

    local bodyVel = Instance.new("BodyVelocity")
    bodyVel.Name = "Pi3t3p0stWallWalk"
    bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVel.Velocity = Vector3.new(0, 0, 0)
    bodyVel.Parent = root

    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Name = "Pi3t3p0stWallWalk"
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 10000
    bodyGyro.D = 200
    bodyGyro.Parent = root

    workspace.Gravity = 0

    if wallWalkConn then wallWalkConn:Disconnect() end
    wallWalkConn = RunService.RenderStepped:Connect(function()
        if not Config.WallWalk then
            if wallWalkConn then wallWalkConn:Disconnect() end
            return
        end
        if not char.Parent or not root.Parent or not humanoid.Parent then return end

        -- Raycast in all directions to find wall
        local rayDown = workspace:Raycast(root.Position, Vector3.new(0, -10, 0), params)
        local rayFront = workspace:Raycast(root.Position, Camera.CFrame.LookVector * 5, params)
        
        local normal = nil
        if rayDown then
            normal = rayDown.Normal
        elseif rayFront then
            normal = rayFront.Normal
        end
        
        if normal then
            -- Align body to surface normal
            local up = normal
            local look = humanoid.MoveDirection
            if look.Magnitude < 0.1 then
                look = root.CFrame.LookVector
            end
            look = (look - look:Dot(up) * up)
            if look.Magnitude < 0.1 then
                look = root.CFrame.RightVector
            end
            look = look.Unit
            
            local right = look:Cross(up)
            
            bodyGyro.CFrame = CFrame.fromMatrix(root.Position, right, up, -look)
            
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                bodyVel.Velocity = moveDir * Config.WalkSpeed
            else
                bodyVel.Velocity = Vector3.new(0, 0, 0)
            end
            
            -- TILT THE CAMERA
            local cam = workspace.CurrentCamera
            local camUp = normal
            local camLook = cam.CFrame.LookVector
            -- Project look onto plane perpendicular to normal
            camLook = (camLook - camLook:Dot(camUp) * camUp)
            if camLook.Magnitude < 0.1 then
                camLook = right
            end
            camLook = camLook.Unit
            
            local newCamCFrame = CFrame.fromMatrix(cam.CFrame.Position, camLook:Cross(camUp), camUp, -camLook)
            cam.CFrame = newCamCFrame
            cam.CFrame = CFrame.new(cam.CFrame.Position, cam.CFrame.Position + camLook)
        end
    end)
end

local function WallWalkDisable()
    if wallWalkConn then wallWalkConn:Disconnect() end
    workspace.Gravity = 196.2
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            for _, v in pairs(root:GetChildren()) do
                if v.Name == "Pi3t3p0stWallWalk" then
                    v:Destroy()
                end
            end
        end
    end
end

-- ========== NOTIFY ==========
local function Notify(text, color)
    color = color or Theme.Accent
    local n = Instance.new("Frame")
    n.Size = UDim2.new(0, 280, 0, 46)
    n.Position = UDim2.new(0.5, -140, 0, -60)
    n.BackgroundColor3 = Theme.Secondary
    n.BorderSizePixel = 0
    n.ZIndex = 20
    n.Parent = ScreenGui

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 12)
    c.Parent = n

    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = 2
    s.Parent = n

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
    lbl.ZIndex = 21
    lbl.Parent = n

    TweenService:Create(n, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -140, 0, 100)
    }):Play()

    task.delay(2, function()
        local out = TweenService:Create(n, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -140, 0, -60)
        })
        out:Play()
        out.Completed:Connect(function() n:Destroy() end)
    end)
end

-- ========== FLY ==========
local flyConnection = nil

local function StartFly()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return end
    
    for _, v in pairs(root:GetChildren()) do
        if v.Name == "Pi3t3p0stFly" then v:Destroy() end
    end
    
    humanoid.PlatformStand = true
    
    local flyBodyVel = Instance.new("BodyVelocity")
    flyBodyVel.Name = "Pi3t3p0stFly"
    flyBodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBodyVel.Velocity = Vector3.new(0, 0, 0)
    flyBodyVel.Parent = root
    
    local flyBodyGyro = Instance.new("BodyGyro")
    flyBodyGyro.Name = "Pi3t3p0stFly"
    flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyBodyGyro.P = 1000
    flyBodyGyro.D = 50
    flyBodyGyro.CFrame = root.CFrame
    flyBodyGyro.Parent = root
    
    if flyConnection then flyConnection:Disconnect() end
    flyConnection = RunService.RenderStepped:Connect(function()
        if not Config.FlyEnabled then
            if flyConnection then flyConnection:Disconnect() end
            return
        end
        if not flyBodyVel or not flyBodyVel.Parent then return end
        local camera = workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * Config.FlySpeed
        end
        
        flyBodyVel.Velocity = moveDir
        flyBodyGyro.CFrame = camera.CFrame
    end)
end

-- ========== BUILD TABS ==========
CreateTab("ESP", "🎯")
CreateTab("Movement", "⚡")
CreateTab("Players", "👥")
CreateTab("Extra", "✨")
CreateTab("Settings", "⚙")

-- === ESP PAGE ===
local espPage = tabs["ESP"].page
CreateSectionLabel(espPage, "ESP GOONER")
CreateToggle(espPage, "Enable ESP", false, function(state)
    Config.ESPEnabled = state
    if not state then
        for _, v in pairs(Camera:GetChildren()) do
            if v.Name:find("Pi3t3p0st_ESP") then v:Destroy() end
        end
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Highlight") and v.Name:find("ESP_Highlight") then v:Destroy() end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                CreateESPForCharacter(plr, plr.Character)
            end
        end
    end
end)

CreateSectionLabel(espPage, "KANKERDING")
CreateToggle(espPage, "Show Name", true, function(state) Config.ESPName = state end)
CreateToggle(espPage, "Show Health", true, function(state) Config.ESPHealth = state end)
CreateToggle(espPage, "Show Distance", true, function(state) Config.ESPDistance = state end)
CreateToggle(espPage, "Show Highlight", true, function(state)
    Config.ESPHighlight = state
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") and v.Name:find("ESP_Highlight") then
            v.Enabled = state
        end
    end
end)

CreateSectionLabel(espPage, "GAY colour")
CreateColorPicker(espPage, "ESP Color", Config.ESPColor, function(color)
    Config.ESPColor = color
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") and v.Name:find("ESP_Highlight") then
            v.FillColor = color
            v.OutlineColor = color
        end
    end
    for _, v in pairs(Camera:GetChildren()) do
        if v.Name:find("Pi3t3p0st_ESP") then
            local nl = v:FindFirstChild("NameLabel")
            if nl then nl.TextColor3 = color end
        end
    end
end)

CreateSlider(espPage, "Fill Transparency", 0, 1, 0.7, function(value)
    Config.ESPTransparency = value
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") and v.Name:find("ESP_Highlight") then
            v.FillTransparency = value
        end
    end
end)

CreateSlider(espPage, "Text Size", 8, 24, 13, function(value)
    Config.ESPTextSize = value
end)

CreateSlider(espPage, "Max Distance", 100, 5000, 1000, function(value)
    Config.ESPMaxDistance = value
    for _, v in pairs(Camera:GetChildren()) do
        if v.Name:find("Pi3t3p0st_ESP") then
            v.MaxDistance = value
        end
    end
end)

-- === MOVEMENT PAGE ===
local movPage = tabs["Movement"].page
CreateSectionLabel(movPage, "SPEED")
CreateToggle(movPage, "Enable Fast Run", false, function(state)
    Config.FastRunEnabled = state
    if not state then
        local char = LocalPlayer.Character
        if char then
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then
                h.WalkSpeed = 16
                h.JumpPower = 50
                h.UseJumpPower = true
            end
        end
    end
end)

CreateSlider(movPage, "Walk Speed", 16, 1000, 300, function(value)
    Config.WalkSpeed = value
end)

CreateSlider(movPage, "Jump Power", 50, 1000, 200, function(value)
    Config.JumpPower = value
end)

CreateSectionLabel(movPage, "MOVEMENT")
CreateToggle(movPage, "Infinite GOONM", false, function(state) Config.InfiniteJump = state end)
CreateToggle(movPage, "walking through your pussy", false, function(state) Config.Noclip = state end)
CreateToggle(movPage, "Wall Walk", false, function(state)
    Config.WallWalk = state
    if state then
        WallWalkSetup()
    else
        WallWalkDisable()
    end
end)
CreateToggle(movPage, "Fly", false, function(state)
    Config.FlyEnabled = state
    if not state then
        local char = LocalPlayer.Character
        if char then
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then h.PlatformStand = false end
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.Velocity = Vector3.new(0, 0, 0)
                for _, v in pairs(root:GetChildren()) do
                    if v.Name == "Pi3t3p0stFly" then v:Destroy() end
                end
            end
        end
    end
end)

CreateSlider(movPage, "Fly Speed", 10, 500, 100, function(value)
    Config.FlySpeed = value
end)

CreateSectionLabel(movPage, "PRO GOON")
CreateToggle(movPage, "God Mode (GOONER MODE)", false, function(state)
    Config.GodMode = state
    local char = LocalPlayer.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then
            if state then
                h.MaxHealth = math.huge
                h.Health = math.huge
            else
                h.MaxHealth = 100
                h.Health = 100
            end
        end
    end
end)

-- === PLAYERS PAGE ===
local playersPage = tabs["Players"].page

local PlayerListHeader = Instance.new("Frame")
PlayerListHeader.Size = UDim2.new(1, 0, 0, 34)
PlayerListHeader.BackgroundColor3 = Theme.Secondary
PlayerListHeader.BorderSizePixel = 0
PlayerListHeader.Parent = playersPage

local PLHCorner = Instance.new("UICorner")
PLHCorner.CornerRadius = UDim.new(0, 10)
PLHCorner.Parent = PlayerListHeader

local PLHLabel = Instance.new("TextLabel")
PLHLabel.Size = UDim2.new(1, -110, 1, 0)
PLHLabel.Position = UDim2.new(0, 15, 0, 0)
PLHLabel.BackgroundTransparency = 1
PLHLabel.Text = "Click to teleport"
PLHLabel.TextColor3 = Theme.SubText
PLHLabel.Font = Enum.Font.GothamSemibold
PLHLabel.TextSize = 11
PLHLabel.TextXAlignment = Enum.TextXAlignment.Left
PLHLabel.Parent = PlayerListHeader

local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Size = UDim2.new(0, 80, 0, 24)
RefreshBtn.Position = UDim2.new(1, -90, 0.5, -12)
RefreshBtn.BackgroundColor3 = Theme.Accent
RefreshBtn.BorderSizePixel = 0
RefreshBtn.Text = "🔄 Refresh"
RefreshBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshBtn.Font = Enum.Font.GothamBold
RefreshBtn.TextSize = 10
RefreshBtn.AutoButtonColor = false
RefreshBtn.Parent = PlayerListHeader

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.CornerRadius = UDim.new(0, 6)
RefreshCorner.Parent = RefreshBtn

local PlayerListFrame = Instance.new("Frame")
PlayerListFrame.Size = UDim2.new(1, 0, 0, 400)
PlayerListFrame.BackgroundTransparency = 1
PlayerListFrame.Parent = playersPage

local PLFLayout = Instance.new("UIListLayout")
PLFLayout.Padding = UDim.new(0, 6)
PLFLayout.SortOrder = Enum.SortOrder.LayoutOrder
PLFLayout.Parent = PlayerListFrame

local function TeleportToPlayer(player)
    if player == LocalPlayer then
        Notify("You can't teleport to yourself!", Theme.Danger)
        return
    end
    if not player.Character then
        Notify(player.Name .. " has no character!", Theme.Danger)
        return
    end
    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        Notify(player.Name .. " is not spawned!", Theme.Danger)
        return
    end
    local myChar = LocalPlayer.Character
    if not myChar then
        Notify("Your character is not loaded!", Theme.Danger)
        return
    end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then
        Notify("Your root is not loaded!", Theme.Danger)
        return
    end
    myRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
    Notify("Teleported to " .. player.Name, Theme.Success)
end

local function CreatePlayerRow(player)
    local isLocal = (player == LocalPlayer)
    
    local Row = Instance.new("TextButton")
    Row.Name = player.Name
    Row.Size = UDim2.new(1, 0, 0, 46)
    Row.BackgroundColor3 = isLocal and Color3.fromRGB(35, 35, 55) or Theme.Secondary
    Row.BorderSizePixel = 0
    Row.Text = ""
    Row.AutoButtonColor = false
    Row.Parent = PlayerListFrame

    local RowCorner = Instance.new("UICorner")
    RowCorner.CornerRadius = UDim.new(0, 10)
    RowCorner.Parent = Row

    local RowStroke = Instance.new("UIStroke")
    RowStroke.Color = isLocal and Theme.Accent or Color3.fromRGB(60, 60, 80)
    RowStroke.Thickness = 1
    RowStroke.Transparency = 0.6
    RowStroke.Parent = Row

    local AvatarCircle = Instance.new("Frame")
    AvatarCircle.Size = UDim2.new(0, 34, 0, 34)
    AvatarCircle.Position = UDim2.new(0, 8, 0.5, -17)
    AvatarCircle.BackgroundColor3 = isLocal and Theme.Accent or Theme.Accent2
    AvatarCircle.BorderSizePixel = 0
    AvatarCircle.Parent = Row

    local ACCorner = Instance.new("UICorner")
    ACCorner.CornerRadius = UDim.new(1, 0)
    ACCorner.Parent = AvatarCircle

    local AvatarText = Instance.new("TextLabel")
    AvatarText.Size = UDim2.new(1, 0, 1, 0)
    AvatarText.BackgroundTransparency = 1
    AvatarText.Text = string.upper(string.sub(player.Name, 1, 1))
    AvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
    AvatarText.Font = Enum.Font.GothamBlack
    AvatarText.TextSize = 16
    AvatarText.Parent = AvatarCircle

    local NameLbl = Instance.new("TextLabel")
    NameLbl.Size = UDim2.new(1, -140, 0, 18)
    NameLbl.Position = UDim2.new(0, 52, 0, 7)
    NameLbl.BackgroundTransparency = 1
    NameLbl.Text = player.Name .. (isLocal and " (You)" or "")
    NameLbl.TextColor3 = Theme.Text
    NameLbl.Font = Enum.Font.GothamBold
    NameLbl.TextSize = 12
    NameLbl.TextXAlignment = Enum.TextXAlignment.Left
    NameLbl.Parent = Row

    local StatusLbl = Instance.new("TextLabel")
    StatusLbl.Size = UDim2.new(1, -140, 0, 14)
    StatusLbl.Position = UDim2.new(0, 52, 0, 25)
    StatusLbl.BackgroundTransparency = 1
    StatusLbl.Text = player.Character and "● Online" or "● Loading..."
    StatusLbl.TextColor3 = player.Character and Theme.Success or Color3.fromRGB(255, 200, 60)
    StatusLbl.Font = Enum.Font.Gotham
    StatusLbl.TextSize = 10
    StatusLbl.TextXAlignment = Enum.TextXAlignment.Left
    StatusLbl.Parent = Row

    local DistLbl = Instance.new("TextLabel")
    DistLbl.Size = UDim2.new(0, 60, 0, 18)
    DistLbl.Position = UDim2.new(1, -70, 0, 8)
    DistLbl.BackgroundTransparency = 1
    DistLbl.Text = "—"
    DistLbl.TextColor3 = Theme.Accent
    DistLbl.Font = Enum.Font.GothamBold
    DistLbl.TextSize = 11
    DistLbl.Parent = Row

    local TpLbl = Instance.new("TextLabel")
    TpLbl.Size = UDim2.new(0, 60, 0, 14)
    TpLbl.Position = UDim2.new(1, -70, 0, 25)
    TpLbl.BackgroundTransparency = 1
    TpLbl.Text = isLocal and "" or "Teleport"
    TpLbl.TextColor3 = Theme.SubText
    TpLbl.Font = Enum.Font.Gotham
    TpLbl.TextSize = 9
    TpLbl.Parent = Row

    player.CharacterAdded:Connect(function()
        StatusLbl.Text = "● Online"
        StatusLbl.TextColor3 = Theme.Success
    end)

    player.CharacterRemoving:Connect(function()
        StatusLbl.Text = "● Loading..."
        StatusLbl.TextColor3 = Color3.fromRGB(255, 200, 60)
        DistLbl.Text = "—"
    end)

    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not Row.Parent then
            if conn then conn:Disconnect() end
            return
        end
        if isLocal then
            DistLbl.Text = "YOU"
            DistLbl.TextColor3 = Theme.Accent
            return
        end
        local char = player.Character
        local myChar = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and myChar and myChar:FindFirstChild("HumanoidRootPart") then
            local dist = (char.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude
            DistLbl.Text = string.format("%.0fm", dist)
        else
            DistLbl.Text = "—"
        end
    end)

    if not isLocal then
        Row.MouseEnter:Connect(function()
            TweenService:Create(Row, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            }):Play()
            TweenService:Create(RowStroke, TweenInfo.new(0.15), {
                Color = Theme.Accent,
                Transparency = 0.2
            }):Play()
        end)
        Row.MouseLeave:Connect(function()
            TweenService:Create(Row, TweenInfo.new(0.15), {
                BackgroundColor3 = Theme.Secondary
            }):Play()
            TweenService:Create(RowStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(60, 60, 80),
                Transparency = 0.6
            }):Play()
        end)

        Row.MouseButton1Click:Connect(function()
            TeleportToPlayer(player)
        end)
    end

    return Row
end

local function RefreshPlayerList()
    for _, child in pairs(PlayerListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do
        table.insert(list, p)
    end
    table.sort(list, function(a, b)
        if a == LocalPlayer then return true end
        if b == LocalPlayer then return false end
        return string.lower(a.Name) < string.lower(b.Name)
    end)
    
    for _, p in ipairs(list) do
        CreatePlayerRow(p)
    end
end

RefreshBtn.MouseButton1Click:Connect(function()
    RefreshPlayerList()
    Notify("Player list refreshed!", Theme.Accent)
end)

RefreshPlayerList()

Players.PlayerAdded:Connect(function()
    task.wait(0.2)
    RefreshPlayerList()
end)
Players.PlayerRemoving:Connect(function()
    task.wait(0.2)
    RefreshPlayerList()
end)

-- === EXTRA PAGE ===
local extraPage = tabs["Extra"].page
CreateSectionLabel(extraPage, "VISUAL")
CreateToggle(extraPage, "Full Bright", false, function(state)
    Config.FullBright = state
    if state then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
    else
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.Brightness = 1
    end
end)

CreateSectionLabel(extraPage, "ANTI GOON")
CreateToggle(extraPage, "Anti GOON MODE", false, function(state)
    Config.AntiAFK = state
end)

LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(1, 0, 0, 42)
resetBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 90)
resetBtn.BorderSizePixel = 0
resetBtn.Text = "🔄 Reset Character"
resetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
resetBtn.Font = Enum.Font.GothamBold
resetBtn.TextSize = 13
resetBtn.AutoButtonColor = false
resetBtn.Parent = extraPage

local resetCorner = Instance.new("UICorner")
resetCorner.CornerRadius = UDim.new(0, 10)
resetCorner.Parent = resetBtn

resetBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then h.Health = 0 end
    end
end)

-- === SETTINGS PAGE ===
local setPage = tabs["Settings"].page
CreateSectionLabel(setPage, "INFO")
local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 90)
info.BackgroundColor3 = Theme.Secondary
info.BorderSizePixel = 0
info.Text = "Pi3t3p0st v4.2\n\n If you see this, you're gay and a"
info.TextColor3 = Theme.SubText
info.Font = Enum.Font.Gotham
info.TextSize = 12
info.Parent = setPage

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = info

-- Activate first tab
tabs["ESP"].btn.BackgroundTransparency = 0
tabs["ESP"].btn.BackgroundColor3 = Theme.Accent
tabs["ESP"].label.TextColor3 = Color3.fromRGB(255, 255, 255)
tabs["ESP"].page.Visible = true
activeTab = "ESP"

-- ========== INITIALIZE ESP ==========
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then SpawnESP(plr) end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= LocalPlayer then SpawnESP(plr) end
end)

Players.PlayerRemoving:Connect(function(plr)
    if ESPObjects[plr] then
        pcall(function() ESPObjects[plr]:Destroy() end)
        ESPObjects[plr] = nil
    end
end)

-- ========== ESP UPDATE LOOP ==========
RunService.RenderStepped:Connect(function()
    for player, esp in pairs(ESPObjects) do
        if not esp or not esp.Parent then
            ESPObjects[player] = nil
            continue
        end

        if not Config.ESPEnabled then
            esp.Enabled = false
            continue
        end

        local char = player.Character
        if not char or not char:FindFirstChild("Head") then
            esp.Enabled = false
            continue
        end

        esp.Enabled = true

        local nameLabel = esp:FindFirstChild("NameLabel")
        if nameLabel then
            nameLabel.Visible = Config.ESPName
            nameLabel.TextColor3 = Config.ESPColor
            nameLabel.TextSize = Config.ESPTextSize
        end

        local distLabel = esp:FindFirstChild("DistLabel")
        if distLabel then
            distLabel.Visible = Config.ESPDistance
            distLabel.TextSize = Config.ESPTextSize - 2
            if Config.ESPDistance then
                local dist = (Camera.CFrame.Position - char.Head.Position).Magnitude
                distLabel.Text = string.format("[%.0fm]", dist)
            end
        end

        local healthBG = esp:FindFirstChild("HealthBG")
        if healthBG then
            healthBG.Visible = Config.ESPHealth
            if Config.ESPHealth then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                local healthBar = healthBG:FindFirstChild("HealthBar")
                if humanoid and healthBar then
                    local ratio = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                    healthBar.Size = UDim2.new(ratio, 0, 1, 0)
                    if ratio > 0.5 then
                        healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                    elseif ratio > 0.25 then
                        healthBar.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
                    else
                        healthBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                    end
                end
            end
        end
    end
end)

-- ========== MOVEMENT LOOPS ==========
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if Config.FastRunEnabled then
        humanoid.WalkSpeed = Config.WalkSpeed
        humanoid.JumpPower = Config.JumpPower
        humanoid.UseJumpPower = true
    end
    
    if Config.Noclip then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
    
    if Config.GodMode then
        if humanoid.MaxHealth ~= math.huge then
            humanoid.MaxHealth = math.huge
        end
        if humanoid.Health ~= math.huge then
            humanoid.Health = math.huge
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local h = char:FindFirstChildOfClass("Humanoid")
    if h and Config.GodMode then
        h.MaxHealth = math.huge
        h.Health = math.huge
    end
    if Config.WallWalk then
        task.wait(0.5)
        WallWalkSetup()
    end
    if Config.FlyEnabled then
        StartFly()
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Config.InfiniteJump then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- Auto-start fly if enabled
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    if Config.FlyEnabled then
        if not root:FindFirstChild("Pi3t3p0stFly") then
            StartFly()
        end
    end
end)

-- ========== INSERT TOGGLE ==========
local isVisible = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        isVisible = not isVisible
        MainFrame.Visible = isVisible
        Shadow.Visible = isVisible
    end
end)

-- ========== MINIMIZE ==========
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, v in pairs(MainFrame:GetChildren()) do
        if v ~= Header and v:IsA("GuiObject") then
            v.Visible = not minimized
        end
    end
    local targetSize = minimized and UDim2.new(0, 380, 0, 76) or UDim2.new(0, 380, 0, 560)
    TweenService:Create(MainFrame, TweenInfo.new(0.3), { Size = targetSize }):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), { Size = targetSize }):Play()
end)

-- ========== CLOSE ==========
CloseBtn.MouseButton1Click:Connect(function()
    local outTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1
    })
    outTween:Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
    outTween.Completed:Connect(function()
        pcall(function() ScreenGui:Destroy() end)
    end)

    Config.ESPEnabled = false
    Config.FastRunEnabled = false
    Config.FlyEnabled = false
    Config.Noclip = false
    Config.InfiniteJump = false
    Config.FullBright = false
    Config.AntiAFK = false
    Config.GodMode = false
    Config.WallWalk = false
    
    if wallWalkConn then wallWalkConn:Disconnect() end
    workspace.Gravity = 196.2
    
    for _, v in pairs(Camera:GetChildren()) do
        if v.Name:find("Pi3t3p0st_ESP") then v:Destroy() end
    end
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") and v.Name:find("ESP_Highlight") then v:Destroy() end
        if v.Name == "Pi3t3p0stFly" or v.Name == "Pi3t3p0stWallWalk" then v:Destroy() end
    end
    local char = LocalPlayer.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then
            h.WalkSpeed = 16
            h.JumpPower = 50
            h.PlatformStand = false
            h.MaxHealth = 100
            h.Health = 100
        end
    end
end)

-- ========== LOAD NOTIFICATION ==========
Notify("Pi3t3p0st PORNHUB INSERT to toggle", Theme.Accent)

print("[Pi3t3p0st] Loaded successfully!")