local FLGS = {}
local Signal = require(script.Signal)

local Flags = {}
local Events = {}
local Frozen = {}

function FLGS:SetFlag(FlagName: string, FlagValue: any): nil
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
	return
end

function FLGS:GetFlag(FlagName: string): any
	return assert(Flags[FlagName] ~= nil and Flags[FlagName], `Invalid flag name {FlagName}`)
end

function FLGS:FlagChanged(FlagName): Signal.Signal?
	if Events[FlagName] then
		return Events[FlagName]
	end

	return nil
end

function FLGS:GetAllFlags(): { [string]: any }
	return Flags
end

function FLGS:FreezeFlag(FlagName: string): nil
	table.insert(Frozen, FlagName)
	return
end

function FLGS:UnfreezeFlag(FlagName: string): nil
	table.remove(Frozen, table.find(Frozen, FlagName))
	return
end

function FLGS:RemoveFlag(FlagName: string): nil
	table.remove(Frozen, table.find(Frozen, FlagName))
	table.remove(Flags, table.find(Flags, FlagName))
	table.remove(Events, table.find(Events, FlagName))
	return
end

return FLGS
