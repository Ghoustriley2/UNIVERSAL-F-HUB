-- UNIVERSAL F HUB v0.4

if game.CoreGui:FindFirstChild("UniversalFHub") then
    game.CoreGui:FindFirstChild("UniversalFHub"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UniversalFHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Text = "UNIVERSAL F HUB v0.4"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.Parent = MainFrame

-- Кнопка "X" — Закрыть
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 0, 0)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 14
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Кнопка "—" — Свернуть
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -60, 0, 0)
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.new(1, 1, 0)
MinBtn.Font = Enum.Font.Code
MinBtn.TextSize = 14
MinBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 0)
MinBtn.Parent = MainFrame

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, v in pairs(MainFrame:GetChildren()) do
        if v:IsA("TextButton") and v ~= CloseBtn and v ~= MinBtn then
            v.Visible = not minimized
        end
    end
    MainFrame.Size = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 200)
end)

-- ESP Toggle
local espEnabled = false
local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0, 200, 0, 30)
ESPBtn.Position = UDim2.new(0.5, -100, 0, 40)
ESPBtn.Text = "ESP: OFF"
ESPBtn.TextColor3 = Color3.new(1, 1, 1)
ESPBtn.Font = Enum.Font.SourceSansBold
ESPBtn.TextSize = 14
ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPBtn.Parent = MainFrame

ESPBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    ESPBtn.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    -- Добавь сюда ESP-логику при необходимости
end)

-- Невидимость Toggle
local invisEnabled = false
local InvisBtn = Instance.new("TextButton")
InvisBtn.Size = UDim2.new(0, 200, 0, 30)
InvisBtn.Position = UDim2.new(0.5, -100, 0, 80)
InvisBtn.Text = "Невидимость: OFF"
InvisBtn.TextColor3 = Color3.new(1, 1, 1)
InvisBtn.Font = Enum.Font.SourceSansBold
InvisBtn.TextSize = 14
InvisBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InvisBtn.Parent = MainFrame

InvisBtn.MouseButton1Click:Connect(function()
    invisEnabled = not invisEnabled
    InvisBtn.Text = invisEnabled and "Невидимость: ON" or "Невидимость: OFF"
    local char = game.Players.LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = invisEnabled and 1 or 0
            end
        end
    end
end)

-- SpeedHack Toggle
local speedEnabled = false
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 200, 0, 30)
SpeedBtn.Position = UDim2.new(0.5, -100, 0, 120)
SpeedBtn.Text = "SpeedHack: OFF"
SpeedBtn.TextColor3 = Color3.new(1, 1, 1)
SpeedBtn.Font = Enum.Font.SourceSansBold
SpeedBtn.TextSize = 14
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBtn.Parent = MainFrame

SpeedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedBtn.Text = speedEnabled and "SpeedHack: ON" or "SpeedHack: OFF"
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speedEnabled and 100 or 16
    end
end)

-- Infinity Jump Toggle
local infJump = false
local InfJumpBtn = Instance.new("TextButton")
InfJumpBtn.Size = UDim2.new(0, 200, 0, 30)
InfJumpBtn.Position = UDim2.new(0.5, -100, 0, 160)
InfJumpBtn.Text = "Infinity Jump: OFF"
InfJumpBtn.TextColor3 = Color3.new(1, 1, 1)
InfJumpBtn.Font = Enum.Font.SourceSansBold
InfJumpBtn.TextSize = 14
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InfJumpBtn.Parent = MainFrame

InfJumpBtn.MouseButton1Click:Connect(function()
    infJump = not infJump
    InfJumpBtn.Text = infJump and "Infinity Jump: ON" or "Infinity Jump: OFF"
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState("Jumping")
        end
    end
end)