--!strict

local InventoryServiceClient = {}

function InventoryServiceClient.init(self: InventoryServiceClient, inventory, settings)
	self.inventory = inventory
	self.settings = settings

	return true, `InventoryServiceClient init success`
end

function InventoryServiceClient.destroy(self: InventoryServiceClient)
	table.clear(self.inventory)
	table.clear(self.settings)

	return true, `InventoryServiceClient destroy success`
end

export type InventoryServiceClient = typeof(InventoryServiceClient) & {
	inventory: {},
	settings: {},
}

return InventoryServiceClient :: InventoryServiceClient
