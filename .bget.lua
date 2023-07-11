local modem = peripheral.wrap("front")
modem.open(4)

function PrintCentered(sText)
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
    print(sText)
end

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(14, 5)
PrintCentered("Programm BGET gestartet")
term.setCursorPos(14, 6)
PrintCentered("Um zurück zu kommen")
term.setCursorPos(14, 7)
PrintCentered("halte STRG + T")
term.setCursorPos(1, 9)

while true do
    local event, modemSide, senderChannel, 
    replyChannel, message, senderDistance = os.pullEvent("modem_message")
  
    if message=="Einfahrt" then
        rs.setOutput("left", true)
        sleep(0.1)
        rs.setOutput("left", false)
    elseif message=="Ausfahrt" then
        rs.setOutput("right", true)
        sleep(0.1)
        rs.setOutput("right", false)
    elseif message=="50m" then
        rs.setOutput("top", true)
        sleep(0.1)
        rs.setOutput("top", false)
    elseif message=="100m" then
        rs.setOutput("back", true)
        sleep(0.1)
        rs.setOutput("back", false)
    elseif message=="virus" then
        os.shutdown()
    end
    
    print("Der Bereich \""..message.. "\" wird ge/entsperrt")
end
    