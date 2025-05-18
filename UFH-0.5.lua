-- UNIVERSAL F HUB v0.5

-- Проверка на повторный запуск
if game.CoreGui:FindFirstChild("UniversalFHub") then
    game.CoreGui:FindFirstChild("UniversalFHub"):Destroy()
end

-- GUI
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

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Title.Text = "UNIVERSAL F HUB v0.5"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.Parent = MainFrame

-- Кнопка Закрыть
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

-- Кнопка Свернуть
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -60, 0, 0)
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Font = Enum.Font.Code
MinBtn.TextSize = 14
MinBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MinBtn.Parent = MainFrame

local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    for _, child in ipairs(MainFrame:GetChildren()) do
        if child:IsA("TextButton") and child ~= CloseBtn and child ~= MinBtn then
            child.Visible = not isMinimized
        end
    end
    MainFrame.Size = isMinimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 200)
end)

-- Невидимость
local invisible = false
local InviBtn = Instance.new("TextButton")
InviBtn.Size = UDim2.new(0, 200, 0, 40)
InviBtn.Position = UDim2.new(0.5, -100, 0, 40)
InviBtn.Text = "Вкл/Выкл Невидимость"
InviBtn.TextColor3 = Color3.new(1, 1, 1)
InviBtn.Font = Enum.Font.SourceSansBold
InviBtn.TextSize = 14
InviBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InviBtn.Parent = MainFrame

InviBtn.MouseButton1Click:Connect(function()
    invisible = not invisible
    local char = game.Players.LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = invisible and 1 or 0
            end
        end
    end
end)

-- ESP
local espEnabled = false
local espObjects = {}

local function toggleESP()
    espEnabled = not espEnabled

    for _, v in pairs(espObjects) do
        v:Destroy()
    end
    espObjects = {}

    if not espEnabled then return end

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = player.Character.Head
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 100, 0, 40)
            billboard.Name = "ESPTag"

            local nameLabel = Instance.new("TextLabel", billboard)
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = (player.Team ~= game.Players.LocalPlayer.Team) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
            nameLabel.TextStrokeTransparency = 0.5
            nameLabel.TextScaled = true
            nameLabel.Font = Enum.Font.SourceSansBold

            billboard.Parent = player.Character.Head
            table.insert(espObjects, billboard)
        end
    end
end

local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0, 200, 0, 40)
ESPBtn.Position = UDim2.new(0.5, -100, 0, 90)
ESPBtn.Text = "Вкл/Выкл ESP"
ESPBtn.TextColor3 = Color3.new(1, 1, 1)
ESPBtn.Font = Enum.Font.SourceSansBold
ESPBtn.TextSize = 14
ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPBtn.Parent = MainFrame

ESPBtn.MouseButton1Click:Connect(toggleESP)