local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Data = require(ReplicatedStorage.Shared.Data).client

Data.Inventory.Changed(function(n)
	print(n)
end)
