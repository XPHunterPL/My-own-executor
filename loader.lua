--//////////////////////////////////////////////////////
--                XP‑EXecutor LOADER
--                   KEY SYSTEM
--//////////////////////////////////////////////////////

local KEY = "XPHunterPL" -- <<< TWÓJ KEY
local DC_LINK = "https://discord.gg/XeftTS8SC"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- usuń stare GUI jeśli jest
if Player:WaitForChild("PlayerGui"):FindFirstChild("XP_KeySystem") then
    Player.PlayerGui.XP_KeySystem:Destroy()
end

local Gui = Instance.new("ScreenGui", Player.PlayerGui)
Gui.Name = "XP_KeySystem"
Gui.ResetOnSpawn = false

local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Thickness = 5
Stroke.Color = Color3.fromRGB(255, 0, 0)

Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26
Title.Text = "XP‑EXecutor Key"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0, 280, 0, 40)
KeyBox.Position = UDim2.new(0.5, -140, 0, 70)
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 18
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyBox)

local Confirm = Instance.new("TextButton", Frame)
Confirm.Size = UDim2.new(0, 120, 0, 40)
Confirm.Position = UDim2.new(0.5, -60, 0, 130)
Confirm.Text = "UNLOCK"
Confirm.Font = Enum.Font.GothamBold
Confirm.TextSize = 20
Confirm.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Confirm)

local Wrong = Instance.new("TextLabel", Frame)
Wrong.Size = UDim2.new(1, 0, 0, 30)
Wrong.Position = UDim2.new(0, 0, 0, 170)
Wrong.BackgroundTransparency = 1
Wrong.Font = Enum.Font.GothamBold
Wrong.TextSize = 18
Wrong.Text = ""
Wrong.TextColor3 = Color3.fromRGB(255, 0, 0)

local Discord = Instance.new("TextButton", Frame)
Discord.Size = UDim2.new(0, 120, 0, 30)
Discord.Position = UDim2.new(0.5, -60, 1, -35)
Discord.Text = "Get Key (Discord)"
Discord.Font = Enum.Font.Gotham
Discord.TextSize = 16
Discord.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Discord)

Discord.MouseButton1Click:Connect(function()
    setclipboard(DC_LINK)
    Wrong.Text = "Discord link copied!"
end)

Confirm.MouseButton1Click:Connect(function()
    if KeyBox.Text == KEY then
        Wrong.Text = "Key Accepted!"
        task.wait(0.5)
        Gui:Destroy()

        -- Wczytanie prawdziwego executora:
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XPHunterPL/My-own-executor/main/executor.lua"))()
    else
        Wrong.Text = "Wrong.Text = "Wrong key!""
    end
end)
