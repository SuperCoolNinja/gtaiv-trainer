Utils = {}

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