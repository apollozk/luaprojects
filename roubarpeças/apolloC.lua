-- +--------------------+
-- |  Pegar "trabalho"  |

local pedTrab = createPed ( configPed.skinT, configPed.pedX, configPed.pedY, configPed.pedZ )


setElementFrozen (pedTrab, true)

-- +--------------------+

  

function getTrab( _, _, _, _, _, _, _, elementHit )
    if elementHit then
        if elementHit == pedTrab then
            local tx, ty, tz = getElementPosition(localPlayer)
            local rx, ry, rz = getElementPosition(pedTrab)
            local distancia = getDistanceBetweenPoints3D(tx, ty, tz, rx, ry, rz)
            if (distancia <= 2.0)  then
                if getElementData ( localPlayer, "ladrao:peças") then
                   setElementData ( localPlayer, "ladrao:peças", nil)
                   exports['infot']:addNotification("Você não é mais ladrão!!", "error")
                end
                   setElementData ( localPlayer, "ladrao:peças", true)
                   exports['infot']:addNotification("Você agorá é um ladrão!!", "success" )
                end
            end
        end
    end
addEventHandler ( "onClientClick", root, getTrab )