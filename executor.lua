--////////////////////////////////////////////////////////
--                 XP‑Executor GUI
--                Solara Style Edition
--////////////////////////////////////////////////////////

local Player = game.Players.LocalPlayer

-- usuń stare GUI jeśli jest
if Player.PlayerGui:FindFirstChild("XP_Executor") then
    Player.PlayerGui.XP_Executor:Destroy()
end

local Gui = Instance.new("ScreenGui", Player.PlayerGui)
Gui.Name = "XP_Executor"
Gui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0, 520, 0, 360)
Frame.Position = UDim2.new(0.5, -260, 0.5, -180)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", Frame)
local Border = Instance.new("UIStroke", Frame)
Border.Thickness = 4
Border.Color = Color3.fromRGB(255, 0, 0)

-- Logo
local Logo = Instance.new("ImageLabel", Frame)
Logo.Size = UDim2.new(0, 80, 0, 80)
Logo.Position = UDim2.new(0, 10, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Image = "https://cdn.discordapp.com/attachments/1270001879396520060/1442839197248655471/f5QY0mqzThppjV0d8zsit-V44sCLRlD05YEVdUplP4YzPWzPP3FNIciJk7RHTgctlTKt0JdRs108-c-k-c0x00ffffff-no-rj.png"

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Text = "XP‑Executor"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 32
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Position = UDim2.new(0, 105, 0, 20)
Title.BackgroundTransparency = 1

-- Minimize button
local Min = Instance.new("TextButton", Frame)
Min.Size = UDim2.new(0, 40, 0, 40)
Min.Position = UDim2.new(1, -50, 0, 10)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 30
Min.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
Min.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Min)

-- Tabs Frame
local Tabs = Instance.new("Frame", Frame)
Tabs.Position = UDim2.new(0, 10, 0, 100)
Tabs.Size = UDim2.new(0, 150, 0, 250)
Tabs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", Tabs)

-- Add Tab Button
local AddTab = Instance.new("TextButton", Tabs)
AddTab.Size = UDim2.new(1, -20, 0, 40)
AddTab.Position = UDim2.new(0, 10, 0, 10)
AddTab.Text = "+ Add Tab"
AddTab.Font = Enum.Font.Gotham
AddTab.TextSize = 18
AddTab.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
AddTab.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", AddTab)

-- Scrolling Frame for Tabs
local Scrolling = Instance.new("ScrollingFrame", Tabs)
Scrolling.Size = UDim2.new(1, -20, 1, -60)
Scrolling.Position = UDim2.new(0, 10, 0, 60)
Scrolling.BackgroundTransparency = 1
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
Scrolling.ScrollBarThickness = 6

local TabList = Instance.new("UIListLayout", Scrolling)
TabList.Padding = UDim.new(0, 5)

-- Code Box
local CodeBox = Instance.new("TextBox", Frame)
CodeBox.Size = UDim2.new(0, 330, 0, 200)
CodeBox.Position = UDim2.new(0, 180, 0, 100)
CodeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.Font = Enum.Font.Code
CodeBox.TextSize = 18
CodeBox.MultiLine = true
CodeBox.ClearTextOnFocus = false
CodeBox.Text = "-- by XPHunterPL --"
Instance.new("UICorner", CodeBox)

local CodeScroll = Instance.new("ScrollingFrame", CodeBox)
CodeScroll.Size = UDim2.new(1, 0, 1, 0)
CodeScroll.BackgroundTransparency = 1
CodeScroll.ScrollBarThickness = 6

-- Execute Button
local Run = Instance.new("TextButton", Frame)
Run.Size = UDim2.new(0, 160, 0, 50)
Run.Position = UDim2.new(0, 180, 0, 310)
Run.Text = "EXECUTE"
Run.Font = Enum.Font.GothamBold
Run.TextSize = 20
Run.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Run.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Run)

-- Clear Button
local Clear = Instance.new("TextButton", Frame)
Clear.Size = UDim2.new(0, 160, 0, 50)
Clear.Position = UDim2.new(0, 350, 0, 310)
Clear.Text = "CLEAR"
Clear.Font = Enum.Font.GothamBold
Clear.TextSize = 20
Clear.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Clear)

-- Execute Function
Run.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(CodeBox.Text)()
    end)
    if not success then
        warn("Błąd w skrypcie: "..err)
    end
end)

Clear.MouseButton1Click:Connect(function()
    CodeBox.Text = ""
end)

-- Minimize / Restore
Min.MouseButton1Click:Connect(function()
    Frame.Visible = false
    local Restore = Instance.new("TextButton", Gui)
    Restore.Size = UDim2.new(0, 150, 0, 50)
    Restore.Position = UDim2.new(0.5, -75, 0, 20)
    Restore.Text = "XP‑Executor"
    Restore.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    Restore.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Restore)

    Restore.MouseButton1Click:Connect(function()
        Frame.Visible = true
        Restore:Destroy()
    end)
end)

-- Add Tab Functionality
AddTab.MouseButton1Click:Connect(function()
    local NewTab = Instance.new("TextButton", Scrolling)
    NewTab.Size = UDim2.new(1, -5, 0, 40)
    NewTab.Text = "New Tab"
    NewTab.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    NewTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", NewTab)

    -- Click on tab -> load its code
    NewTab.MouseButton1Click:Connect(function()
        CodeBox.Text = "-- Tab: "..NewTab.Text.." --"
    end)

    -- Double click -> rename tab
    NewTab.MouseButton1Click:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            local Rename = Instance.new("TextBox", NewTab.Parent)
            Rename.Size = NewTab.Size
            Rename.Position = NewTab.Position
            Rename.Text = NewTab.Text
            Rename.TextColor3 = Color3.fromRGB(255,255,255)
            Rename.BackgroundColor3 = Color3.fromRGB(60,0,0)
            Instance.new("UICorner", Rename)
            Rename:CaptureFocus()
            Rename.FocusLost:Connect(function(enter)
                if enter then
                    NewTab.Text = Rename.Text
                end
                Rename:Destroy()
            end)
        end
    end)

    -- Update scrolling canvas
    Scrolling.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 10)
end)
