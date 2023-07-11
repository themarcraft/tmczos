local modem = peripheral.find("modem")

function PrintCentered(sText)
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
    print(sText)
end

function Center()
    sText = "PIN: XX"
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
end

term.clear()

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(13, 5)
PrintCentered("Willkommen im Alarmsystem")
term.setCursorPos(13, 6)
PrintCentered("Um die Türen zu öffnen")
term.setCursorPos(13, 7)
PrintCentered("Gebe die Pin ein")

while true do
term.setCursorPos(13, 9)
 PrintCentered("PIN: ")

 input = read("*")
 if input == "42" then
    modem.transmit(3,1,"doors")
 end
 os.reboot()
end
