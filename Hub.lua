-- ==========================================
-- BACK HUB: ADD YOUR SCRIPTS BELOW
-- FORMAT: {"Your Script Name", "Your_GitHub_Raw_Link"},
-- ==========================================
local scriptsList = {
    
}
-- ==========================================
-- WARNING: DO NOT MODIFY ANYTHING BELOW THIS LINE
-- ==========================================

if game.CoreGui:FindFirstChild("BACK_Hub") then
    game.CoreGui.BACK_Hub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BACK_Hub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local CircleButton = Instance.new("ImageButton")
CircleButton.Name = "CircleIcon"
CircleButton.Size = UDim2.new(0, 60, 0, 60)
CircleButton.Position = UDim2.new(0.08, 0, 0.08, 0)
CircleButton.Image = "rbxassetid://91620061996822"
CircleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CircleButton.BorderSizePixel = 0
CircleButton.Active = true
CircleButton.Draggable = true
CircleButton.Parent = ScreenGui

local UICornerCircle = Instance.new("UICorner")
UICornerCircle.CornerRadius = UDim.new(1, 0)
UICornerCircle.Parent = CircleButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainPanel"
MainFrame.Size = UDim2.new(0, 280, 0, 350)
MainFrame.Position = CircleButton.Position
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = MainFrame

local TopLogo = Instance.new("ImageLabel")
TopLogo.Size = UDim2.new(0, 38, 0, 38)
TopLogo.Position = UDim2.new(0, 10, 0, 10)
TopLogo.Image = "rbxassetid://91620061996822"
TopLogo.BackgroundTransparency = 1
TopLogo.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 0, 38)
TitleLabel.Position = UDim2.new(0, 55, 0, 10)
TitleLabel.Text = "BACK HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0, 12)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -65)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local function openHub()
    MainFrame.Position = CircleButton.Position
    CircleButton.Visible = false
    MainFrame.Visible = true
end

local function closeHub()
    CircleButton.Position = MainFrame.Position
    MainFrame.Visible = false
    CircleButton.Visible = true
end

CircleButton.MouseButton1Click:Connect(openHub)
CircleButton.TouchTap:Connect(openHub)
CloseBtn.MouseButton1Click:Connect(closeHub)
CloseBtn.TouchTap:Connect(closeHub)

for _, scriptData in ipairs(scriptsList) do
    local scriptName = scriptData[1]
    local scriptUrl = scriptData[2]

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 15
    Btn.Font = Enum.Font.GothamSemibold
    Btn.Text = scriptName
    Btn.AutoButtonColor = true
    Btn.Parent = ScrollingFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    local function executeScript()
        local success, err = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
        if not success then
            warn("BACK Hub Error executing " .. scriptName .. ": " .. tostring(err))
        end
    end

    Btn.MouseButton1Click:Connect(executeScript)
    Btn.TouchTap:Connect(executeScript)
end
