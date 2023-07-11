p = peripheral.find("drive")

shell.run("clear")
function clear()
 term.clear()
 term.setCursorPos(1,1)
end

function PrintCentered(sText)
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
    print(sText)
end

while true do
    clear()
    term.setCursorPos(20, 3)
    term.setTextColor(32)
    term.write(" tmczOS ")
    term.setTextColor(1)
    term.setCursorPos(15, 4)
    term.write("  MusikPlayer v1  ")

    if p.hasAudio() then
        title = p.getAudioTitle()
      
        term.setCursorPos(20, 7)
        term.write("Eingelegt:")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 9)
        PrintCentered(title)
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 11)
        term.setBackgroundColor(256)
        term.write("  Start  ")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 13)
        term.setBackgroundColor(256)
        term.write("  Stop   ")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 15)
        term.setBackgroundColor(256)
        term.write("Auswerfen")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 17)
        term.setBackgroundColor(256)
        term.write(" Beenden ")
        term.setBackgroundColor(32768)
      
        local event, button, xPos, yPos = os.pullEvent("mouse_click")
        term.setCursorPos(1, 18)
      
        if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
            --BTN1
        elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
            --BTN2
        elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
            term.setCursorPos(20, 11)
            term.setBackgroundColor(32)
            term.write("  Start  ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.playAudio()
        elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
            term.setCursorPos(20, 13)
            term.setBackgroundColor(32)
            term.write("  Stop   ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.stopAudio()
        elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
            term.setCursorPos(20, 15)
            term.setBackgroundColor(32)
            term.write("Auswerfen")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.ejectDisk()
        elseif (xPos > 19 and xPos < 29) and (yPos > 16 and yPos < 18) then
            term.setCursorPos(20, 17)
            term.setBackgroundColor(32)
            term.write(" Beenden ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.stopAudio()
            p.eject()
        else
            --Invalid
        end
    else      
        term.setCursorPos(20, 7)
        term.write("Eingelegt:")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 9)
        term.write(" Nichts  ")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 11)
        term.setBackgroundColor(256)
        term.write("  Start  ")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 13)
        term.setBackgroundColor(256)
        term.write("  Stop   ")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 15)
        term.setBackgroundColor(256)
        term.write("Auswerfen")
        term.setBackgroundColor(32768)
        
        term.setCursorPos(20, 17)
        term.setBackgroundColor(256)
        term.write(" Beenden ")
        term.setBackgroundColor(32768)
      
        local event, button, xPos, yPos = os.pullEvent("mouse_click")
        term.setCursorPos(1, 18)
      
        if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
            --BTN1
        elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
            --BTN2
        elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
            term.setCursorPos(20, 11)
            term.setBackgroundColor(32)
            term.write("  Start  ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.playAudio()
        elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
            term.setCursorPos(20, 13)
            term.setBackgroundColor(32)
            term.write("  Stop   ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.stopAudio()
        elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
            term.setCursorPos(20, 15)
            term.setBackgroundColor(32)
            term.write("Auswerfen")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.ejectDisk()
        elseif (xPos > 19 and xPos < 29) and (yPos > 16 and yPos < 18) then
            term.setCursorPos(20, 17)
            term.setBackgroundColor(32)
            term.write(" Beenden ")
            term.setBackgroundColor(32768)
            sleep(0.1)
            p.stopAudio()
            p.eject()
        else
            --Invalid
        end
    end
  
end
