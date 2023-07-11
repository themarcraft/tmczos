os.loadAPI("tmczos/BryButtonAPI")
local modem = peripheral.wrap("front")
monitor = peripheral.wrap("top")
monitor.setTextScale(1)

function alarm()
	shell.run('tmczos/alarm')
end

function get()
	monitor.clear()
	monitor.setCursorPos(1,1)
	shell.run('monitor top tmczos/get')
end

function data()
	monitor.clear()
	monitor.setCursorPos(1,1)
	monitor.write("Siehe Computer")
	shell.run('tmczos/files')
end

function aus()
	os.shutdown()
end

red = colors.red
green = colors.green

alarm = BryButtonAPI.createNewButton(3, 4, "Alarm", red, green, false, alarm)
get = BryButtonAPI.createNewButton(11, 4, " Get ", red, green, false, get)
data = BryButtonAPI.createNewButton (3, 8, "Files", red, green, false, data)
aus = BryButtonAPI.createNewButton(11, 8, " Aus ", red, green, false, aus)
list = {alarm, get, data, aus}

monitor = peripheral.wrap("top")
monitor.setTextScale(1)

BryButtonAPI.drawButtons(monitor, list)
while true do
	BryButtonAPI.checkButtonsPressed(monitor, list, 0, print)
end
