--////////////////////////////////////////////////////////
--                 XP-EXecutor GUI + KEY
--            ———— by XPHunterPL ————
--////////////////////////////////////////////////////////

local CORRECT_KEY = "XPHunterPL"
local Player = game.Players.LocalPlayer

-- Usuń stare GUI jeśli istnieje
if Player.PlayerGui:FindFirstChild("XP_Executor") then
    Player.PlayerGui.XP_Executor:Destroy()
end
if Player.PlayerGui:FindFirstChild("XP_KeySystem") then
    Player.PlayerGui.XP_KeySystem:Destroy()
end

----------------------------------------------------------
--                   KEY SYSTEM WINDOW
----------------------------------------------------------

local KeyGui = Instance.new("ScreenGui", Player.PlayerGui)
KeyGui.Name = "XP_KeySystem"

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Size = UDim2.new(0, 400, 0, 220)
KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Instance.new("UICorner", KeyFrame)
Instance.new("UIStroke", KeyFrame).Color = Color3.fromRGB(255, 0, 0)

local Title = Instance.new("TextLabel", KeyFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "XP-EXecutor | Key System"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 50)
KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 20
Instance.new("UICorner", KeyBox)

local Submit = Instance.new("TextButton", KeyFrame)
Submit.Size = UDim2.new(0.8, 0, 0, 50)
Submit.Position = UDim2.new(0.1, 0, 0.65, 0)
Submit.Text = "UNLOCK"
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 22
Submit.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Submit)

local Wrong = Instance.new("TextLabel", KeyFrame)
Wrong.Size = UDim2.new(1, 0, 0, 30)
Wrong.Position = UDim2.new(0, 0, 0.85, 0)
Wrong.Text = ""
Wrong.Font = Enum.Font.GothamBold
Wrong.TextSize = 18
Wrong.TextColor3 = Color3.fromRGB(255, 50, 50)
Wrong.BackgroundTransparency = 1

----------------------------------------------------------
--            FUNKCJA DO ODPALENIA GŁÓWNEGO GUI
----------------------------------------------------------

local function LoadExecutor()
    KeyGui:Destroy()

    ----------------------------------------------------------
    --                 XP-EXECUTOR GUI
    ----------------------------------------------------------

    local Gui = Instance.new("ScreenGui", Player.PlayerGui)
    Gui.Name = "XP_Executor"

    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0, 520, 0, 360)
    Frame.Position = UDim2.new(0.5, -260, 0.5, -180)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)

    local Border = Instance.new("UIStroke", Frame)
    Border.Thickness = 6
    Border.Color = Color3.fromRGB(255, 0, 0)

    local Corner = Instance.new("UICorner", Frame)
    Corner.CornerRadius = UDim.new(0, 8)

    -- LOGO
    local Logo = Instance.new("ImageLabel", Frame)
    Logo.Size = UDim2.new(0, 80, 0, 80)
    Logo.Position = UDim2.new(0, 10, 0, 10)
    Logo.BackgroundTransparency = 1
    Logo.Image = "https://cdn.discordapp.com/attachments/1270001879396520060/1442839197248655471/f5QY0mqzThppjV0d8zsit-V44sCLRlD05YEVdUplP4YzPWzPP3FNIciJk7RHTgctlTKt0JdRs108-c-k-c0x00ffffff-no-rj.png"

    local Title = Instance.new("TextLabel", Frame)
    Title.Text = "XP-EXecutor"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 32
    Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    Title.Position = UDim2.new(0, 105, 0, 20)
    Title.BackgroundTransparency = 1

    local Min = Instance.new("TextButton", Frame)
    Min.Size = UDim2.new(0, 40, 0, 40)
    Min.Position = UDim2.new(1, -50, 0, 10)
    Min.Text = "-"
    Min.Font = Enum.Font.GothamBold
    Min.TextSize = 30
    Min.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Min.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Min)

    -- TABS
    local Tabs = Instance.new("Frame", Frame)
    Tabs.Position = UDim2.new(0, 10, 0, 100)
    Tabs.Size = UDim2.new(0, 150, 0, 250)
    Tabs.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    Instance.new("UICorner", Tabs)

    local AddTab = Instance.new("TextButton", Tabs)
    AddTab.Size = UDim2.new(1, -20, 0, 40)
    AddTab.Position = UDim2.new(0, 10, 0, 10)
    AddTab.Text = "+ Add Tab"
    AddTab.Font = Enum.Font.Gotham
    AddTab.TextSize = 18
    AddTab.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    AddTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", AddTab)

    local Scrolling = Instance.new("ScrollingFrame", Tabs)
    Scrolling.Size = UDim2.new(1, -20, 1, -60)
    Scrolling.Position = UDim2.new(0, 10, 0, 60)
    Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    Scrolling.BackgroundTransparency = 1

    local TabList = Instance.new("UIListLayout", Scrolling)
    TabList.Padding = UDim.new(0, 5)

    -- CODE BOX
    local CodeBox = Instance.new("TextBox", Frame)
    CodeBox.Size = UDim2.new(0, 330, 0, 200)
    CodeBox.Position = UDim2.new(0, 180, 0, 100)
    CodeBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    CodeBox.Font = Enum.Font.Code
    CodeBox.TextSize = 18
    CodeBox.MultiLine = true
    CodeBox.Text = "-- by XPHunterPL --"
    Instance.new("UICorner", CodeBox)

    -- EXECUTE BUTTON
    local Run = Instance.new("TextButton", Frame)
    Run.Size = UDim2.new(0, 160, 0, 50)
    Run.Position = UDim2.new(0, 180, 0, 310)
    Run.Text = "EXECUTE"
    Run.Font = Enum.Font.GothamBold
    Run.TextSize = 20
    Run.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Run.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Run)

    local Clear = Instance.new("TextButton", Frame)
    Clear.Size = UDim2.new(0, 160, 0, 50)
    Clear.Position = UDim2.new(0, 350, 0, 310)
    Clear.Text = "CLEAR"
    Clear.Font = Enum.Font.GothamBold
    Clear.TextSize = 20
    Clear.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Clear)

    -- FUNCTIONS
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

    Min.MouseButton1Click:Connect(function()
        Frame.Visible = false
        local Restore = Instance.new("TextButton", Gui)
        Restore.Size = UDim2.new(0, 150, 0, 50)
        Restore.Position = UDim2.new(0.5, -75, 0, 20)
        Restore.Text = "XP-EXecutor"
        Restore.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
        Restore.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", Restore)

        Restore.MouseButton1Click:Connect(function()
            Frame.Visible = true
            Restore:Destroy()
        end)
    end)

    AddTab.MouseButton1Click:Connect(function()
        local NewTab = Instance.new("TextButton", Scrolling)
        NewTab.Size = UDim2.new(1, -5, 0, 40)
        NewTab.Text = "New Tab"
        NewTab.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        NewTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", NewTab)

        NewTab.MouseButton1Click:Connect(function()
            CodeBox.Text = "-- Tab: " .. NewTab.Text
        end)

        Scrolling.CanvasSize = UDim2.new(0, 0, 0, Scrolling.CanvasSize.Y.Offset + 45)
    end)
end

----------------------------------------------------------
--               CHECK KEY BUTTON FUNCTION
----------------------------------------------------------

Submit.MouseButton1Click:Connect(function()
    if KeyBox.Text == CORRECT_KEY then
        LoadExecutor()
    else
        Wrong.Text = "Wrong key! Get key on Discord: discord.gg/XeftTS8SC"
    end
end)
