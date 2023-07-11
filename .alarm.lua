os.loadAPI("tmczos/BryButtonAPI")

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(13, 5)
term.write("Willkommen im Alarmsystem")
term.setCursorPos(13, 6)
term.write("   Um zurück zu kommen   ")
term.setCursorPos(13, 7)
term.write("      halte STRG + T     ")
term.setCursorPos(13, 8)
term.write("    oder drücke \"<--\"  ")
term.setCursorPos(13, 9)
term.write("     auf dem Monitor     ")
term.setCursorPos(13, 11)

monitor = peripheral.find("monitor")
monitor.setTextScale(1)

local modem = peripheral.wrap("front")

function alarm()
	modem.transmit(3, 1, "alarm") 
end

function doors()
	modem.transmit(3, 1, "doors") 
end

function stop()
	modem.transmit(3, 1, "stop") 
end

function exit()
	monitor.setBackgroundColor(32768)
	monitor.clear()
	p.exit()
end

function submenu()
	exitSubmenuFlag = false
	BryButtonAPI.drawButtons(monitor, submenuList)
	while not exitSubmenuFlag do 
		BryButtonAPI.checkButtonsPressed(monitor, submenuList, 15, exitSubmenu)
	end
end

function exitSubmenu()
	exitSubmenuFlag = true
end

red = colors.red
green = colors.green

alarmbtn = BryButtonAPI.createNewButton(3, 4, "  ALARM!!!   ", red, green, false, alarm)
more = BryButtonAPI.createNewButton(11, 8, " Mehr", red, green, false, submenu)
exit = BryButtonAPI.createNewButton(3, 8, " <-- ", red, green, false, exit)
list = {alarmbtn, more, exit}

doorButton = BryButtonAPI.createNewButton(11, 8, " Tür ", red, green, false, doors)
stopButton = BryButtonAPI.createNewButton(3, 4, "    Stop     ", red, green, false, stop)
exitSubmenuButton = BryButtonAPI.createNewButton(3, 8, " <-- ", red, green, false, exitSubmenu)
exitSubmenuFlag = false
submenuList = {doorButton, stopButton, exitSubmenuButton}


BryButtonAPI.drawButtons(monitor, list)
while true do
	BryButtonAPI.checkButtonsPressed(monitor, list, 0, print)
end
