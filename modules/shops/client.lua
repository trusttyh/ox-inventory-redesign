if not lib then return end

local shopTypes = {}
local shops = {}
local SpawnedPeds = {}
local createBlip = require 'modules.utils.client'.CreateBlip

for shopType, shopData in pairs(lib.load('data.shops') or {} --[[@as table<string, OxShop>]]) do
    local shop = {
        name = shopData.name,
        permissionKey = shopData.permissionKey,
        groups = shopData.groups or shopData.jobs,
        blip = shopData.blip,
        label = shopData.label,
        icon = shopData.icon
    }

    if shared.target then
        shop.model = shopData.model
        shop.targets = shopData.targets
        shop.peds = shopData.peds
    else
        shop.locations = shopData.locations
    end

    shopTypes[shopType] = shop
    local blip = shop.blip

    if blip then
        blip.name = ('ox_shop_%s'):format(shopType)
        AddTextEntry(blip.name, shop.name or shopType)
    end
end

---@param point CPoint
local function onEnterShop(point)
    if not point.entity then
        local model = lib.requestModel(point.ped)

        if not model then return end

        local entity = CreatePed(0, model, point.coords.x, point.coords.y, point.coords.z, point.heading, false, true)

        if point.scenario then TaskStartScenarioInPlace(entity, point.scenario, 0, true) end

        SetModelAsNoLongerNeeded(model)
        FreezeEntityPosition(entity, true)
        SetEntityInvincible(entity, true)
        SetBlockingOfNonTemporaryEvents(entity, true)

        exports.ox_target:addLocalEntity(entity, {
            {
                icon = point.icon or 'fas fa-shopping-basket',
                label = point.label,
                permissionKey = point.permissionKey,
                groups = point.groups,
                onSelect = function()
                    client.openInventory('shop', { id = point.invId, type = point.type })
                end,
                iconColor = point.iconColor,
                distance = point.shopDistance or 2.0
            }
        })

        point.entity = entity
    end
end

local Utils = require 'modules.utils.client'

local function onExitShop(point)
    local entity = point.entity

    if not entity then return end

    exports.ox_target:removeLocalEntity(entity)
    Utils.DeleteEntity(entity)

    point.entity = nil
end

local function hasShopAccess(shop)
    local hasGroupAccess = not shop.groups or client.hasGroup(shop.groups)
    local hasWorkplaceAccess = not shop.workplace or client.hasWorkplace(shop.workplace)
    -- local hasDutyAccess = not shop.reqDuty or client.isOnDuty(shop.groups) -- This is made for Sandbox Framework. Uncomment if you use Sandbox Framework.
    return hasGroupAccess and hasWorkplaceAccess  -- and hasDutyAccess
end

local function getShopName(shop, target)
    if target and target.name then
        return target.name
    end
    return nil
end

local function cleanupPeds()
    for i = 1, #SpawnedPeds do
        local ped = SpawnedPeds[i]
        if DoesEntityExist(ped) then
            DeletePed(ped)
        end
    end
    table.wipe(SpawnedPeds)
end

local function cleanup()
    cleanupPeds()
end

local function wipeShops()
    for i = 1, #shops do
        local shop = shops[i]

        if shop.zoneId then
            exports.ox_target:removeZone(shop.zoneId)
            shop.zoneId = nil
        end

        if shop.remove then
            if shop.entity then onExitShop(shop) end

            shop:remove()
        end

        if shop.blip then
            RemoveBlip(shop.blip)
        end
    end

    table.wipe(shops)
    cleanup()
end

local isRefreshing = false

local function refreshShops()
    if isRefreshing then return end
    isRefreshing = true

    wipeShops()

    local id = 0

    for type, shop in pairs(shopTypes) do
        local blip = shop.blip
        local label = shop.label or locale('open_label', shop.name)

        if shop.peds then
            for i = 1, #shop.peds do
                local ped = shop.peds[i]
                local model = ped.model
                local coords = ped.coords
                local heading = ped.heading or 0.0
                local distance = ped.distance or 2.0
                local renderDistance = ped.renderDistance or 25.0
                local label = ped.label or locale('open_label', shop.name)
                local icon = ped.icon or 'fas fa-shopping-basket'
                local animation = ped.animation or nil

                local success = lib.requestModel(model)
                if not success then
                    warn(('Failed to load ped model "%s" for shop "%s"'):format(model, type))
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
                    if _G.type(animation) == 'string' and animation:match('^WORLD_HUMAN_') then     -- Must use _G.type to get the function because of lua syntax
                        TaskStartScenarioInPlace(pedEntity, animation, 0, true)
                    elseif _G.type(animation) == 'table' and animation.dict and animation.name then -- Must use _G.type to get the function because of lua syntax
                        lib.requestAnimDict(animation.dict)
                        TaskPlayAnim(pedEntity, animation.dict, animation.name, 8.0, -8.0, -1, animation.flag or 1, 0,
                            false, false, false)
                    end
                end

                if shared.target then
                    exports.ox_target:addLocalEntity(pedEntity, {
                        {
                            label = label,
                            permissionKey = shop.permissionKey,
                            canInteract = shop.groups and function()
                                return client.hasGroup(shop.groups)
                            end or nil,
                            onSelect = function()
                                client.openInventory('shop', { type = type, id = i })
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
            if shop.model then
                if not hasShopAccess(shop) then goto skipLoop end

                exports.ox_target:removeModel(shop.model, shop.name)
                exports.ox_target:addModel(shop.model, {
                    {
                        name = shop.name,
                        icon = shop.icon or 'fas fa-shopping-basket',
                        label = label,
                        onSelect = function()
                            client.openInventory('shop', { type = type })
                        end,
                        distance = 2
                    },
                })
            elseif shop.targets then
                for i = 1, #shop.targets do
                    local target = shop.targets[i]
                    local shopid = ('%s-%s'):format(type, i)
                    local locationName = getShopName(shop, target)
                    local locationLabel = locationName and locale('open_label', locationName) or
                        (shop.label or locale('open_label', shop.name))

                    if target.ped then
                        id += 1

                        shops[id] = lib.points.new({
                            coords = target.loc,
                            heading = target.heading,
                            distance = 60,
                            inv = 'shop',
                            invId = i,
                            type = type,
                            blip = blip and hasShopAccess(shop) and createBlip(blip, target.loc),
                            ped = target.ped,
                            scenario = target.scenario,
                            label = locationLabel,
                            permissionKey = shop.permissionKey,
                            groups = shop.groups,
                            icon = shop.icon or 'fas fa-shopping-basket',
                            iconColor = target.iconColor,
                            onEnter = onEnterShop,
                            onExit = onExitShop,
                            shopDistance = target.distance,
                        })
                    else
                        if not hasShopAccess(shop) then goto nextShop end

                        id += 1

                        shops[id] = {
                            zoneId = Utils.CreateBoxZone(target, {
                                {
                                    name = shopid,
                                    icon = shop.icon or 'fas fa-shopping-basket',
                                    label = locationLabel,
                                    permissionKey = shop.permissionKey,
                                    groups = shop.groups,
                                    onSelect = function()
                                        client.openInventory('shop', { id = i, type = type })
                                    end,
                                    iconColor = target.iconColor,
                                    distance = target.distance
                                }
                            }),
                            blip = blip and createBlip(blip, target.coords)
                        }
                    end

                    ::nextShop::
                end
            end
        elseif shop.locations then
            if not hasShopAccess(shop) then goto skipLoop end
            local shopPrompt = { icon = 'fas fa-shopping-basket' }

            for i = 1, #shop.locations do
                local location = shop.locations[i]
                local coords = location.coords or location
                local locationLabel = shop.label or locale('open_label', shop.name)
                id += 1

                shops[id] = lib.points.new(coords, 16, {
                    coords = coords,
                    distance = 16,
                    inv = 'shop',
                    invId = i,
                    type = type,
                    marker = client.shopmarker,
                    prompt = {
                        options = shop.icon and { icon = shop.icon } or shopPrompt,
                        message = ('**%s**  \n%s'):format(locationLabel,
                            locale('interact_prompt', GetControlInstructionalButton(0, 38, true):sub(3)))
                    },
                    nearby = Utils.nearbyMarker,
                    blip = blip and createBlip(blip, coords)
                })
            end
        end

        ::skipLoop::
    end

    isRefreshing = false
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        cleanup()
    end
end)

return {
    refreshShops = refreshShops,
    wipeShops = wipeShops,
}
