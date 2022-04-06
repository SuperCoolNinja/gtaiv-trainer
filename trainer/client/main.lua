Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local player = GetPlayerChar(-1);
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

        if (IsCharInAnyCar(player)) then
            SetCharInvincible(config.player.getActualCar, config.player.isGodMode)
        end

        SetCharInvincible(player, config.player.isGodMode)
    end
end)