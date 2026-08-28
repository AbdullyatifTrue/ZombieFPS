--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Inventory = require(ReplicatedStorage.Data.InventoryData).client

local InventoryServiceClient = {}

type Inventory = typeof(Inventory)

function InventoryServiceClient.init(self: InventoryServiceClient)
	self.inventory = Inventory
end

type InventoryServiceClient = typeof(InventoryServiceClient) & {
	inventory: Inventory,
}

return InventoryServiceClient
