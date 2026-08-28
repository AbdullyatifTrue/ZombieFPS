local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DataServiceTyped = require(ReplicatedStorage.Packages.DataServiceTyped)

local PLAYER_DATA_TEMPLATE = {
	inventory = { ["glock-17"] = { magazine = 17, ammo = 102 } } :: { [string]: any },
	settings = {} :: { [string]: any },
}

return DataServiceTyped({
	useMock = RunService:IsStudio(), -- mock data in Studio; real saving in production
	template = PLAYER_DATA_TEMPLATE,
})
