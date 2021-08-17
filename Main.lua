getgenv().bind = "q" --// choose a keybind
getgenv().bordToggled = false --// dont change this

if syn then

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 9) == ("/e rchat ") then
        local mainString = string.gsub(msg, "/e rchat", "")
        local chatString = "<rainbow=chat> [" .. game:GetService("Players").LocalPlayer.DisplayName .. "]: " .. mainString
        local args = {
            [1] = chatString,
            [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    end
end)

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e codes" then
        if syn then
            syn.write_clipboard("https://progameguides.com/roblox/roblox-pet-simulator-x-codes/")
        else
            setclipboard("https://progameguides.com/roblox/roblox-pet-simulator-x-codes/")
        end
    end
end)

local gmppath = require(game:GetService("ReplicatedStorage").Framework.Modules.Client["5 | Gamepasses"])
gmppath.Owns = function() return true end

game:GetService("UserInputService").InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode[string.upper(getgenv().bind)] then
        if getgenv().bordToggled == false then
            getgenv().bordToggled = true
            local ohTable1 = {
	            [1] = true
            }
            workspace.__THINGS.__REMOTES["update hoverboard state"]:FireServer(ohTable1)
            getgenv().bordToggled = true
        else
            if getgenv().bordToggled == true then
                getgenv().bordToggled = false
                local ohTable1 = {
	                [1] = false
                }
                workspace.__THINGS.__REMOTES["update hoverboard state"]:FireServer(ohTable1)
                getgenv().bordToggled = false
            end
        end
    end
end)
end
