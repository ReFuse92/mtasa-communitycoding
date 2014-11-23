--[[
Begriffserklärung:
Musclecar - Auto mit schlechtem Handling aber super Motor
SuperSportsCar - die Besten der Besten Sportwagen
SportsCar - normale Sportwagen und gut tunebare Autos
CheapCar - günstige Autos, etwas älter, meist 2 Türen
FamilyCar - Autos mit 4 Türen und meist einem großen Kofferraum, etwas eleganter
ExoticCar - Fahrzeuge, die man nicht immer auf den Straßen sieht 
OldCar - alte Autos, die deswegen wieder an Wert zunehmen, aber nicht wie ExoticCars
Van - Minivans, Pickups usw.
Lieferwagen - Autos mit großer Box als Kofferraum 
HeavyCar - im allgemeinen Baumaschinen und alles andere große
Electric - jedes kleine Fahrzeug, was keinen richtigen Motor hat
Motorrad - selbsterklärend
Fahrrad - jop...
--]]

Musclecar = {--Autobahn LV
[402] = true, -- Buffalo
[603] = true, -- Phoenix
[439] = true, -- Stallion
[475] = true, -- Sabre
[518] = true, -- Buccaneer
[535] = true, -- Slamvan
[434] = true, -- Hotknife
}

SuperSportsCar = {--alle bei Ottos Autos
[411] = true, -- Infernus
[415] = true, -- Cheetah
[429] = true, -- Banshee
[451] = true, -- Turismo
[477] = true, -- ZR-350
[506] = true, -- Super GT
[541] = true, -- Bullet
}

SportsCar = {--Autobahn LV
[558] = true, -- Uranus
[559] = true, -- Jester
[560] = true, -- Sultan
[562] = true, -- Elegy
[565] = true, -- Flash
[587] = true, -- Euros
[602] = true, -- Alpha
[533] = true, -- Feltzer
[550] = true, -- Sunrise
}

CheapCar = { --einige bei Grottis Autohaus
[401] = true, -- Bravura
[410] = true, -- Manana
[436] = true, -- Previon
[496] = true, -- Blista Compact
[526] = true, -- Fortune
[527] = true, -- Cadrona
[549] = true, -- Tampa
[542] = true, -- Clover
[536] = true, -- Blade
[529] = true, -- Willard
[404] = true, -- Pernnerial
[546] = true, -- Intruder
[458] = true, -- Solair
[589] = true, -- Club
}

FamilyCar = { --einige bei Wang Cars
[596] = true, -- Police LS
[597] = true, -- Police SF
[598] = true, -- Police LV
[567] = true, -- Savanna
[405] = true, -- Sentinel
[420] = true, -- Taxi
[421] = true, -- Washington
[426] = true, -- Premier
[438] = true, -- Cabbie
[492] = true, -- Greenwood
[507] = true, -- Elegant
[516] = true, -- Nebula
[540] = true, -- Vincent
[547] = true, -- Primo
[551] = true, -- Merit
[566] = true, -- Tahoma
[585] = true, -- Emperor
[479] = true, -- Regina
[561] = true, -- Stratum
}

ExoticCar = {--Ganz oben an der GG-Brücke
[555] = true, -- Windsor
[545] = true, -- Hustler
[534] = true, -- Remington
[575] = true, -- Broadway
[576] = true, -- Tornado
[412] = true, -- Voodoo
[409] = true, -- Stretch
[445] = true, -- Admiral
[467] = true, -- Oceanic
[580] = true, -- Stafford
[442] = true, -- Romero
[423] = true, -- Mr.Whoopee
[424] = true, -- BF Injection
[494] = true, -- Hotring Racer
[502] = true, -- HR 3
[503] = true, -- HR 2
[504] = true, -- Bloodring Banger
[539] = true, -- Vortex
[568] = true, -- Bandito
[471] = true, -- Quadbike
}

OldCar = {--Nicht verwendet
[478] = true, -- Walton
[543] = true, -- Sadler
[600] = true, -- Picador
[525] = true, -- Towtruck
[480] = true, -- Comet
[474] = true, -- Hermes
[491] = true, -- Virgo
[517] = true, -- Majestic
[419] = true, -- Esperanto
[466] = true, -- Glendale
[500] = true, -- Mesa
[531] = true, -- Tractor
}

Van = { --einige bei Shody Used Autos LV
--darunter auch Pickups und Offroad-Stuff!
[413] = true, -- Pony
[418] = true, -- Moonbeam
[440] = true, -- Rumpo
[459] = true, -- Berkley's RC Van
[482] = true, -- Burrito
[483] = true, -- Camper
[508] = true, -- Journey
[582] = true, -- Newsvan
[422] = true, -- Bobcat
[428] = true, -- Securicar
[554] = true, -- Yosemite
[552] = true, -- Utility Van
[416] = true, -- Ambulance
[490] = true, -- FBI Rancher
[528] = true, -- FBI Truck
[599] = true, -- Police Ranger
[400] = true, -- Landstalker
[470] = true, -- Partiot
[489] = true, -- Rancher
[495] = true, -- Sandking
[579] = true, -- Huntley
}

Lieferwagen = {--nicht verkauft
[456] = true, -- Yankee
[498] = true, -- Boxville
[499] = true, -- Benson
[609] = true, -- Boxville Mission
[588] = true, -- Hotdog
}

HeavyCar = {--nicht verkauft
[403] = true, -- Linerunner
[406] = true, -- Dumper
[408] = true, -- Trashmaster
[443] = true, -- Packer
[455] = true, -- Flatbed
[486] = true, -- Dozer
[514] = true, -- Tanker
[515] = true, -- Roadtrain
[524] = true, -- Cement Truck
[573] = true, -- Dune
[578] = true, -- DFT-30
[407] = true, -- Fire Truck
[427] = true, -- Enforcer
[432] = true, -- Rhino
[433] = true, -- Barracks
[544] = true, -- Fire Truck Ladder
[601] = true, -- SWAT
[431] = true, -- Bus
[437] = true, -- Coach
[444] = true, -- Monster 1
[532] = true, -- Combine
[556] = true, -- Moster 2
[557] = true, -- Moster 3
}

Electric = {--nicht verkauft
[530] = true, -- Forklift
[574] = true, -- Sweeper
[457] = true, -- Caddy
[485] = true, -- Baggage
[571] = true, -- Kart
[572] = true, -- Mower
[583] = true, -- Tug
}

Motorrad = {--viele bei Coutt and Schutz
[448] = true, -- Pizzaboy
[461] = true, -- PCJ-600
[462] = true, -- Faggio
[463] = true, -- Freeway
[468] = true, -- Sanchez
[521] = true, -- FCR-900
[522] = true, -- NRG-500
[523] = true, -- HPV1000
[581] = true, -- BF-400
[586] = true, -- Wayfarer
}

Fahrrad = {--bei Coutt and Schutz
[509] = true, -- Bike
[481] = true, -- BMX
[510] = true, -- Moutain Bike
}



function getVehicleClass(theVehicle)
if not getElementType(theVehicle) == "vehicle" then outputDebugString("Error @ getVehicleClass - invalid Vehicle") end
if not tonumber(theVehicle) then theVehicle = getElementModel(theVehicle) end
	if Musclecar[theVehicle] then return "Musclecar"
	elseif SuperSportsCar[theVehicle] then return "Supersportwagen"
	elseif SportsCar[theVehicle] then return "Sportwagen"
	elseif CheapCar[theVehicle] then return "Billigkarre"
	elseif FamilyCar[theVehicle] then return "Familienkutsche"
	elseif ExoticCar[theVehicle] then return "Exotisches Auto"
	elseif OldCar[theVehicle] then return "Altes Auto"
	elseif Van[theVehicle] then return "Van"
	elseif Lieferwagen[theVehicle] then return "Lieferwagen"
	elseif HeavyCar[theVehicle] then return "Schweres Auto"
	elseif Electric[theVehicle] then return "Hybrid"
	elseif Motorrad[theVehicle] then return "Motorrad"
	elseif Fahrrad[theVehicle] then return "Fahrrad"
	end
end






Autohaus_Autos = {
	["Auto Bahn Süd"] =
	{	["Buffalo"] = {Preis,X,Y,Z},
		["Phoenix"] = {Preis,X,Y,Z},
		["Stallion"] = {Preis,X,Y,Z},
		["Sabre"] = {Preis,X,Y,Z},
		["Buccaneer"] = {Preis,X,Y,Z},
		["Slamvan"] = {Preis,X,Y,Z},
		["Hotknife"] = {Preis,X,Y,Z},
	},
	["Ottos Autos"] =
	{   ["Infernus"] = {Preis,X,Y,Z},
		["Turismo"] = {Preis,X,Y,Z},
		["Super GT"] = {Preis,X,Y,Z},
		["Cheetah"] = {Preis,X,Y,Z},
		["Bullet"] = {Preis,X,Y,Z},
		["ZR-350"] = {Preis,X,Y,Z},
		["Banshee"] = {Preis,X,Y,Z},
	},
	["Auto Bahn"] =
	{	["Uranus"] = {Preis,X,Y,Z},
		["Jester"] = {Preis,X,Y,Z},
		["Sultan"] = {Preis,X,Y,Z},
		["Elegy"] = {Preis,X,Y,Z},
		["Flash"] = {Preis,X,Y,Z},
		["Euros"] = {Preis,X,Y,Z},
		["Feltzer"] = {Preis,X,Y,Z},
		["Sunrise"] = {Preis,X,Y,Z},
	},
	["Grottis"] = 
	{	["Bravura"] = {Preis,X,Y,Z},
		["Manana"] = {Preis,X,Y,Z},
		["Blista Compact"] = {Preis,X,Y,Z},
		["Cadrona"] = {Preis,X,Y,Z},
		["Tampa"] = {Preis,X,Y,Z},
		["Clover"] = {Preis,X,Y,Z},
		["Blade"] = {Preis,X,Y,Z},
		["Willard"] = {Preis,X,Y,Z},
		["Perennial"] = {Preis,X,Y,Z},
		["Intruder"] = {Preis,X,Y,Z},
		["Solair"] = {Preis,X,Y,Z},
		["Club"] = {Preis,X,Y,Z},
	},
	["Wang Cars"] = 
	{	["Washington"] = {Preis,X,Y,Z},
		["Savanna"] = {Preis,X,Y,Z},
		["Premier"] = {Preis,X,Y,Z},
		["Elegant"] = {Preis,X,Y,Z},
		["Vincent"] = {Preis,X,Y,Z},
		["Primo"] = {Preis,X,Y,Z},
		["Merit"] = {Preis,X,Y,Z},
		["Tahoma"] = {Preis,X,Y,Z},
		["Emperor"] = {Preis,X,Y,Z},
		["Regina"] = {Preis,X,Y,Z},
		["Stratum"] = {Preis,X,Y,Z},
	},
	["Bayside Exotics"] = 
	{	["Windsor"] = {Preis,X,Y,Z},
		["Hustler"] = {Preis,X,Y,Z},
		["Remington"] = {Preis,X,Y,Z},
		["Broadway"] = {Preis,X,Y,Z},
		["Tornado"] = {Preis,X,Y,Z},
		["Voodoo"] = {Preis,X,Y,Z},
		["Stretch"] = {Preis,X,Y,Z},
		["Admiral"] = {Preis,X,Y,Z},
		["Oceanic"] = {Preis,X,Y,Z},
		["Stafford"] = {Preis,X,Y,Z},
	},
	["Shody Used Autos"] = 
	{	["Moonbeam"] = {Preis,X,Y,Z},
		["Burrito"] = {Preis,X,Y,Z},
		["Camper"] = {Preis,X,Y,Z},
		["Journey"] = {Preis,X,Y,Z},
		["Bobcat"] = {Preis,X,Y,Z},
		["Yosemite"] = {Preis,X,Y,Z},
		["Rancher"] = {Preis,X,Y,Z},
		["Huntley"] = {Preis,X,Y,Z},
		["Sandking"] = {Preis,X,Y,Z},
	},
	["Coutt and Schutz"] =
	{	["BMX"] = {Preis,X,Y,Z},
		["Bike"] = {Preis,X,Y,Z},
		["Mountain Bike"] = {Preis,X,Y,Z},
		["Wayfarer"] = {Preis,X,Y,Z},
		["PCJ-600"] = {Preis,X,Y,Z},
		["Faggio"] = {Preis,X,Y,Z},
		["Freeway"] = {Preis,X,Y,Z},
		["Sanchez"] = {Preis,X,Y,Z},
		["FCR-900"] = {Preis,X,Y,Z},
		["BF-400"] = {Preis,X,Y,Z},
	},
	["Los Santos International Airport"] =
	{	["Sparrow"] = {Preis,X,Y,Z},
		["Maverick"] = {Preis,X,Y,Z},
		["Dodo"] = {Preis,X,Y,Z},
		["Beagle"] = {Preis,X,Y,Z},
		["Stuntplane"] = {Preis,X,Y,Z},
		["Shamal"] = {Preis,X,Y,Z},
	},
}





