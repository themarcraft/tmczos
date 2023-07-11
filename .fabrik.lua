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
  PrintCentered("Fabrik v2.0")
  term.setCursorPos(15, 5)
  PrintCentered("Wähle ein Programm")

  term.setCursorPos(20, 7)
  term.setBackgroundColor(256)
  term.write("  Alarm  ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 9)
  term.setBackgroundColor(256)
  term.write(" Alarm2  ")
  term.setBackgroundColor(32768)

  term.setCursorPos(20, 11)
  term.setBackgroundColor(256)
  term.write(" Server  ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 13)
  term.setBackgroundColor(256)
  term.write(" VServer ")
  term.setBackgroundColor(32768)
  
  term.setCursorPos(20, 15)
  term.setBackgroundColor(256)
  term.write(" Beenden ")
  term.setBackgroundColor(32768)
  

  local event, button, xPos, yPos = os.pullEvent("mouse_click")
  term.setCursorPos(1, 18)

  if (xPos > 19 and xPos < 29) and (yPos > 6 and yPos < 8) then
      clear()
      shell.run("/tmczos/alarm")
    --print("> Alarmsystem")
  elseif (xPos > 19 and xPos < 29) and (yPos > 8 and yPos < 10) then
      clear()
      shell.run("/tmczos/alarmf")
    --print("> Alarmsystem")
  elseif (xPos > 19 and xPos < 29) and (yPos > 10 and yPos < 12) then
      clear()
      shell.run("/tmczos/get")
    --print("> Alarmserver")
  elseif (xPos > 19 and xPos < 29) and (yPos > 12 and yPos < 14) then
      clear()
      shell.run("/tmczos/vget")
    --print("> Dateimanager")
  elseif (xPos > 19 and xPos < 29) and (yPos > 14 and yPos < 16) then
    p.eject()
  else
      --Invalid
  end
end
