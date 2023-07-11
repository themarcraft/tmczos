shell.run("clear")
function clear()
 term.clear()
 term.setCursorPos(1,1)
end
menu=1
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
  term.setCursorPos(15, 5)
  PrintCentered("Wähle ein Programm")

  if menu==1 then
    
    term.setCursorPos(20, 7)
    term.setBackgroundColor(256)
    term.write(" Fabrik  ")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 9)
    term.setBackgroundColor(256)
    term.write(" Bahnhof ")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 11)
    term.setBackgroundColor(256)
    term.write(" Dateien ")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 13)
    term.setBackgroundColor(256)
    term.write("  Musik  ")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 15)
    term.setBackgroundColor(256)
    term.write(" Weitere ")
    term.setBackgroundColor(32768)
  elseif menu==2 then
    term.setCursorPos(20, 7)
    term.setBackgroundColor(256)
    term.write(" Konsole ")
    term.setBackgroundColor(32768)

    term.setCursorPos(20, 9)
    term.setBackgroundColor(256)
    term.write("Entfernen")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 11)
    term.setBackgroundColor(256)
    term.write(" Update  ")
    term.setBackgroundColor(32768)

    term.setCursorPos(20, 13)
    term.setBackgroundColor(256)
    term.write("   Aus   ")
    term.setBackgroundColor(32768)
    
    term.setCursorPos(20, 15)
    term.setBackgroundColor(256)
    term.write(" Zurück  ")
    term.setBackgroundColor(32768)
  end
  
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    term.setCursorPos(1, 18)
    if menu==1 then
      if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
        term.setCursorPos(20, 7)
        term.setBackgroundColor(32)
        term.write(" Fabrik  ")
        term.setBackgroundColor(32768)
        sleep(0.1)
        clear()
        shell.run("clear")
        shell.run("fg tmczos/fabrik")
        --print("> Alarmsystem")
      elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
        term.setCursorPos(20, 9)
        term.setBackgroundColor(32)
        term.write(" Bahnhof ")
        term.setBackgroundColor(32768)
        sleep(0.1)
        shell.run("fg tmczos/bahnhof")
        --print("> Alarmserver")
      elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
        term.setCursorPos(20, 11)
        term.setBackgroundColor(32)
        term.write(" Dateien ")
        term.setBackgroundColor(32768)
        sleep(0.1)
        shell.run("fg tmczos/files")
        --print("> Dateimanager")
      elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
        term.setCursorPos(20, 13)
        term.setBackgroundColor(32)
        term.write("  Musik  ")
        term.setBackgroundColor(32768)
        sleep(0.1)
        shell.run("fg /tmczos/musicplayer")
      elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
        term.setCursorPos(20, 15)
        term.setBackgroundColor(32)
        term.write(" Weitere ")
        term.setBackgroundColor(32768)
        sleep(0.1)
        menu=2
      elseif (xPos > 19 and xPos < 29) and (yPos > 16 and yPos < 18) then
        --print("> Herunterfahren")
      else
          --Invalid
      end
    elseif menu==2 then
      if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
        term.setCursorPos(20, 7)
        term.setBackgroundColor(32)
        term.write(" Konsole ")
        term.setBackgroundColor(32768)
        sleep(0.1)  
        shell.run("fg /tmczos/console")
      elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
        term.setCursorPos(20, 9)
        term.setBackgroundColor(32)
        term.write("Entfernen")
        term.setBackgroundColor(32768)
        sleep(0.1)  
        shell.run("fg /tmczos/uninstall")
      elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
        term.setCursorPos(20, 11)
        term.setBackgroundColor(32)
        term.write(" Update  ")
        term.setBackgroundColor(32768)
        sleep(0.1)  
        shell.run("/disk/update")
      elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
        term.setCursorPos(20, 13)
        term.setBackgroundColor(32)
        term.write("   Aus   ")
        term.setBackgroundColor(32768)
        sleep(0.1)  
        os.shutdown()
      elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
        term.setCursorPos(20, 15)
        term.setBackgroundColor(32)
        term.write(" Zurück  ")
        term.setBackgroundColor(32768)
        sleep(0.1)  
        menu=1
      elseif (xPos > 19 and xPos < 29) and (yPos > 16 and yPos < 18) then
        --print("> Herunterfahren")
      else
          --Invalid
      end
    end
end