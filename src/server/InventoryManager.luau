local InventoryManager = {}
InventoryManager.__index = InventoryManager

function InventoryManager.new()
	local obj = setmetatable({}, InventoryManager)
	obj.Inventories = {}
	return obj
end

function InventoryManager:AddInventory(key, data)
	if self.Inventories[key] then
		return
	end

	self.Inventories[key] = data or {}
end

function InventoryManager:AddItem(key, item, value)
	if not self.Inventories[key] then
		return
	end
	if not self.Inventories[key][item] then
		self.Inventories[key][item] = value
	end

	self.Inventories[key][item] += value
end

function InventoryManager:RemoveItem(key, item, value)
	if not self.Inventories[key] then
		return
	end
	if not self.Inventories[key][item] then
		return
	end

	self.Inventories[key][item] -= value
end
print(1)
print(2)

return InventoryManager
