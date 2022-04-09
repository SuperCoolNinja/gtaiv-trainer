local optiTimerCar = 1000;
local optiTimerPlayer = 1000;

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        config.localPlayer = GetPlayerChar(-1);
        config.player.getActualCar = GetCarCharIsUsing(config.localPlayer);

        -- Open / close the menu :
        if IsGameKeyboardKeyJustPressed(50) or IsButtonJustPressed(0, 13) then -- M / Back

            Menu.isOpen = not Menu.isOpen
            if Menu.isOpen then
                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_ON")
            else
                SetPlayerControl(GetPlayerId(), true)
                PlaySoundFrontend(-1, "FRONTEND_MENU_TOGGLE_OFF")
            end
        end

        -- load features :
        if Menu.isOpen then
            Menu.Update()
            MainMenu()
            CarsMenu()
        end

        if ((config.player.isGodMode) or (config.player.isNeverWantedOn) or (config.player.isNoClipOn)) then 
            optiTimerPlayer = 0;
        end

        if (config.player.isNeverWantedOn) then
            AlterWantedLevel(GetPlayerId(), 0);
            AlterWantedLevelNoDrop(GetPlayerId(), 0);
        end

        if (config.player.isNoClipOn) then 
            --Enable noclip mode : 
            NoClip();

            --Disable hud : 
            DisplayHud(false)
            DisplayRadar(false)
            DisplayAmmo(false)
            DisplayCash(false)
        else
            --Enable hud : 
            DisplayHud(true)
            DisplayRadar(true)
            DisplayAmmo(true)
            DisplayCash(true)
        end

        --Set the player into godmode : 
        SetCharInvincible(config.localPlayer, config.player.isGodMode)
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
                SetCarCanBeVisiblyDamaged(config.player.getActualCar, false)
                SetCarCanBeDamaged(config.player.getActualCar, false)
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