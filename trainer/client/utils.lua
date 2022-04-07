Utils = {}

RegisterNetEvent('cl_changeWeathers')
AddEventHandler('cl_changeWeathers', function(weatherid)
    ForceWeatherNow(tonumber(weatherid))
end)


RegisterNetEvent('cl_setTime')
AddEventHandler('cl_setTime', function(hour)
	SetTimeOfDay(tonumber(hour))
end)


function Utils.Round(_num, _numDecimalPlaces)
	local mult = 10 ^ (_numDecimalPlaces or 0)
	return math.floor(_num * mult + 0.5) / mult
end

function spawnCar(model)
    Citizen.CreateThread(function()
		local pos = table.pack(GetCharCoordinates(GetPlayerChar(-1)))

		RequestModel(model)

        while not HasModelLoaded(model) do 
            Citizen.Wait(0) 
        end

        local car = CreateCar(model, pos[1], pos[2], pos[3], true)
        SetCarHeading(car, pos[4])
        SetCarOnGroundProperly(car)
        SetVehicleDirtLevel(car, 0.0)
        WashVehicleTextures(car, 255)
		WarpCharIntoCar(GetPlayerChar(-1), car)
        MarkModelAsNoLongerNeeded(model)
        MarkCarAsNoLongerNeeded(car)
    end)
end

local function spawnLight(modelNeon, x,y,z,rx,ry,rz)
    AttachObjectToCar(modelNeon, config.player.getActualCar, 0, x,y,z, rx,ry,rz);
    SetObjectLights(modelNeon, modelNeon);
    SetObjectVisible(modelNeon, true);
    SetObjectInvincible(modelNeon, true);
end

function spawnNeon(model)
    CreateThread(function()
        RequestModel(model);
        while (not HasModelLoaded(model)) do
            Wait(0)
        end

        local light     = nil;
        local neonOne   = CreateObject(model, 0.0, 0.0, 0.0, light, true);
        local neonTwo   = CreateObject(model, 0.0, 0.0, 0.0, light, true);
        local neonThree = CreateObject(model, 0.0, 0.0, 0.0, light, true);
        local neonFour  = CreateObject(model, 0.0, 0.0, 0.0, light, true);


        if(model == 0xCB26803D) then -- red 
            spawnLight(neonOne, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonTwo, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonThree,0.0,0.2,-1.1,-2.0,-190,-190,0);
            spawnLight(neonFour,0.0,0.2,-2.0,-2.0,-190,-190,0);
        elseif(model == 0xD20167BE) then-- blue 
            spawnLight(neonOne, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonTwo, 0.0,0.2,-1.0,-2.0,-190,-190,0);
            spawnLight(neonThree,0.0,0.2,-1.1,-2.0,-190,-190,0);
            spawnLight(neonFour,0.0,0.2,-2.0,-2.0,-190,-190,0);
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
    end)
end

function giveWeapon(model)
	GiveWeaponToChar(GetPlayerChar(-1), model, 999);
end

function repairCar(vehicle) 
    FixCar(vehicle)
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
        SetCarForwardSpeed(vehicle, getActualSpeed); --?
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
                SetCharCoordinates(GetPlayerChar(-1), waypoint.x, waypoint.y, height + 0.0);
                SetCharHeading(0.0); 
                break
            end
        end
    else
        Citizen.Trace("Waypoint not found!\n")
    end
end








 
-- void xmc_airstrike(void)
-- {
--     if(DOES_BLIP_EXIST(GET_FIRST_BLIP_INFO_ID(BLIP_WAYPOINT))){
--     Vector3 pos;
--     float z;
--     GET_BLIP_COORDS(GET_FIRST_BLIP_INFO_ID(BLIP_WAYPOINT),&pos);
--     GET_GROUND_Z_FOR_3D_COORD(pos.x,pos.y,pos.z,&z);
--     xmccreate_big_explosion(pos.x,pos.y,z);//adding 10.0f isn't tested
--     xmcPrint("Launching Airstrike!");
--     }
--     else xmcPrint("You need to set a waypoint!");
-- }
 
 
 
-- Print Definition
 
-- #define xmcPrint(x) PRINT_STRING_WITH_LITERAL_STRING("string",x,2500,true)

-- */