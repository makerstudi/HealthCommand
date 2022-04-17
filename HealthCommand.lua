local player = game.Players.LocalPlayer
local character1 = player.Character
local mouse = player:GetMouse()

function GetPlayer(name)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.DisplayName:lower():sub(1, #name) == name:lower() or v.Name:lower():sub(1, #name) == name:lower() then
            return v
        end
    end    
end

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local char = plr.Character
local place = game.PlaceId
local prefix = "/server:"
local Health = 0

plr.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 15) == prefix .. "health " then
        Health = string.sub(msg, 16)
        char.Humanoid.MaxHealth = Health
        char.Humanoid.Health = Health
    elseif string.sub(msg, 1, 13) == prefix .. "reset" then
        char.Humanoid.MaxHealth = 100
        char.Humanoid.Health = 0
    elseif string.sub(msg, 1, 13) == prefix .. "leave" then
        plr:Kick("your is Leave Server :D")
    elseif string.sub(msg, 1, 14) == prefix .. "prefix" then
        wait(0.2)
        game.StarterGui:SetCore("ChatMakeSystemMessage",{
            Text = "[Server]: 현재 접두사: '" .. prefix .. "' 입니다.",
            Font = Enum.Font.SourceSansBold,
            Color = Color3.fromRGB(0, 120, 255),
            FontSize = Enum.FontSize.Size96
        })
    end
end)
