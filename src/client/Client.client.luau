local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryServiceClient = require(ReplicatedStorage.Services.InventoryService.InventoryServiceClient)
local EquipableServiceClient = require(ReplicatedStorage.Services.EquipableService.EquipableServiceClient)

local PlayerData = require(ReplicatedStorage.Data.Data).client

InventoryServiceClient:init(PlayerData.inventory, PlayerData.settings)
EquipableServiceClient:init(InventoryServiceClient)
