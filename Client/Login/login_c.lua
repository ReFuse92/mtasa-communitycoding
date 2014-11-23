-- Project: MTASA CommunityCoding
-- User: Adrian93
-- Package:
-- Date: 23.11.2014
-- Time: 11:39
--

local sx, sy = guiGetScreenSize()
local cx, cy = 1600, 1024
local x, y = (sx/cx), (sy/cy)
local px, py = (sx/cx), (sy/cy)

local LoginBut = guiCreateButton(698*px, 529*py, 205*px, 53*py, "Login", false)		--gui button hinter dxDrawRectangle versteckt
guiSetProperty(LoginBut, "NormalTextColour", "FFFEFEFE")
 
local RegBut = guiCreateButton(698*px, 589*py, 205*px, 53*py, "Register", false)	--gui button hinter dxDrawRectangle versteckt
guiSetProperty(RegBut, "NormalTextColour", "FFFEFEFE")

local editregister = guiCreateEdit(613*px, 459*py, 376*px, 35*py, "", false)		--gui editbox hinter dxDrawRectangle versteckt
guiSetProperty(editregister, "Alpha", "0.000000")
guiSetAlpha(editregister,0)
guiEditSetMasked(editregister,true)
showCursor(true)
guiSetFont(editregister, "pricedown")
setPlayerHudComponentVisible( "all", true )

function showLoginRegister( )
	setCameraMatrix(1992.5711669922, -1460.2141113281, 12.963700294495, 1991.7709960938, -1459.7365722656, 13.326453208923)		--hintergrundcamera des login sys
	setElementDimension(localPlayer, 99999)
	setElementInterior(localPlayer, 0)
	showChat(false)

	-- Servername
	dxDrawText("Learning by doing", 700*px, 175*py, 800*px, 200*py, tocolor(0, 0, 0, 255), 2.0, "bankgothic", "center", "top", false, false, true, false, false)
	dxDrawText("Reallife Projekt", 957*px, 220*py, 800*px, 200*py, tocolor(0, 0, 0, 255), 2.0, "bankgothic", "center", "top", false, false, true, false, false)
	
	-- Username	
	dxDrawText("Username:", 612*px, 327, 989*px, 362*py, tocolor(255, 255, 255, 250), 0.70*px, "bankgothic", "left", "bottom", false, false, false, false, false)
	dxDrawRectangle(611*px, 360*py, 380*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(611*px, 397*py, 380*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(989*px, 360*py, 2*py, 39*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(611*px, 360*py, 2*py, 39*py,tocolor(0, 0, 0, 250), true)
	-- Passwort
	dxDrawText("Passwort:", 612*px, 425*py, 987*px, 459*py, tocolor(255, 255, 255, 250), 0.70*px, "bankgothic", "left", "bottom", false, false, false, false, false)
    dxDrawRectangle(611*px, 457*py, 380*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(611*px, 494*py, 380*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(989*px, 457*py, 2*py, 39*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(611*px, 457*py, 2*py, 39*py,tocolor(0, 0, 0, 250), true)
	-- LoginButton
	dxDrawRectangle(696*px, 581*py, 209*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(696*px, 527*py, 209*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(903*px, 527*py, 2*py, 55*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(696*px, 527*py, 2*py, 55*py,tocolor(0, 0, 0, 250), true)
	-- RegisterButton
	dxDrawRectangle(696*px, 641*py, 209*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(696*px, 587*py, 209*px, 2*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(903*px, 587*py, 2*py, 55*py,tocolor(0, 0, 0, 250), true)
	dxDrawRectangle(696*px, 587*py, 2*py, 55*py,tocolor(0, 0, 0, 250), true)
	-- WindowButton
	dxDrawRectangle(698*px, 529*py, 205*px, 52*py, tocolor(120, 120, 120, 255), true) --Einlogbutton
    dxDrawRectangle(698*px, 589*py, 205*px, 52*py, tocolor(120, 120, 120, 255), true) --RegisterButton
	dxDrawRectangle(613*px, 459*py, 376*px, 35*py, tocolor(120, 120, 120, 255), true) --PasswordVersteckenAltGui
	dxDrawRectangle(613*px, 362*py, 376*px, 35*py, tocolor(120, 120, 120, 255), true) --BenutzerVersteckenAltGui
	dxDrawText("Einloggen", 901*px, 529*py, 697*px, 585*py, tocolor(0, 0, 0, 255), 1.0, "bankgothic", "center", "center", false, false, true, false, false)
    dxDrawText("Registrieren", 728*px, 645*py, 872*px, 585*py, tocolor(0, 0, 0, 255), 1.0, "bankgothic", "center", "center", false, false, true, false, false)
	
	local temp = ""
		for i=1,#guiGetText(editregister) do
			if i <= 16 then
			temp = temp.."*"
			end
		end
	-- Benutzer & Passwort
	dxDrawText(" "..getPlayerName(localPlayer), 610*px, 362*py, 100*px, 35*py, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "left", "top", false, false, true, false, false)
    dxDrawText(" "..temp, 610*px, 925*py, 100*px, 35*py, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "left", "center", false, false, true, false, false)	
end
addEventHandler("onClientRender", getRootElement(),showLoginRegister)

function BadPW ( )	--Falsches Passwort
	dxDrawText("Bad Password!", 728*px, 800*py, 872*px, 585*py, tocolor(255, 0, 50, 255), 1.3, "bankgothic", "center", "center", false, false, true, false, false)
end

function AccRdy ( )	--Benutzer Vergeben
	dxDrawText("User Already!", 728*px, 860*py, 872*px, 585*py, tocolor(255, 0, 50, 255), 1.3, "bankgothic", "center", "center", false, false, true, false, false)
end

function NoPW ( )	--Gib ein Passwort ein
	dxDrawText("Passwort eingeben!", 728*px, 920*py, 872*px, 585*py, tocolor(255, 0, 50, 255), 1.3, "bankgothic", "center", "center", false, false, true, false, false)
end

function homo(pwfalsch)		--Anzeige der Fehler
	if pwfalsch == 1 then
		addEventHandler("onClientRender", getRootElement(), BadPW)
		setTimer ( function( )
		removeEventHandler("onClientRender", getRootElement(), BadPW)
		end, 3000, 1 )
	end
	if pwfalsch == 2 then
		addEventHandler("onClientRender", getRootElement(), AccRdy)
		setTimer ( function( )
		removeEventHandler("onClientRender", getRootElement(), AccRdy)
		end, 3000, 1 )
	end
end
addEvent("ZeigEsMir",true)
addEventHandler("ZeigEsMir",getRootElement(),homo)

function RegisterPlayer(button,state)
	if (button == "left" and state == "up") then
		local PW = guiGetText(editregister)
		if PW ~= "" then
			triggerServerEvent("RegistratePlayer",getRootElement(),getPlayerName(localPlayer),PW)
		else
			outputChatBox("Du musst ein Password eingeben!")
		end
	end
end

function LoginPlayer(button, state)
	if (button == "left" and state == "up") then
		local PW = guiGetText(editregister)
		if PW ~= "" then
			triggerServerEvent("LoginPlayer",getRootElement(),getPlayerName(localPlayer),PW)
		else
			addEventHandler("onClientRender", getRootElement(), NoPW)
			setTimer ( function( )
			removeEventHandler("onClientRender", getRootElement(), NoPW)
			end, 3000, 1 )
		end
	end
end

function schliessen( )
	removeEventHandler("onClientRender",getRootElement(),showLoginRegister)
	showCursor(false)
	showChat(true)
	guiSetVisible(LoginBut,false)
	guiSetVisible(RegBut,false)
end
addCommandHandler("lclose", schliessen) --------------------- kein login
addEvent("closeLoginRegister",true)
addEventHandler("closeLoginRegister",getRootElement(),schliessen)
addEventHandler("onClientGUIClick",RegBut,RegisterPlayer)
addEventHandler("onClientGUIClick",LoginBut,LoginPlayer)
