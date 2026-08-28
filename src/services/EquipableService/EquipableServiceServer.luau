--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryServiceServer = require(ReplicatedStorage.Services.InventoryService.InventoryServiceServer)

local EquipableService = {}

function EquipableService.init(self: EquipableService, InventoryService: InventoryServiceServer.InventoryServiceServer)
	return true, `EquipableService init success`
end

function EquipableService.destroy(self: EquipableService)
	return true, `EquipableService destroy success`
end

export type EquipableService = typeof(EquipableService)

return EquipableService :: EquipableService
