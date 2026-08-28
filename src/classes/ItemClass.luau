--!strict

local ItemClass = {}

type ItemClass = typeof(ItemClass)

function ItemClass.new(config)
	local self = setmetatable({}, ItemClass)

	self.viewmodel = config.Viewmodel :: Model?
	self._equipped = false

	return self :: ItemClass
end

function ItemClass.Equip(self: ItemClass) end

function ItemClass.Unequip(self: ItemClass) end

function ItemClass.Destroy(self: ItemClass) end

return ItemClass
