--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryServiceClient = require(ReplicatedStorage.Services.InventoryService.InventoryServiceClient)

local EquipableService = {}

function EquipableService.init(self: EquipableService, InventoryService: InventoryServiceClient.InventoryServiceClient)
	return true, `EquipableService init success`
end

function EquipableService.destroy(self: EquipableService)
	return true, `EquipableService destroy success`
end

export type EquipableService = typeof(EquipableService)

return EquipableService :: EquipableService
