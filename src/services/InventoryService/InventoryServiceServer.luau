--!strict
local InventoryServiceServer = {}

function InventoryServiceServer.init(self: InventoryServiceServer)
	self.inventories = {}
	return true, `InventoryServiceServer init success`
end

function InventoryServiceServer.addInventory(self: InventoryServiceServer, key: any, data)
	if self.inventories[key] then
		return false, `Inventory already exist`
	end
	self.inventories[key] = data
	return true, `Created inventory with key {key}`
end

function InventoryServiceServer.removeInventory(self: InventoryServiceServer, key: any)
	if not self.inventories[key] then
		return false, `Inventory doesn't exist`
	end
	self.inventories[key] = nil
	return true, `Removed inventory with key {key}`
end

function InventoryServiceServer.destroy(self: InventoryServiceServer)
	table.clear(self.inventories)

	return true, `InventoryServiceServer destroy success`
end

export type InventoryServiceServer = typeof(InventoryServiceServer) & {
	inventories: { [any]: {} },
}

return InventoryServiceServer :: InventoryServiceServer
