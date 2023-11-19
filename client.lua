ESX = exports['es_extended']:getSharedObject()
--print(json.encode(input))
--local PlayerData = ESX.GetPlayerData()
--local job = PlayerData.job.name

RegisterNetEvent("mor-farmin:propstart")
AddEventHandler("mor-farmin:propstart", function()
    DeleteDisplayObjects()
    for _, Coords in pairs(Config.SpawnsWeed1) do
        local prop = Coords.iprop
        ESX.Game.SpawnLocalObject(prop, Coords.coords, function()
            PlaceObjectOnGroundProperly(prop)
            FreezeEntityPosition(prop, true)
            SetModelAsNoLongerNeeded(prop)
        end)
    end
    for _, Coords2 in pairs(Config.SpawnsWeed2) do
        local prop2 = Coords2.iprop
        ESX.Game.SpawnLocalObject(prop2, Coords2.coords, function()
            PlaceObjectOnGroundProperly(prop2)
            FreezeEntityPosition(prop2, true)
            SetModelAsNoLongerNeeded(prop2)
        end)
    end
    for _, Coords3 in pairs(Config.Spawnscoka1) do
        local prop3 = Coords3.iprop
        ESX.Game.SpawnLocalObject(prop3, Coords3.coords, function()
            PlaceObjectOnGroundProperly(prop3)
            FreezeEntityPosition(prop3, true)
            SetModelAsNoLongerNeeded(prop3)
        end)
    end
end)
----
RegisterNetEvent("mor-farmin:propstart2")
AddEventHandler("mor-farmin:propstart2", function()
    DeleteDisplayObjects()
    
end)
----
local weet1 = lib.points.new({
    coords = vector3(2272.3804, 5611.5879, 53.9146),
    distance = 40,
})

function weet1:onEnter()
    local prop = 0x1AFA6A0A
    local Options = {label = 'Ernten', name = 'ernten1', event = 'mor-farmin:farmstart', distance = 2}
    TriggerEvent"mor-farmin:propstart"
    exports.ox_target:addModel(prop, Options)
end

function weet1:onExit()
    DeleteDisplayObjects()
    exports.ox_target:removeModel(0x1AFA6A0A, 'ernten1')
end
----
local weet2 = lib.points.new({
    coords = vector3(2221.5786, 5577.0151, 53.8342),
    distance = 20,
})

function weet2:onEnter()
    local prop = 0x1AFA6A0A
    local Options = {label = 'Ernten', name = 'ernten2', event = 'mor-farmin:farmstart', distance = 2}
    exports.ox_target:addModel(prop, Options)
end

function weet2:onExit()
    DeleteDisplayObjects()
    exports.ox_target:removeModel(0x1AFA6A0A, 'ernten2')
end
----
local weet3 = lib.points.new({
    coords = vector3(1410.9214, 6332.2241, 23.6109),
    distance = 15,
})

function weet3:onEnter()
    local prop = 0x1AFA6A0A
    local Options = {label = 'Ernten', name = 'ernten3', event = 'mor-farmin:farmstart', distance = 2}
    TriggerEvent"mor-farmin:propstart"
    exports.ox_target:addModel(prop, Options)
end

function weet3:onExit()
    DeleteDisplayObjects()
    exports.ox_target:removeModel(0x1AFA6A0A, 'ernten3')
end
----
----
local coka1 = lib.points.new({
    coords = vector3(1436.0978, 6365.5347, 22.9930),
    distance = 15,
})

function coka1:onEnter()
    local prop = 0x595FAA29
    local Options = {label = 'Ernten', name = 'ernten3', event = 'mor-farmin:farmstartcoca', distance = 2}
    TriggerEvent"mor-farmin:propstart"
    exports.ox_target:addModel(prop, Options)
end

function coka1:onExit()
    DeleteDisplayObjects()
    exports.ox_target:removeModel(0x595FAA29, 'ernten3')
end
----
function DeleteDisplayObjects()
    for _, Coords in pairs(Config.SpawnsWeed1) do
        local attempt = 0
        local Coords = Coords.coords
        local cveh = lib.getClosestObject(Coords, 1)
        local currentDisplayVehicle = cveh
        if currentDisplayVehicle and DoesEntityExist(currentDisplayVehicle) then
            while DoesEntityExist(currentDisplayVehicle) and not NetworkHasControlOfEntity(currentDisplayVehicle) and attempt < 100 do
                Wait(100)
                NetworkRequestControlOfEntity(currentDisplayVehicle)
                attempt = attempt + 1
            end

            if DoesEntityExist(currentDisplayVehicle) and NetworkHasControlOfEntity(currentDisplayVehicle) then
                ESX.Game.DeleteObject(currentDisplayVehicle)
            end
        end
    end
end

RegisterNetEvent("mor-farmin:farmstart")
AddEventHandler("mor-farmin:farmstart", function()
    TriggerEvent("mor-farmin:progress")
end)
RegisterNetEvent("mor-farmin:farmstartcoca")
AddEventHandler("mor-farmin:farmstartcoca", function()
    TriggerEvent("mor-farmin:progresscoca")
end)

RegisterNetEvent("mor-farmin:progress")
AddEventHandler("mor-farmin:progress", function()
    local anzahl = math.random(1,4)
    local data = {item = 'afghanzweig', menge = anzahl}
    if lib.progressCircle({
        duration = 8000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            scenario = 'PROP_HUMAN_BUM_BIN',
        },
    })
    then
        TriggerServerEvent('mor-farming:additem', data)
        DeleteDisplayObjectsfarm()
    end
end)

RegisterNetEvent("mor-farmin:progresscoca")
AddEventHandler("mor-farmin:progresscoca", function()
    local anzahl = math.random(1,4)
    local data = {item = 'kokablatt', menge = anzahl}
    if lib.progressCircle({
        duration = 8000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            scenario = 'PROP_HUMAN_BUM_BIN',
        },
    })
    then
        TriggerServerEvent('mor-farming:additem', data)
        DeleteDisplayObjectsfarm()
    end
end)

function DeleteDisplayObjectsfarm()
        local playerCoords = GetEntityCoords(PlayerPedId())
        local attempt = 0
        local cveh = lib.getClosestObject(playerCoords, 2)
        local currentDisplayVehicle = cveh
        if currentDisplayVehicle and DoesEntityExist(currentDisplayVehicle) then
            while DoesEntityExist(currentDisplayVehicle) and not NetworkHasControlOfEntity(currentDisplayVehicle) and attempt < 100 do
                Wait(100)
                NetworkRequestControlOfEntity(currentDisplayVehicle)
                attempt = attempt + 1
            end

            if DoesEntityExist(currentDisplayVehicle) and NetworkHasControlOfEntity(currentDisplayVehicle) then
                ESX.Game.DeleteObject(currentDisplayVehicle)
            end
        end
end