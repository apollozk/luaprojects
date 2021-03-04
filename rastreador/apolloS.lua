function rastearVeh(thePlayer)
    local playerAccount = thePlayer:getAccount()
    local veh = thePlayer:getOccupiedVehicle()
    local group = ACLGroup.get("PCCE")

    if group:doesContainObject("user." .. playerAccount:getName()) then
        local sinalR = Blip.createAttachedTo(veh, 19)
        
        setTimer(function(blip)
            blip:destroy()
        end, blipCfg.time, 1, sinalR)
    end
end
addCommandHandler ("rastrear", rastearVeh)