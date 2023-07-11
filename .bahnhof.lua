shell.run("clear")
m = peripheral.find("modem")
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
  term.write("   Bahnhof v1.0    ")
  term.setCursorPos(15, 5)
  PrintCentered("Was möchtest du sperren/freigeben?")

  term.setCursorPos(20, 7)
  term.setBackgroundColor(256)
  term.write("Ausfahrt ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 9)
  term.setBackgroundColor(256)
  term.write("Einfahrt ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 11)
  term.setBackgroundColor(256)
  term.write("  -50m   ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 13)
  term.setBackgroundColor(256)
  term.write("  -100m  ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 15)
  term.setBackgroundColor(256)
  term.write(" Server  ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 17)
  term.setBackgroundColor(256)
  term.write(" Beenden ")
  term.setBackgroundColor(32768)

  local event, button, xPos, yPos = os.pullEvent("mouse_click")
  term.setCursorPos(1, 18)

  if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
    term.setCursorPos(20, 7)
    term.setBackgroundColor(32)
    term.write("Ausfahrt ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    clear()
    m.transmit(4,1,"Einfahrt")
  elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
    term.setCursorPos(20, 9)
    term.setBackgroundColor(32)
    term.write("Einfahrt ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    clear()
    m.transmit(4,1,"Ausfahrt")
  elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
    term.setCursorPos(20, 11)
    term.setBackgroundColor(32)
    term.write("  -50m   ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    clear()
    m.transmit(4,1,"50m")
  elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
    term.setCursorPos(20, 13)
    term.setBackgroundColor(32)
    term.write("  -100m  ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    clear()
    m.transmit(4,1,"100m")
  elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
    term.setCursorPos(20, 15)
    term.setBackgroundColor(32)
    term.write(" Server  ")
    term.setBackgroundColor(32768)
    sleep(0.1)
      clear()
      shell.run("/tmczos/bget")
    --print("> Dateimanager")
  elseif (xPos > 19 and xPos < 29) and (yPos > 16 and yPos < 18) then
    term.setCursorPos(20, 17)
    term.setBackgroundColor(32)
    term.write(" Beenden ")
    term.setBackgroundColor(32768)
    sleep(0.1)
    p.eject()
  else
      --Invalid
  end
end
