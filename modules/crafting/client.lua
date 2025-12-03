if not lib then return end

local CraftingBenches = {}
local SpawnedProps = {}
local SpawnedPeds = {}
local Items = require 'modules.items.client'
local createBlip = require 'modules.utils.client'.CreateBlip
local Utils = require 'modules.utils.client'
local prompt = {
    options = { icon = 'fa-wrench' },
    message = ('**%s**  \n%s'):format(locale('open_crafting_bench'),
        locale('interact_prompt', GetControlInstructionalButton(0, 38, true):sub(3)))
}

---@param id number
---@param data table
local function createCraftingBench(id, data)
    CraftingBenches[id] = {}
    local recipes = data.items

    if recipes then
        data.slots = #recipes

        for i = 1, data.slots do
            local recipe = recipes[i]
            local item = Items[recipe.name]

            if item then
                recipe.weight = item.weight
                recipe.slot = i
            else
                warn(('failed to setup crafting recipe (bench: %s, slot: %s) - item "%s" does not exist'):format(id, i,
                    recipe.name))
            end
        end

        local blip = data.blip

        if blip then
            blip.name = blip.name or ('ox_crafting_%s'):format(data.label and id or 0)
            AddTextEntry(blip.name, data.label or locale('crafting_bench'))
        end

        if data.props then
            for i = 1, #data.props do
                local prop = data.props[i]
                local model = prop.model
                local coords = prop.coords
                local heading = prop.heading or 0.0
                local distance = prop.distance or 2.0
                local renderDistance = prop.renderDistance or 25.0
                local label = prop.label or locale('open_crafting_bench')
                local icon = prop.icon or 'fas fa-wrench'

                local success = lib.requestModel(model)
                if not success then
                    warn(('Failed to load model "%s" for crafting bench "%s"'):format(model, id))
                    goto continue
                end

                local propEntity = CreateObject(model, coords.x, coords.y, coords.z, false, false, false)
                SetEntityHeading(propEntity, heading)
                FreezeEntityPosition(propEntity, true)
                SetEntityLodDist(propEntity, renderDistance)
                SetModelAsNoLongerNeeded(model)

                SpawnedProps[#SpawnedProps + 1] = propEntity

                if shared.target then
                    exports.ox_target:addLocalEntity(propEntity, {
                        {
                            label = label,
                            canInteract = data.groups and function()
                                return client.hasGroup(data.groups)
                            end or nil,
                            onSelect = function()
                                client.openInventory('crafting', { id = id, index = i })
                            end,
                            distance = distance,
                            icon = icon,
                        }
                    })
                end

                if blip then
                    createBlip(blip, coords)
                end
                ::continue::
            end
        end

        if data.peds then
            for i = 1, #data.peds do
                local ped = data.peds[i]
                local model = ped.model
                local coords = ped.coords
                local heading = ped.heading or 0.0
                local distance = ped.distance or 2.0
                local renderDistance = ped.renderDistance or 25.0
                local label = ped.label or locale('open_crafting_bench')
                local icon = ped.icon or 'fas fa-wrench'
                local animation = ped.animation or nil

                local success = lib.requestModel(model)
                if not success then
                    warn(('Failed to load ped model "%s" for crafting bench "%s"'):format(model, id))
                    goto continue_ped
                end

                local pedEntity = CreatePed(4, model, coords.x, coords.y, coords.z, heading, false, true)
                SetEntityHeading(pedEntity, heading)
                FreezeEntityPosition(pedEntity, true)
                SetEntityInvincible(pedEntity, true)
                SetBlockingOfNonTemporaryEvents(pedEntity, true)
                SetEntityLodDist(pedEntity, renderDistance)
                SetModelAsNoLongerNeeded(model)

                SpawnedPeds[#SpawnedPeds + 1] = pedEntity

                if animation then
                    if type(animation) == 'string' and animation:match('^WORLD_HUMAN_') then
                        TaskStartScenarioInPlace(pedEntity, animation, 0, true)
                    elseif type(animation) == 'table' and animation.dict and animation.name then
                        lib.requestAnimDict(animation.dict)
                        TaskPlayAnim(pedEntity, animation.dict, animation.name, 8.0, -8.0, -1, animation.flag or 1, 0,
                            false, false, false)
                    end
                end

                if shared.target then
                    exports.ox_target:addLocalEntity(pedEntity, {
                        {
                            label = label,
                            canInteract = data.groups and function()
                                return client.hasGroup(data.groups)
                            end or nil,
                            onSelect = function()
                                client.openInventory('crafting', { id = id, index = i })
                            end,
                            distance = distance,
                            icon = icon,
                        }
                    })
                end

                if blip then
                    createBlip(blip, coords)
                end
                ::continue_ped::
            end
        end

        if shared.target then
            data.points = nil
            if data.zones then
                for i = 1, #data.zones do
                    local zone = data.zones[i]
                    zone.name = ("craftingbench_%s:%s"):format(id, i)
                    zone.id = id
                    zone.index = i
                    zone.options = {
                        {
                            label = zone.label or locale('open_crafting_bench'),
                            canInteract = data.groups and function()
                                return client.hasGroup(data.groups)
                            end or nil,
                            onSelect = function()
                                client.openInventory('crafting', { id = id, index = i })
                            end,
                            distance = zone.distance or 2.0,
                            icon = zone.icon or 'fas fa-wrench',
                        }
                    }

                    exports.ox_target:addBoxZone(zone)

                    if blip then
                        createBlip(blip, zone.coords)
                    end
                end
            end
        elseif data.points then
            data.zones = nil

            for i = 1, #data.points do
                local coords = data.points[i]

                lib.points.new({
                    coords = coords,
                    distance = 16,
                    benchid = id,
                    index = i,
                    inv = 'crafting',
                    prompt = prompt,
                    marker = client.craftingmarker,
                    nearby = Utils.nearbyMarker
                })

                if blip then
                    createBlip(blip, coords)
                end
            end
        end

        CraftingBenches[id] = data
    end
end

local function cleanupProps()
    for i = 1, #SpawnedProps do
        local prop = SpawnedProps[i]
        if DoesEntityExist(prop) then
            DeleteObject(prop)
        end
    end
    SpawnedProps = {}
end

local function cleanupPeds()
    for i = 1, #SpawnedPeds do
        local ped = SpawnedPeds[i]
        if DoesEntityExist(ped) then
            DeletePed(ped)
        end
    end
    SpawnedPeds = {}
end

local function cleanupAll()
    cleanupProps()
    cleanupPeds()
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        cleanupAll()
    end
end)

RegisterNetEvent('ox_inventory:registerCraftingBench', function(id, data)
    createCraftingBench(id, data)
end)

-- for id, data in pairs(lib.load('data.crafting') or {}) do createCraftingBench(data.name or id, data) end
lib.callback('ox_inventory:getCraftingBenches', false, function(data) for id, data in pairs(data) do createCraftingBench(id, data) end end)

return CraftingBenches
