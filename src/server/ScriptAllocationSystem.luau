--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local ScriptAllocationSystem = {}

function ScriptAllocationSystem.init(self: ScriptAllocationSystem)
	self.Janitor = { Connections = { ["ServicesChildAdded"] = {} } }
	for _, serviceFolder in pairs(ReplicatedStorage.Services:GetChildren()) do
		self.Janitor.Connections["ServicesChildAdded"][serviceFolder.Name] = serviceFolder.ChildAdded:Connect(
			function(instance: Instance)
				local success, message = self:tryAllocate(instance)
				if not success then
					warn(message)
				else
					print(message)
				end
			end
		)

		for _, instance in pairs(serviceFolder:GetChildren()) do
			local success, message = self:tryAllocate(instance)
			if not success then
				warn(message)
			else
				print(message)
			end
		end
	end
	return true, "ScriptAllocationSystem init success"
end

function ScriptAllocationSystem.needAllocate(self: ScriptAllocationSystem, instance: Instance)
	if not instance:IsA("ModuleScript") then
		return false
	end
	if not string.find(instance.Name, "ServiceServer") then
		return false
	end

	return true
end

function ScriptAllocationSystem.tryAllocate(self: ScriptAllocationSystem, instance: Instance)
	if not instance.Parent then
		return false, `instance hasn't parent to create parent folder`
	end
	if not self:needAllocate(instance) then
		return false, `{instance.Name} not need to allocate`
	end

	local folder = ServerScriptService:FindFirstChild("Services") :: Folder
	if not folder then
		folder = Instance.new("Folder")
		folder.Name = "Services"
		folder.Parent = ServerScriptService
	end
	local folder2 = folder:FindFirstChild(instance.Parent.Name)
	if not folder2 then
		folder2 = Instance.new("Folder")
		folder2.Name = instance.Parent.Name
		folder2.Parent = ServerScriptService
		folder2.Parent = folder
	end
	instance.Parent = folder2

	return true, `instance {instance.Name} allocated to ServerScriptSerivce->Services->{instance.Parent.Name} folder`
end

function ScriptAllocationSystem.destroy(self: ScriptAllocationSystem)
	for _, service in pairs(self.Janitor.Connections) do
		for _, connection in pairs(service) do
			connection:Disconnect()
		end
	end

	return true, `ScriptAllocationSystem destroy success`
end

type ScriptAllocationSystem = typeof(ScriptAllocationSystem) & {
	Janitor: { Connections: { [string]: { [string]: RBXScriptConnection } } },
}

return ScriptAllocationSystem :: ScriptAllocationSystem
