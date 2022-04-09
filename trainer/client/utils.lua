Utils = {}

math.randomseed(GetGameTimer()) --> Init.


RegisterNetEvent('cl_changeWeathers')
AddEventHandler('cl_changeWeathers', function(weatherid)
    ForceWeatherNow(tonumber(weatherid))
end)


RegisterNetEvent('cl_setTime')
AddEventHandler('cl_setTime', function(hour)
	SetTimeOfDay(tonumber(hour))
end)

function ShowText(text, timeout) --> FROM @LION THANKS G.
    SetTextWrap(1, 1)
    SetTextScale(0.5, 0.5 * GetAspectRatio())
	SetTextDropshadow(false, 0, 0, 0, 0)

	if(timeout == nil) then
		PrintStringWithLiteralStringNow("STRING", text, 2000, 1)
	else
		PrintStringWithLiteralStringNow("STRING", text, timeout, 1)
	end
end

function Utils.Round(_num, _numDecimalPlaces)
	local mult = 10 ^ (_numDecimalPlaces or 0)
	return math.floor(_num * mult + 0.5) / mult
end

function Utils.DegreesToRadians(_degrees)
    return _degrees * 3.14159265359 / 180.0
end

function showHUD(bool)
    DisplayHud(bool);
    DisplayRadar(bool);
    DisplayAmmo(bool);
    DisplayCash(bool);
end

function disableCops()
    AlterWantedLevel(GetPlayerId(), 0);
    AlterWantedLevelNoDrop(GetPlayerId(), 0);
end

function NoClip()
    local x, y, z = GetCharCoordinates(config.localPlayer);
    local leftStickUpDown = GetControlValue(0, 14);
    local camera = GetGameCam();
    local _, _, yaw = GetCamRot(camera);

    if IsButtonPressed(0, 7) or IsGameKeyboardKeyPressed(57) then --> Up Controller
        z = z + config.player.noClipSpeed /2
    elseif IsButtonPressed(0, 5) or IsGameKeyboardKeyPressed(42) then --> Down Controller
        z = z - config.player.noClipSpeed /2
    end

    if IsGameKeyboardKeyPressed(17) or leftStickUpDown <= 55 then --> Forward
        local heading = GetCharHeading(config.localPlayer);
        x = x + config.player.noClipSpeed * math.sin(Utils.DegreesToRadians(heading)) * -1.0
        y = y + config.player.noClipSpeed * math.cos(Utils.DegreesToRadians(heading))
    elseif IsGameKeyboardKeyPressed(31) or leftStickUpDown >= 200 then --> Backward
        local heading = GetCharHeading(config.localPlayer);
        x = x - config.player.noClipSpeed * math.sin(Utils.DegreesToRadians(heading)) * -1.0
        y = y - config.player.noClipSpeed * math.cos(Utils.DegreesToRadians(heading))
    end

    if config.player.getActualCar == 0 then
        SetCharHeading(config.localPlayer, yaw);
        SetCharCoordinatesNoOffset(config.localPlayer, x, y, z);
        SetCharCollision(config.localPlayer, not config.player.noClipSpeed);
        SetCharVisible(config.localPlayer, false);
    else
        SetCarHeading(config.player.getActualCar, yaw);
        SetCarCoordinatesNoOffset(config.player.getActualCar, x, y, z);
        SetCarCollision(config.player.getActualCar, not config.player.noClipSpeed);
    end
end

function spawnCar(model)
    Citizen.CreateThread(function()
		local pos = table.pack(GetCharCoordinates(config.localPlayer));

		RequestModel(model);

        while not HasModelLoaded(model) do 
            Citizen.Wait(0)
        end

        local car = CreateCar(model, pos[1], pos[2], pos[3], true);
        SetCarHeading(car, pos[4]);
        SetCarOnGroundProperly(car);
        SetVehicleDirtLevel(car, 0.0);
        WashVehicleTextures(car, 255);
		WarpCharIntoCar(config.localPlayer, car);
        MarkModelAsNoLongerNeeded(model);
        MarkCarAsNoLongerNeeded(car);
    end)
end

local function spawnLight(modelNeon, x,y,z,rx,ry,rz)
    AttachObjectToCar(modelNeon, config.player.getActualCar, 0, x,y,z, rx,ry,rz);
    SetObjectLights(modelNeon, modelNeon);
    SetObjectVisible(modelNeon, true);
    SetObjectInvincible(modelNeon, true);
    MarkObjectAsNoLongerNeeded(modelNeon);
    SetObjectAlpha(modelNeon, 0);
    ShowText("~g~Neon added.", 1000);
end

function spawnNeon(model)
    CreateThread(function()
        RequestModel(model);
        while (not HasModelLoaded(model)) do Wait(0) end
 
        local neonOne   = CreateObject(model, 0.0, 0.0, 0.0, _, true);
        local neonTwo   = CreateObject(model, 0.0, 0.0, 0.0, _, true);
        local neonThree = CreateObject(model, 0.0, 0.0, 0.0, _, true);
        local neonFour  = CreateObject(model, 0.0, 0.0, 0.0, _, true);

        if(model == 0xCB26803D) then -- red 
            spawnLight(neonOne, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonTwo, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonThree,0.0,0.2,-1.1,-2.0,-190,-190,0);
            spawnLight(neonFour,0.0,0.2,-2.0,-2.0,-190,-190,0);
        elseif(model == 0xD20167BE) then-- blue 
            spawnLight(neonOne, 0.0,0.2,0.0,-2.0,180,180,180);
            spawnLight(neonTwo, 0.0,0.2,0.0,-2.0,180,180,180);
            spawnLight(neonThree,0.0,0.2,0.0,-2.0,180,180,180);
            spawnLight(neonFour,0.0,0.2,0.0,-2.0,180,180,180);
        elseif(model == 0xFCB32869) then-- White 
            spawnLight(neonOne, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonTwo, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonThree,0.0,0.2,-1.1,-2.0,-190,-190,0);
            spawnLight(neonFour,0.0,0.2,-2.0,-2.0,-190,-190,0);
        elseif(model == 0x2F8AEA79) then-- Orange
            spawnLight(neonOne, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonTwo, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonThree,0.0,0.2,-1.1,-2.0,-190,-190,0);
            spawnLight(neonFour,0.0,0.2,-2.0,-2.0,-190,-190,0);
        end

        MarkModelAsNoLongerNeeded(model);
    end)
end

function giveWeapon(model)
	GiveWeaponToChar(config.localPlayer, model, 999);
    ShowText("~g~Weapon added.", 1000);
end

function repairCar(vehicle) 
    FixCar(vehicle);
    ShowText("~g~Car fixed.", 1000);
end

local function network_control(netID)
	local i = 0;
    repeat
        i = i + 1;
        RequestControlOfNetworkId(netID);
        if(HasControlOfNetworkId(netID)) then 
            return true;
        else 
            Wait(0);
        end
    until (i < 50);
    return false;
end
function flipCar(vehicle)
    local vehId = GetNetworkIdFromVehicle(vehicle);
    if (network_control(vehId)) then
        local carHeading = GetCarHeading(vehicle);
        local getActualSpeed = GetCarSpeed(vehicle);
        SetVehicleQuaternion(vehicle, 0,0,0,0);
        SetCarHeading(vehicle, carHeading);
        SetCarForwardSpeed(vehicle, getActualSpeed);
        ShowText("~g~Car fliped.", 1000);
    else
        ShowText("~r~Can't find a valid car.", 1000);
    end
end

function boostCar(vehicle) 
    local getActualSpeed = GetCarSpeed(vehicle);
    SetCarForwardSpeed(vehicle, getActualSpeed * 2.50);
end

function changeModel(model)
    RequestModel(model);
    while (not HasModelLoaded(model)) do Wait(0) end
    ChangePlayerModel(GetPlayerId(), model);
    MarkModelAsNoLongerNeeded(model);
end

function teleportToWaypoint()
    local blip = GetFirstBlipInfoId(8);

    if (DoesBlipExist(blip)) then
        local waypoint = GetBlipCoords(blip);

        --Load map/collision ? : 
        RequestCollisionAtPosn(waypoint.x, waypoint.y, 0.0);
        LoadAllObjectsNow();

        for height = 1, 1000 do
            local pGroundZ, integer = GetGroundZFor3dCoord(waypoint.x, waypoint.y, height + 0.0);

            if pGroundZ > 0.0 then 
                SetCharCoordinates(config.localPlayer, waypoint.x, waypoint.y, height + 0.0);
                SetCharHeading(0.0); 
                break
            end
        end
    else
        Citizen.Trace("Waypoint not found!\n")
    end
end


-- FROM @LION THANKS G :
local function TeleportToChar(charTarget, targetID)
    local pos = table.pack(GetCharCoordinates(charTarget))
    table.insert(pos, GetCharHeading(charTarget))

    if(IsCharInAnyCar(config.localPlayer)) then
        WarpCharFromCarToCoord(config.localPlayer, pos[1], pos[2], pos[3])
    end

    SetCharCoordinatesNoOffset(config.localPlayer, pos[1], pos[2], pos[3])
    SetCharHeading(config.localPlayer, pos[4])
    ShowText("~g~You've successfully teleported to ~b~" .. GetPlayerName(targetID) .. "~w~.")
end

function teleportToPlayer(target)
    if(IsCharInAnyCar(GetPlayerChar(target))) then
        if(GetMaximumNumberOfPassengers(GetCarCharIsUsing(GetPlayerChar(target))) == GetNumberOfPassengers(GetCarCharIsUsing(GetPlayerChar(target)))) then
            ShowText("~r~There's no more free seats in " .. GetPlayerName(target) .. "'s vehicle! ~g~Warping to the vehicle.")
            return TeleportToChar(GetPlayerChar(target))
        end

        WarpCharIntoCarAsPassenger(config.localPlayer, GetCarCharIsUsing(GetPlayerChar(target)))
        return ShowText("~g~You've successfully teleported into ~y~" .. GetPlayerName(target) .. "~g~'s vehicle.")
    end
    TeleportToChar(GetPlayerChar(target), target)
end