local optiTimerCar = 1000;

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        config.localPlayer = GetPlayerChar(-1);
        config.player.getActualCar = GetCarCharIsUsing(config.localPlayer);

        -- Open / close the menu :
        if IsGameKeyboardKeyJustPressed(50) or IsButtonJustPressed(0, 13) then --> M / Back

            Menu.isOpen = not Menu.isOpen

            if Menu.isOpen then
                local users = GetPlayers(); --> Get all users connected.

                for k in pairs(config.playersList) do --> Clear users.
                    config.playersList[k] = nil
                end

                for _, i in ipairs(users) do --> Add users information into the new object key value.
                    table.insert(config.playersList, {name = GetPlayerName(i), serverID = GetPlayerServerId(i), targetIndex = i})
                end

                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_ON");
            else
                SetPlayerControl(GetPlayerId(), true);
                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_OFF");
            end
        end

        if Menu.isOpen then --> load features.
            Menu.Update();
            MainMenu();
            CarsMenu();
        end

        if (config.player.isNeverWantedOn) then --> Disable cops when needed. 
            disableCops();
        end

        if (config.player.isNoClipOn) then --> Action when no clip is enabled or disabled.
            NoClip(); --> Enable noclip mode.
            showHUD(false); --> Disable hud.
        else
            showHUD(true);  --> Enable hud.
        end

        SetCharInvincible(config.localPlayer, config.player.isGodMode); --> Set the player into godmode.
    end
end)

--> Loop for cars option : 
Citizen.CreateThread(function()
    while true do
        optiTimerCar = 1000;

        config.localPlayer = GetPlayerChar(-1);
        config.player.getActualCar = GetCarCharIsUsing(config.localPlayer);

        if (IsCharInAnyCar(config.localPlayer)) then
            optiTimerCar = 0;

            if (config.vehicle.isGodMode) then
                SetCarCanBeVisiblyDamaged(config.player.getActualCar, false);
                SetCarCanBeDamaged(config.player.getActualCar, false);
            end
        
            if (config.vehicle.isBoostOn) then  --> If boost mode is enanled then we allow action to make a boost using car.
                if IsGameKeyboardKeyJustPressed(18) or IsButtonJustPressed(0, 18) then --> E / Klaxon
                    boostCar(config.player.getActualCar);
                end
            end
        end
        Citizen.Wait(optiTimerCar)
    end
end)