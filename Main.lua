local url = ""
local key = ""
local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
local messaged = false

v1.Message.New("No Webhook Found! Type /e webhook WEBHOOKHERE!")

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 11) == ("/e webhook ") then
        local mainString = string.gsub(msg, "/e webhook ", "")
        url = mainString
    end
end)

repeat wait() until url ~= ""

wait(1)

v1.Message.New("Key Needed! You can find the key in the discord!")

local data1 = {
      ["content"] = "",
	  ["embeds"] = {{
	  ["title"] = "__**Key System!**__",
	  ["description"] = "made by TravisSnot",
	  ["type"] = "rich",
	  ["color"] = tonumber(0x0E980E),
	  ["url"] = "https://raw.githubusercontent.com/RobloxAvatar/Pet-Simulator-X-Scripts/main/key.lua"
	}}
}

local newdata1 = game:GetService("HttpService"):JSONEncode(data1)

local headers1 = {
   ["content-type"] = "application/json"
}
request1 = http_request or request or HttpPost or syn.request

local llll = {Url = url, Body = newdata1, Method = "POST", Headers = headers1}

request1(llll)

wait(1.5)

v1.Message.New("Use /e key KEYHERE!")

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 7) == ("/e key ") then
        messaged = true
        local mainString = string.gsub(msg, "/e key ", "")
        key = mainString
        if (key == game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Pet-Simulator-X-Scripts/main/key.lua", true)) then
            coroutine.wrap()
        end
    else
        repeat wait() until key and url ~= ""
        repeat wait() until messaged == true 
        if (key ~= game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Pet-Simulator-X-Scripts/main/key.lua", true)) then
            v1.Message.New("Invalid Key! You can find the key in the discord!")
        end
    end
end)

repeat wait() until url ~= ""
repeat wait() until key ~= ""
   
local data = {
    ["content"] = "",
	["embeds"] = {{
	["title"] = "__**Pet Simulator X Script**__",
	["description"] = "made by TravisSnot",
	["type"] = "rich",
	["color"] = tonumber(0x0E980E),
	}}
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
    ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request

local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}

request(abcdef)
            
wait(2)

v1.Message.New("Script Loaded!")

wait()

loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Pet-Simulator-X-Scripts/main/Script.lua", true))()
