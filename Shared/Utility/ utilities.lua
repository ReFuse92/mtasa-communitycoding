--iLife/iRace Algorithm to find a player by namepart. Limited to 1 player. Returns flase otherwise.
function getPlayerFromPartialName(name)
	local found = {}
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                table.insert(found, player)
            end
        end
    end
	if (#found == 1) then
		return found[1]
	else
		return false
	end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 	type( sEventName ) == 'string' and 	isElement( pElementAttachedTo ) and type( func ) == 'function' 	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for _, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
	return false
end

function convertNumber(number)
    local formatted, k = number
	while k~=0 do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
		if ( k==0 ) then
            break
		end
    end
    return formatted
end

function toboolean(x)
	if x == "true" or x == 1 or x == "1" or x == true then
		return true
	elseif x == "false" or x == 0 or x == "0" or x == false then
		return false
	end
	return false
end

function removeColorCodes(text)
    return string.gsub(text or "", "#%x%x%x%x%x%x", "")
end

function table.random (theTable)
    return theTable[math.random (#theTable)]
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function rgbToHex(r, g, b, a, af) --if af true, then alpha is forwarded aarrggbb and not rrggbbaa
    if ((r < 0 or r > 255 or g < 0 or g > 255 or b < 0 or b > 255) or (a and (a < 0 or a > 255))) then return end
    if af then return ("%.2X%.2X%.2X%.2X"):format(a,r,g,b) end
    if a then return ("%.2X%.2X%.2X%.2X"):format(r,g,b,a) else return ("%.2X%.2X%.2X"):format(r,g,b,a) end
end

function getDistanceBetweenElements3D(e1,e2)
    local x,y,z = getElementPosition(e1)
	  local x2, y2, z2 = getElementPosition(e2)
    return getDistanceBetweenPoints3D(x, y, , x2, y2, z2)
end

function getDistanceBetweenElements2D(e1,e2)
    local x, y = getElementPosition(e1)
	  local x2, y2 = getElementPosition(e2)
    return getDistanceBetweenPoints2D(x, y, x2, y2)
end

function isPointInRectangle(cX,cY,rX,rY,width,height)
	return ((cX > rX) and (cX < rX+width)) and ( (cY > rY) and (cY < rY+height))
end
