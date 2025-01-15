ESX = nil 

RegisterCommand("aiauto", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        -- Haal voertuiggegevens op
        local model = GetEntityModel(vehicle)
        local name = GetDisplayNameFromVehicleModel(model)
        local speed = GetEntitySpeed(vehicle) * 3.6 -- Omrekenen naar km/h
        local health = GetVehicleEngineHealth(vehicle)
        local fuel = GetVehicleFuelLevel(vehicle)

        if health < 400 then
            local autoschade = 'Auto moet spoedig reperatie krijgen.'
        elseif health < 600 then
            local autoschade = 'Auto heeft een geel lampje, kijk uit.'
        elseif health > 600 then
            local autoschade = 'Auto is nog gezond en kan nog veel kilometers rijden.'
        end

        -- Stuur informatie naar de speler
        TriggerEvent('chat:addMessage', {
            args = {
                "[AI-Assistent] Voertuiginformatie:",
                "Model: " .. name,
                "Snelheid: " .. math.floor(speed) .. " km/u",
                "Motorstatus: " .. autoschade .. ",
                "Brandstofniveau: " .. math.floor(fuel) .. "%"
            }
        })  
    else
        -- Geen voertuig gevonden
        TriggerEvent('chat:addMessage', {
            args = {"[AI-Assistent] Je zit niet in een voertuig."}
        })
    end
end, false)

-- Functie voor brandstofniveau (indien nodig)
function GetVehicleFuelLevel(vehicle)
    if DecorExistOn(vehicle, "fuel_level") then
        return DecorGetFloat(vehicle, "fuel_level")
    else
        return math.random(50, 100) -- Simuleer brandstof als het niet beschikbaar is
    end
end

RegisterCommand("aiweer", function()
    local weather = GetWeatherTypeTransition()
    TriggerEvent('chat:addMessage', {args = {"[AI-Assistent]", "Het huidige weer is: " .. weather}})
end, false)


-- AI Vluchtroute Generator (/aiontsnap)

RegisterCommand("aiontsnap", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Lijst met veilige locaties (kan worden uitgebreid)
    local safeLocations = {
        {x = 124.23, y = -1287.71, z = 29.27, label = "Schuilplaats 1"},
        {x = -303.91, y = -830.91, z = 32.42, label = "Schuilplaats 2"},
        {x = 895.35, y = -179.63, z = 74.70, label = "Schuilplaats 3"},
        {x = -1021.49, y = -2645.91, z = 13.76, label = "Schuilplaats 4"}
    }

    -- Selecteer de dichtstbijzijnde veilige locatie
    local closestLocation = nil
    local closestDistance = math.huge

    for _, location in ipairs(safeLocations) do
        local distance = #(vector3(location.x, location.y, location.z) - playerCoords)
        if distance < closestDistance then
            closestDistance = distance
            closestLocation = location
        end
    end

    -- Controleer of een locatie is gevonden
    if closestLocation then
        -- Zet de waypoint naar de veilige locatie
        SetNewWaypoint(closestLocation.x, closestLocation.y)

        -- Meld dit aan de speler
        TriggerEvent('chat:addMessage', {
            args = {"[AI-Assistent] Vluchtroute ingesteld naar: " .. closestLocation.label}
        })
    else
        -- Geen locatie gevonden
        TriggerEvent('chat:addMessage', {
            args = {"[AI-Assistent] Geen veilige locatie beschikbaar."}
        })
    end
end, false)
