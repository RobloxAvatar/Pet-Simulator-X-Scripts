getgenv().bind = "" --// choose a keybind
getgenv().bordToggled = false --// dont change this
getgenv().justExecuted = false
getgenv().stop = false

local gmppath = require(game:GetService("ReplicatedStorage").Framework.Modules.Client["5 | Gamepasses"])
gmppath.Owns = function() return true end

local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))

if not isfile("Pet-SimX-Keybind.lua") then
    v1.Message.New("Thanks for using this script! Welcome " .. game:GetService("Players").LocalPlayer.DisplayName .. "!")
    wait(1.25)
    v1.Message.New("No saved keybind found! Please try /e hbind KEYBINDHERE!")
    getgenv().stop = true
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
     if string.sub(msg, 1, 9) == ("/e hbind ") then
        local mainString = string.gsub(msg, "/e hbind ", "")
      	getgenv().bind = mainString
      	v1.Message.New("Successfully Binded! Keybind: " .. string.upper(getgenv().bind))
	wait(1.25)
	if getgenv().stop == false then
	   getgenv().justExecuted = true
	end
	writefile("Pet-SimX-Keybind.lua", mainString)
    end
end)

if isfile("Pet-SimX-Keybind.lua") then
   getgenv().bind = readfile("Pet-SimX-Keybind.lua")
   wait(1.25)
   v1.Message.New("Successfully Loaded Your Last Keybind! Keybind: " .. string.upper(readfile("Pet-SimX-Keybind.lua")))
   getgenv().justExecuted = true
end

repeat wait() until getgenv().bind ~= ""

if getgenv().justExecuted == true then
   wait(1.25)
   v1.Message.New("Thanks for using this script! Welcome " .. game:GetService("Players").LocalPlayer.DisplayName .. "!")
   getgenv().bind = readfile("Pet-SimX-Keybind.lua")
end

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
