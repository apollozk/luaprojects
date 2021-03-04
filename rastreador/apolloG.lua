blipCfg = {
	time = 120000
}


function mensagem(text, player, ...)
	triggerClientEvent(player, "N3xT.dxNotification", root, tostring(text), "info")
end