-- UNIVERSAL F HUB v0.1

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
Title.Text = "UNIVERSAL F HUB v0.1"
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

-- Пример кнопки в меню
local ExampleBtn = Instance.new("TextButton")
ExampleBtn.Size = UDim2.new(0, 200, 0, 40)
ExampleBtn.Position = UDim2.new(0.5, -100, 0, 50)
ExampleBtn.Text = "Сделать игрока невидимым"
ExampleBtn.TextColor3 = Color3.new(1, 1, 1)
ExampleBtn.Font = Enum.Font.SourceSansBold
ExampleBtn.TextSize = 14
ExampleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ExampleBtn.Parent = MainFrame

ExampleBtn.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = 1
            end
        end
    end
end)
