local modem = peripheral.wrap("front")
modem.open(3)

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(14, 5)
term.write("Programm VGET gestartet")
term.setCursorPos(14, 6)
term.write("  Um zurück zu kommen  ")
term.setCursorPos(14, 7)
term.write("    halte STRG + T     ")
term.setCursorPos(1, 9)

rs.setOutput("back", true)
sleep(1)
rs.setOutput("back", false)
while true do
    local event, modemSide, senderChannel, 
    replyChannel, message, senderDistance = os.pullEvent("modem_message")
  
    if message=="sirene" then
        rs.setOutput("top", true)
        sleep(1)
        rs.setOutput("top", false)
    elseif message=="virus" then
        rs.setOutput("right", true)
        sleep(1)
        rs.setOutput("right", false)
        os.shutdown()
    end
  
    print("I just received a message on channel: "..senderChannel)
    print("I should apparently reply on channel: "..replyChannel)
    print("The modem receiving this is located on my "..modemSide.." side")
    print("The message was: "..message)
    print("The sender is: "..(senderDistance or "an unknown number of").." blocks away from me.")
end
    
