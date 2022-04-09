RegisterServerEvent('sv_changeWeathers')
AddEventHandler('sv_changeWeathers', function(id)
	TriggerClientEvent('cl_changeWeathers', -1, id)
end)


-- RegisterNetEvent('sv_setTime')
-- AddEventHandler('sv_setTime', function(hour)
-- 	TriggerClientEvent('cl_setTime', -1, hour)
-- end)

-- Set false if you want disable refresh command before start your server (for security reason)
local ENABLECMD = true

AddEventHandler('chatMessage', function(source, name, message)
	if not ENABLECMD then return end
	if string.len(message) < 2 then return end
	if string.sub(message, 1, 2) == "!r" then
		local cmd = message:Split(' ')
		if #cmd < 2 or cmd[1] == GetInvokingResource() then
			TriggerClientEvent('chatMessage', -1, '', {0, 0, 0}, "^6Usage:^7 !r resource-name")
			CancelEvent()
			return
		end
		
		StopResource(cmd[1])
		if StartResource(cmd[1]) then
			TriggerClientEvent('chatMessage', -1, 'console', {0, 255, 0}, "Resource <^3"..cmd[1].."^7> has been successful reloaded!")
		else
			TriggerClientEvent('chatMessage', -1, 'console', {255, 0, 0}, "Failed to reload resource <^3"..cmd[1].."^7>")
		end
		
		CancelEvent()
	end
end)