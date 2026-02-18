-- Haupt-Loop zur Bereinigung der Zonen
Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, zone in ipairs(Config.MLO_Locations) do
            local dist = #(playerCoords - zone.coords)
            
            -- Nur aktiv werden, wenn der Spieler in der Nähe ist
            if dist < 150.0 then 
                local min = zone.coords - vector3(zone.radius, zone.radius, zone.radius)
                local max = zone.coords + vector3(zone.radius, zone.radius, zone.radius)
                
                -- Blockiert Ambient-Szenarios (NPCs setzen sich nicht auf unsichtbare Stühle etc.)
                AddScenarioBlockingArea(min.x, min.y, min.z, max.x, max.y, max.z, false, true, true, true)
                
                -- Löscht Peds im Radius, falls sie bereits gespawnt sind
                if dist < zone.radius + 10.0 then
                    ClearAreaOfPeds(zone.coords.x, zone.coords.y, zone.coords.z, zone.radius, 1)
                end
            end
        end

        -- Alle 5 Sekunden prüfen reicht für die Performance völlig aus
        Citizen.Wait(5000)
    end
end)

-- Deaktiviert Laufpfade für NPCs beim Start
Citizen.CreateThread(function()
    for _, zone in ipairs(Config.MLO_Locations) do
        local min = zone.coords - vector3(zone.radius, zone.radius, zone.radius)
        local max = zone.coords + vector3(zone.radius, zone.radius, zone.radius)
        
        SetPedPathsInArea(min.x, min.y, min.z, max.x, max.y, max.z, false)
    end
end)