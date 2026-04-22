if not lib then return end

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerData(key, value)
    PlayerData[key] = value
    OnPlayerData(key, value)
end

---Checks whether the player has a required group and rank
---@param group string | table<string, number | number[]>
---@return string? groupName
---@return number? groupRank
function client.hasGroup(group)
	if not PlayerData.loaded then return end

	if type(group) == 'table' then
		for name, requiredRank in pairs(group) do
			local groupRank = PlayerData.groups[name]
			if groupRank then
				if type(requiredRank) == 'table' then
					if lib.table.contains(requiredRank, groupRank) then
						return name, groupRank
					end
				else
					if groupRank >= (requiredRank or 0) then
						return name, groupRank
					end
				end
			end
		end
	else
		local groupRank = PlayerData.groups[group]
		if groupRank then
			return group, groupRank
		end
	end
end

function client.hasWorkplace(workplace)
    if not PlayerData.loaded or not PlayerData.workplaces then return false end

    if type(workplace) == 'table' then
        for _, wp in pairs(workplace) do
            for jobId, playerWorkplace in pairs(PlayerData.workplaces) do
                if playerWorkplace == wp then
                    return true, jobId, playerWorkplace
                end
            end
        end
    else
        for jobId, playerWorkplace in pairs(PlayerData.workplaces) do
            if playerWorkplace == workplace then
                return true, jobId, playerWorkplace
            end
        end
    end

    return false
end

-- function client.isOnDuty(jobName)
--     if not PlayerData.loaded then return false end

--     if jobName then
--         if type(jobName) == 'table' then
--             for _, job in ipairs(jobName) do
--                 if exports['sandbox-jobs']:DutyGet(job) ~= false then
--                     return true
--                 end
--             end
--             return false
--         else
--             return exports['sandbox-jobs']:DutyGet(jobName) ~= false
--         end
--     else
--         return exports['sandbox-jobs']:DutyGet() ~= false
--     end
-- end

local Shops = require 'modules.shops.client'
local Utils = require 'modules.utils.client'
local Weapon = require 'modules.weapon.client'
local Items = require 'modules.items.client'

function client.onLogout()
    if not PlayerData.loaded then return end

    if client.parachute then
        Utils.DeleteEntity(client.parachute[1])
        client.parachute = false
    end

    for _, point in pairs(client.drops) do
        if point.entity then
            Utils.DeleteEntity(point.entity)
        end

        point:remove()
    end

    for _, v in pairs(Items --[[@as table]]) do
        v.count = 0
    end

    PlayerData.loaded = false
    client.drops = nil

    client.closeInventory()
    Shops.wipeShops()

    if client.interval then
        ClearInterval(client.interval)
        ClearInterval(client.tick)
    end

    Weapon.Disarm()
end

local success, result = pcall(lib.load, ('modules.bridge.%s.client'):format(shared.framework))

if not success then
    lib.print.error(result)
    lib = nil
    return
end
