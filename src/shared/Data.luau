local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataServiceTyped = require(ReplicatedStorage.Packages.DataServiceTyped)

local template = {
	Inventory = {},
}

return DataServiceTyped({ template = template })
