function MainMenu()
    if Menu.GetSub() == Menu.subs["main_menu"] then
        --Submenu :

        for _, v in pairs(config.menu.mainSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["self"] then
        --Self menu :
        Menu.BooleanOption("GodMode", config.player.isGodMode, function(_cb) config.player.isGodMode = _cb end)

        for k, v in pairs(config.menu.selfSub) do 
           Menu.Option(v.label, function()
               if (k == 1) then 
                 TeleportToWaypoint();
               end
           end)
       end
    elseif Menu.GetSub() == Menu.subs["spawn_cars"] then
        
        --Category vehicles :
        for _, v in pairs(config.menu.spawnCarsSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["option_cars"] then
        if(IsCharInAnyCar(GetPlayerChar(-1))) then 
            
            --Category vehicles :
            for k, v in pairs(config.menu.carsOptions) do 
                Menu.Option(v.label, function()
                    if (k == 1) then 
                    elseif (k == 2) then 
                    elseif (k == 3) then 
                    elseif (k == 4) then 
                    elseif (k == 5) then
                        ChangeCarColour(config.player.getActualCar, 255, 200);
                        SetExtraCarColours(config.player.getActualCar, 200, 154);
                    end
                end)
            end

            --Sub options :
            for _, v in pairs(config.menu.carsOptionsSub) do 
                Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
            end
        end
    elseif Menu.GetSub() == Menu.subs["neons"] then
        if(IsCharInAnyCar(GetPlayerChar(-1))) then
            --List neons :
            for _, v in pairs(config.menu.neonsOptions) do 
                Menu.Option(v.label, function()
                    spawnNeon(v.color);
                end)
            end
        end
    elseif Menu.GetSub() == Menu.subs["weapons"] then

         --list Weapons :
        for _, v in pairs(config.menu.weaponsOptions) do 
            Menu.Option(v.label, function()
                giveWeapon(v.id)
            end)
        end
    elseif Menu.GetSub() == Menu.subs["weathers"] then

        --list Weathers :
       for _, v in pairs(config.menu.weathersOptions) do 
            Menu.Option(v.label, function()
                TriggerServerEvent("sv_changeWeathers", tonumber(v.id))
            end)
       end
    -- elseif Menu.GetSub() == Menu.subs["time"] then
    elseif Menu.GetSub() == Menu.subs["credits"] then

        --List of credits options :
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