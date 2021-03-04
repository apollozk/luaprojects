local coleta = createMarker( configC.posX, configC.posY, configC.posZ -1, "cylinder", configC.tamanho, configC.r, configC.g, configC.b )

local venda = createMarker( configV.posX2, configV.posY2, configV.posZ2 -1, "cylinder", configV.tamanhoV, configV.r2, configV.g2, configV.b2 )

------------------------

--+------------------------------+
--| Infobox ao entrar no marker  |
--+------------------------------+


function infoM ( localPlayer )
	if isElementWithinMarker ( localPlayer, coleta ) then
		exports['infot']:addNotification(localPlayer, "Use /coletar pra fazer a coleta das peças", "info" )
	end
end
addEventHandler ( "onMarkerHit", coleta, infoM )


---------------------------------------------------------

--+---------+ 
--| coletar |  ----
--+---------+     |
--                V 
----
-------------------

function coletarP( thePlayer )
	--local randItems = { 117, 118, 119, 120, 121 }
    --local selected = randItems[math.random(#randItems)] -- pegando item aleatório da tabela
    --print(selected) -- mostra o item que foi selecionado
--


	--- se não tiver pego o trabalho, ele não deixa prosseguir abaixo --
	--                                                                  |
	--                                                                  V
	--
	if getElementData ( thePlayer, "ladrao:peças" ) == false then
		if isElementWithinMarker ( thePlayer, coleta) then
			expots['infot']:addNotification(localPlayer, "Você não é um ladrão de peças, vaza!!", "error")
		end
	end
	---- agora se ele tiver pego o trabalho ele deixa prosseguir
	if getElementData ( thePlayer, "ladrao:peças" ) then
		if isElementWithinMarker ( thePlayer, coleta ) then
			setElementData ( thePlayer, "roubou:peças", true )
			setElementFrozen ( thePlayer, true )
			toggleAllControls ( thePlayer, false )
			setPedAnimation ( thePlayer, "cop_ambient", "copbrowse_in", 20000, true, false, false, false )
			exports['infot']:addNotification( thePlayer, "Você está roubando peças, aguarde 5 minutos", "info" )
			setTimer (function()
				setElementFrozen ( thePlayer, false )
				toggleAllControls ( thePlayer, true )
				exports['infot']:addNotification( thePlayer, "Você roubou 5 peças, procure alguém que saiba montar pc's e venda!", "success" )
			end, 20000, 1)
			exports.MAT_Items:giveItem ( thePlayer, 117, 1 )
		end
	end
end
addCommandHandler ( "coletar", coletarP )

----------------------------------

-- +---------+
-- |  Venda  |
-- +---------+





