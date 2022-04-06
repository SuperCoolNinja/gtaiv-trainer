RegisterServerEvent('sv_changeWeathers')
AddEventHandler('sv_changeWeathers', function(id)
	TriggerClientEvent('cl_changeWeathers', -1, id)
end)


-- RegisterNetEvent('sv_setTime')
-- AddEventHandler('sv_setTime', function(hour)
-- 	TriggerClientEvent('cl_setTime', -1, hour)
-- end)