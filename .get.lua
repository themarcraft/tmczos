local modem = peripheral.wrap("front")
modem.open(3)

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(14, 5)
term.write("Programm GET gestartet ")
term.setCursorPos(14, 6)
term.write(" Um zurück zu kommen   ")
term.setCursorPos(14, 7)
term.write("    halte STRG + T     ")
term.setCursorPos(1, 9)

while true do
    local event, modemSide, senderChannel, 
    replyChannel, message, senderDistance = os.pullEvent("modem_message")
  
    if message=="stop" then
        rs.setOutput("back", true)
        sleep(0.1)
        rs.setOutput("back", false)
    elseif message=="doors" then
        rs.setOutput("right", true)
        sleep(0.1)
        rs.setOutput("right", false)
    elseif message=="alarm" then
        rs.setOutput("left", true)
        sleep(0.1)
        rs.setOutput("left", false)
    elseif message=="virus" then
        os.shutdown()
    end
    
    print("Der Knopf \""..message.. "\" wurde gedrückt")
end
    