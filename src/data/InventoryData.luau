--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataServiceTyped = require(ReplicatedStorage.Packages.DataServiceTyped)

local PLAYER_DATA_TEMPLATE = {
	["glock-17"] = { magazine = 17, ammo = 102 },
}

return DataServiceTyped({ template = PLAYER_DATA_TEMPLATE })
