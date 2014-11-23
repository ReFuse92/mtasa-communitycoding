



function guiCreateTabMenue(x,y,w,h,rel,parent,tabs)
local tabmenue = guiCreateTabPanel(x,y,w,h,rel,parent)
guiSetAlpha(tabmenue,0.8)
guiSetFont(tabmenue,"default-normal")
	for i, v in pairs (tabs) do
		tabs[i] = guiCreateTab(v,tabmenue)
		guiSetFont(tabs[i],"default-normal")
	end
	tabs[#tabs+1] = guiCreateTab("[X]",tabmenue)
	guiSetFont(tabs[#tabs],"default-normal")
	
	addEventHandler("onClientGUITabSwitched",tabs[#tabs],function()
		destroyElement(tabmenue)
	end)
return tabmenue, tabs
end


local menue, tabs = guiCreateTabMenue(0,0,400,400,false,false,{"Tab 1 ", "Tab 3"})
guiCreateRadioButton(0,0,100,20,"Radioknopf",false,tabs[2])