local function MainMenu()
    if Menu.GetSub() == Menu.subs["main_menu"] then

        --Submenu :
        for _, v in pairs(config.menu.mainSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["spawn_cars"] then
        
        --Category vehicles :
        for _, v in pairs(config.menu.spawnCarsSub) do 
            Menu.SubmenuOption(v.label, Menu.subs[v.id], function() end)
        end
    elseif Menu.GetSub() == Menu.subs["credits"] then

        --List of credits options :
        for _, v in pairs(config.menu.creditsOptions) do 
            Menu.Option(v.label, function() end)
        end
    end
end



local function CarsMenu()
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



Citizen.CreateThread(function()
    while true do
        -- Open / close the menu.
        if IsGameKeyboardKeyJustPressed(50) or IsButtonJustPressed(0, 13) then -- M / Back
            Menu.isOpen = not Menu.isOpen
            if Menu.isOpen then
                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_ON")
            else
                SetPlayerControl(GetPlayerId(), true)
                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_OFF")
            end
        end

        if Menu.isOpen then
            Menu.Update()
            MainMenu()
            CarsMenu()
        end

        Citizen.Wait(1)
    end
end)