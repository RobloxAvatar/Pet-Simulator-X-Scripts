getgenv().bind = "" --// choose a keybind
getgenv().bordToggled = false --// dont change this
getgenv().justExecuted = true

function Notifiy(txt)
    local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
    v1.Message.New(txt)
end

if isfile("Pet-Sim-Keybind.json") then
    getgenv().bind = readfile("Pet-Sim-Keybind.json")
    Notifiy("Thanks for using this script! Welcome " .. game:GetService("Players").Localplayer.DisplayName)
else
Notifiy("No Keybind Found! Please use /e bind to pick a keybind!")
game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
     if string.sub(msg, 1, 8) == ("/e bind ") then
	local mainString = string.gsub(msg, "/e bind ", "")
	writefile("Pet-Sim-Keybind.json", mainString)
	getgenv().bind = mainString or readfile("Pet-Sim-Keybind.json")
	getgenv().justExecuted = false
        Notifiy("Successfully Binded! \n Keybind: " .. getgenv().bind or readfile("Pet-Sim-Keybind.json"))
    end
end)
	
repeat wait() until getgenv().bind ~= ""


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

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 11) == ("/e prename ") then
	local mainString = string.gsub(msg, "/e prename", "")
	getgenv().text=mainString
	getgenv().fakemessage="<color=orange>[Server]: <boom=true><type=black><color=red>One or more of your pets had a disallowed name and has been renamed, any further abuse will result in a lifetime ban."
	loadstring(game:HttpGet("https://raw.githubusercontent.com/inceldom/uwu/main/petsimxbot",true))()	
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
