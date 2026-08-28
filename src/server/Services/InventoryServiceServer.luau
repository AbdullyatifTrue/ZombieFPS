--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Inventory = require(ReplicatedStorage.Data.InventoryData).server

local InventoryServiceServer = {}

type Inventory = typeof(Inventory)

function InventoryServiceServer.init(self: InventoryServiceServer)
	self.inventories = {} :: { Inventory }
end

function InventoryServiceServer.addInventory(self: InventoryServiceServer, key, data)
	if self.inventories[key] then
		return
	end

	self.inventories[key] = data
end

type InventoryServiceServer = typeof(InventoryServiceServer) & {
	inventories: { [any]: any },
}

return InventoryServiceServer :: InventoryServiceServer
