shell.run("clear")

term.setCursorPos(20, 3)
term.setTextColor(32)
term.write(" tmczOS ")
term.setTextColor(1)
term.setCursorPos(12, 5)
term.write("Sind sie sicher, dass sie")
term.setCursorPos(12, 6)
term.write("         tmczOS")
term.setCursorPos(12, 7)
term.write("   entfernenen möchten?")

term.setCursorPos(22, 11)
term.setBackgroundColor(256)
term.write(" Ja ")
term.setBackgroundColor(32768)

term.setCursorPos(22, 13)
term.setBackgroundColor(256)
term.write("Nein")
term.setBackgroundColor(32768)

local event, button, xPos, yPos = os.pullEvent("mouse_click")

if (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
    term.setCursorPos(22, 11)
    term.setBackgroundColor(256)
    term.write(" Ja ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    shell.run('rm startup tmczos')
    function clear()
     term.clear()
     term.setCursorPos(1,1)
    end
    clear()
    term.setCursorPos(1,6)
    print ("           tmczOS Erfolgreich Entfernt")
    print ("              --------------------")
    print ("               Schade das sie uns")
    print ("               entfernt haben :-(")
    print ("              --------------------")
    term.setCursorPos(1,17)
    print ("                     tmczOS")
    sleep(1)
    os.shutdown()

elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
    term.setCursorPos(22, 13)
    term.setBackgroundColor(32)
    term.write("Nein")
    term.setBackgroundColor(32768)
    sleep(0.1)
    shell.exit()
end