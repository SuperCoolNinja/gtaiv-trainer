local optiTimerCar = 1000;
local optiTimerPlayer = 1000;

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        config.player.getActualCar = GetCarCharIsUsing(GetPlayerChar(-1));

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
    end
end)

--> Loop for cars option : 
Citizen.CreateThread(function()
    while true do
        optiTimerCar = 1000;

        if (IsCharInAnyCar(GetPlayerChar(-1))) then
            optiTimerCar = 0;

            if (config.vehicle.isGodMode) then
                SetCarCanBeVisiblyDamaged(config.player.getActualCar, false)
                SetCarCanBeDamaged(config.player.getActualCar, false)
            end
        
            if (config.vehicle.isBoostOn) then  --> If boost mode is enanled then we allow action to make a boost using car.
                if IsGameKeyboardKeyJustPressed(18) then --> E / ?
                    boostCar(GetCarCharIsUsing(GetPlayerChar(-1)));
                end
            end
        end
        Citizen.Wait(optiTimerCar)
    end
end)

--> Loop to make the player in godMode : 
Citizen.CreateThread(function()
    while true do
        optiTimerPlayer = 1000;

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
            DisplayHud(not config.player.isNoClipOn)
            DisplayRadar(not config.player.isNoClipOn)
            DisplayAmmo(not config.player.isNoClipOn)
            DisplayCash(not config.player.isNoClipOn)
        end

        --Set the player into godmode : 
        SetCharInvincible(GetPlayerChar(-1), config.player.isGodMode)
        
        Citizen.Wait(optiTimerPlayer)
    end
end)