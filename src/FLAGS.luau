local FLGS = {}
local Signal = require(script.Signal)

local Flags = {}
local Events = {}
local Frozen = {}

function FLGS:SetFlag(FlagName: string, FlagValue)
	if not Events[FlagName] then
		Events[FlagName] = Signal.new()
	end

	if Frozen[FlagName] then
		print(`Flag {FlagName} is frozen`)
		return
	end

	local OldValue = Flags[FlagName]

	Flags[FlagName] = FlagValue
	Events[FlagName]:Fire(FlagValue, OldValue)
end

function FLGS:GetFlag(FlagName: string): any
	assert(Flags[FlagName] ~= nil, `Invalid flag name {FlagName}`)
	return Flags[FlagName]
end

function FLGS:FlagChanged(FlagName)
	if Events[FlagName] then
		return Events[FlagName]
	end
end

function FLGS:GetAllFlags()
	return Flags
end

function FLGS:FreezeFlag(FlagName: string)
	table.insert(Frozen, FlagName)
end

function FLGS:UnfreezeFlag(FlagName: string)
	table.remove(Frozen, table.find(Frozen, FlagName))
end

function FLGS:RemoveFlag(FlagName: string)
	table.remove(Frozen, table.find(Frozen, FlagName))
	table.remove(Flags, table.find(Flags, FlagName))
	table.remove(Events, table.find(Events, FlagName))
end

return FLGS
