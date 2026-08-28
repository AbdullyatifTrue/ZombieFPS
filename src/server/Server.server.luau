--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryServiceServer = require(ReplicatedStorage.Services.InventoryService.InventoryServiceServer)
local ScriptAllocationSysem = require(script.Parent.ScriptAllocationSystem)
local PlayersData = require(ReplicatedStorage.Data.Data).server

local debug = {} :: { [string]: { [number]: any } }

debug["ScriptAllocationSysem"] = { ScriptAllocationSysem:init() }
debug["InventoryServiceServer"] = { InventoryServiceServer:init() }

for _, state in pairs(debug) do
	if state[1] == false then
		warn(state[2])
	else
		print(state[2])
	end
end

Players.PlayerAdded:Connect(function(player: Player)
	PlayersData.Service:waitForData(player)
	local data = PlayersData[player]
	print(data)
	-- InventoryServiceServer:addInventory(player.UserId, data)
end)
