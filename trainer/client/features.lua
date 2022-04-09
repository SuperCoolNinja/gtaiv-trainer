function MainMenu()
    if Menu.GetSub() == Menu.subs["main_menu"] then --> Submenu :
        for _, v in pairs(config.menu.mainSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["playerlist"] then --> playerlist menu :
        for _,v in pairs(config.playersList) do 
            Menu.SubmenuOption(v.name, Menu.subs["playerListOptions"], function() 
                config.serverID = v.serverID
                config.userName = v.name
                config.targetIndex = v.targetIndex
                Wait(250); --> Wait added for small config to let time for data to update with new one. 
            end)
        end
    elseif Menu.GetSub() == Menu.subs["playerListOptions"] then --> playerlist options menu :
        for k, v in pairs(config.menu.playerListOptions) do 
            Menu.Option(v.label, function()
                if (k == 1) then 
                    teleportToPlayer(config.targetIndex);
                    Citizen.Trace("TP TO : " ..config.userName .. " with server ID ! " ..config.serverID);
                end
            end)
        end
    elseif Menu.GetSub() == Menu.subs["self"] then --> Self menu :
        Menu.BooleanOption("GodMode", config.player.isGodMode, function(_cb) config.player.isGodMode = _cb end)
        Menu.BooleanOption("NeverWanted", config.player.isNeverWantedOn, function(_cb) config.player.isNeverWantedOn = _cb end)
       
        Menu.BooleanOption("NoClip", config.player.isNoClipOn, function(_cb) 
            config.player.isNoClipOn = _cb
            if (not config.player.isNoClipOn) then 
                SetCharCollision(config.localPlayer, true);
                SetCharVisible(config.localPlayer, true);

                if(IsCharInAnyCar(config.localPlayer)) then
                    SetCarCollision(config.player.getActualCar, true);
                end
            end
        end)

        Menu.FloatOption("NoClip speed", config.player.noClipSpeed, 1.0, 2.0, 0.1, function(_cb) config.player.noClipSpeed = _cb end)

        for k, v in pairs(config.menu.selfOptions) do 
           Menu.Option(v.label, function()
               if (k == 1) then 
                  teleportToWaypoint();
               end
           end)
        end

        for _, v in pairs(config.menu.selfSub) do
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["change_character"] then -->  menu character :
        for _, v in pairs(config.menu.characterListOptions) do 
            Menu.Option(v.label, function()
                changeModel(v.id)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["spawn_cars"] then --> Category vehicles :
        for _, v in pairs(config.menu.spawnCarsSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["option_cars"] then --> Options vehicles :
        if(IsCharInAnyCar(config.localPlayer)) then 

            Menu.BooleanOption("Boost mode", config.vehicle.isBoostOn, function(_cb) 
                config.vehicle.isBoostOn = _cb

                if(config.vehicle.isBoostOn) then
                    ShowText("~g~Boost Mode enabled.", 1000);
                    Wait(1000);
                    ShowText("~y~keyboard ~w~press E key | ~y~controller ~w~press the Klaxon button..", 10000); 
                else
                    ShowText("~r~Boost Mode disabled.", 1000);
                end
            end)
            Menu.BooleanOption("GodMode", config.vehicle.isGodMode, function(_cb) config.vehicle.isGodMode = _cb end)

            for k, v in pairs(config.menu.carsOptions) do 
                Menu.Option(v.label, function()
                    if (k == 1) then
                        repairCar(GetCarCharIsUsing(config.localPlayer));
                    elseif (k == 2) then 
                        flipCar(GetCarCharIsUsing(config.localPlayer));
                    elseif (k == 3) then 
                        ChangeCarColour(config.player.getActualCar, math.random(1, 255), math.random(1, 255));
                        SetExtraCarColours(config.player.getActualCar, math.random(1, 255), math.random(1, 255));
                    end
                end)
            end

            for _, v in pairs(config.menu.carsOptionsSub) do 
                Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
            end
        end
    elseif Menu.GetSub() == Menu.subs["neons"] then --> List neons :
        if(IsCharInAnyCar(GetPlayerChar(-1))) then
            for _, v in pairs(config.menu.neonsOptions) do 
                Menu.Option(v.label, function()
                    spawnNeon(v.color);
                end)
            end
        end
    elseif Menu.GetSub() == Menu.subs["weapons"] then  --> list Weapons :
        for _, v in pairs(config.menu.weaponsOptions) do 
            Menu.Option(v.label, function()
                giveWeapon(v.id)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["weathers"] then --> list Weathers :
       for _, v in pairs(config.menu.weathersOptions) do 
            Menu.Option(v.label, function()
                TriggerServerEvent("sv_changeWeathers", tonumber(v.id))
            end)
       end
    -- elseif Menu.GetSub() == Menu.subs["time"] then
    elseif Menu.GetSub() == Menu.subs["credits"] then  --> List of credits options :
        for _, v in pairs(config.menu.creditsOptions) do 
            Menu.Option(v.label, function() end)
        end
    end
end


function CarsMenu()
    if Menu.GetSub() == Menu.subs["cars"] then
        for _, v in pairs(config.vehicleModel.cars) do 
            Menu.Option(v.name, function()
                spawnCar(v.model)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["bikes"] then
        for _, v in pairs(config.vehicleModel.bikes) do 
            Menu.Option(v.name, function()
                spawnCar(v.model)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["boats"] then
        for _, v in pairs(config.vehicleModel.boats) do 
            Menu.Option(v.name, function()
                spawnCar(v.model)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["aircraft"] then
        for _, v in pairs(config.vehicleModel.aircraft) do 
            Menu.Option(v.name, function()
                spawnCar(v.model)
            end)
        end
    end
end