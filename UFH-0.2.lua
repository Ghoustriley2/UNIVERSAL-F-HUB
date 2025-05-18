-- UNIVERSAL F HUB v0.2

-- Проверка на повторный запуск
if game.CoreGui:FindFirstChild("UniversalFHub") then
    game.CoreGui:FindFirstChild("UniversalFHub"):Destroy()
end

-- GUI
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
Title.Text = "UNIVERSAL F HUB v0.2"
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
    for _, obj in pairs(MainFrame:GetChildren()) do
        if obj:IsA("TextButton") and obj ~= CloseBtn and obj ~= MinBtn then
            obj.Visible = not minimized
        end
    end
    MainFrame.Size = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 200)
end)

-- Кнопка: Невидимость
local InvisibleBtn = Instance.new("TextButton")
InvisibleBtn.Size = UDim2.new(0, 200, 0, 40)
InvisibleBtn.Position = UDim2.new(0.5, -100, 0, 50)
InvisibleBtn.Text = "Сделать игрока невидимым"
InvisibleBtn.TextColor3 = Color3.new(1, 1, 1)
InvisibleBtn.Font = Enum.Font.SourceSansBold
InvisibleBtn.TextSize = 14
InvisibleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InvisibleBtn.Parent = MainFrame

InvisibleBtn.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = 1
            end
        end
    end
end)

-- Кнопка ESP
local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0, 200, 0, 40)
ESPBtn.Position = UDim2.new(0.5, -100, 0, 100)
ESPBtn.Text = "Включить ESP"
ESPBtn.TextColor3 = Color3.new(1, 1, 1)
ESPBtn.Font = Enum.Font.SourceSansBold
ESPBtn.TextSize = 14
ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPBtn.Parent = MainFrame

local function createESP(player)
    if player == game.Players.LocalPlayer then return end
    local esp = Instance.new("Highlight")
    esp.Name = "F_ESP"
    esp.FillColor = Color3.new(1, 0, 0)
    esp.OutlineColor = Color3.new(1, 1, 1)
    esp.FillTransparency = 0.5
    esp.OutlineTransparency = 0
    esp.Adornee = player.Character
    esp.Parent = player.Character
end

ESPBtn.MouseButton1Click:Connect(function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character and not player.Character:FindFirstChild("F_ESP") then
            createESP(player)
        end
    end
    game.Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function()
            wait(1)
            createESP(plr)
        end)
    end)
end)