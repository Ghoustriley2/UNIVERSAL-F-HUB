-- UNIVERSAL F HUB v0.3

-- Проверка на повторный запуск
if game.CoreGui:FindFirstChild("UniversalFHub") then
    game.CoreGui:FindFirstChild("UniversalFHub"):Destroy()
end

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UniversalFHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Text = "UNIVERSAL F HUB v0.3"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.Parent = MainFrame

-- Кнопка "Закрыть"
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

-- Кнопка "Свернуть"
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -60, 0, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.new(1, 1, 0)
MinimizeBtn.Font = Enum.Font.Code
MinimizeBtn.TextSize = 14
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 0)
MinimizeBtn.Parent = MainFrame

local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, obj in ipairs(MainFrame:GetChildren()) do
        if obj ~= Title and obj ~= CloseBtn and obj ~= MinimizeBtn then
            obj.Visible = not minimized
        end
    end
end)

-- Переключатель Невидимости
local invisible = false
local InvisBtn = Instance.new("TextButton")
InvisBtn.Size = UDim2.new(0, 200, 0, 30)
InvisBtn.Position = UDim2.new(0.5, -100, 0, 40)
InvisBtn.Text = "Невидимость: OFF"
InvisBtn.TextColor3 = Color3.new(1, 1, 1)
InvisBtn.Font = Enum.Font.SourceSansBold
InvisBtn.TextSize = 14
InvisBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InvisBtn.Parent = MainFrame

InvisBtn.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        invisible = not invisible
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = invisible and 1 or 0
            end
        end
        InvisBtn.Text = "Невидимость: " .. (invisible and "ON" or "OFF")
    end
end)

-- ESP
local espEnabled = false
local EspBtn = Instance.new("TextButton")
EspBtn.Size = UDim2.new(0, 200, 0, 30)
EspBtn.Position = UDim2.new(0.5, -100, 0, 80)
EspBtn.Text = "ESP: OFF"
EspBtn.TextColor3 = Color3.new(1, 1, 1)
EspBtn.Font = Enum.Font.SourceSansBold
EspBtn.TextSize = 14
EspBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
EspBtn.Parent = MainFrame

local function toggleESP()
    espEnabled = not espEnabled
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                if espEnabled then
                    local box = Instance.new("BillboardGui", head)
                    box.Name = "UFH_ESP"
                    box.Size = UDim2.new(0, 100, 0, 40)
                    box.AlwaysOnTop = true
                    local label = Instance.new("TextLabel", box)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = player.Name
                    label.TextColor3 = Color3.new(1, 0, 0)
                    label.TextStrokeTransparency = 0
                else
                    if head:FindFirstChild("UFH_ESP") then
                        head:FindFirstChild("UFH_ESP"):Destroy()
                    end
                end
            end
        end
    end
    EspBtn.Text = "ESP: " .. (espEnabled and "ON" or "OFF")
end

EspBtn.MouseButton1Click:Connect(toggleESP)

-- Speedhack
local speedOn = false
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 200, 0, 30)
SpeedBtn.Position = UDim2.new(0.5, -100, 0, 120)
SpeedBtn.Text = "Speedhack: OFF"
SpeedBtn.TextColor3 = Color3.new(1, 1, 1)
SpeedBtn.Font = Enum.Font.SourceSansBold
SpeedBtn.TextSize = 14
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBtn.Parent = MainFrame

SpeedBtn.MouseButton1Click:Connect(function()
    local human = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if human then
        speedOn = not speedOn
        human.WalkSpeed = speedOn and 100 or 16
        SpeedBtn.Text = "Speedhack: " .. (speedOn and "ON" or "OFF")
    end
end)