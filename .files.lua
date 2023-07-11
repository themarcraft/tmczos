
root = "/"
scroll = 0
allowScroll = false
scrollText = ""
rendLine = true
fileSelected = ""
clickDoubleTimer = false
lasClickDoubleTimer = false
cdTimer = 0
cdLasTimer = 0
cdTotalTimer = 0
copyFile = ""
deleteFiles = true
openWith = ""
Who = "for tmczOS"
instaClose = true
Version = "Filemanager v1.0"
timeX = ""
renderTime = true
dragLasY = 0
changepos = true
--TEXT ENTER VAR
enterText = false
textData = ""
textPurpose = ""
--END
fSetFile = true
loopRun = true
w, h = term.getSize()
h = h - 1
renderXX = true
--DEBUG FEATURE REMOVE
renstr = ""
--END
blackStr = ""
for i=1,w do
	blackStr = blackStr.." "
end
menuVisible = false
menuX = w + 50
menuY = h + 51
menuWidth = 10
menuHeight = 7
menuItems = {}
menuItemsRenX = {}
filesx = {}
directoriesx = {}
xtra = 3
screenpos = {}
filepos = {}
menuCheck = false

function startMain()
	
	function Even(number)
		even = true
		for i=1,number do
			if even == true then
				even = false
			else
				even = true
			end
		end
		return even
	end

	function displayError(errorA)
		renderXX = false
		term.clear()
		term.setCursorPos(w / 2 + string.len(errorA) / 2, h + 1 / 2)
		write(errorA)
		os.pullEvent("key")
		renderXX = true
	end

	function keyPressWait()
		print("[Lemon] Press Any Key...")
		os.pullEvent("key")
	end

	function fManRun(locationPath)
		if fs.exists(locationPath) == true then
			if openWith ~= "" then
				renderXX = false
				term.setBackgroundColor(colors.black)
				term.setTextColor(colors.white)
				term.clear()
				term.setCursorPos(1, 1)
				shell.run(locationPath, tostring(openWith))
				print("[Lemon] Press Any Key...")
				os.pullEvent("key")
				renderXX = true
				openWith = ""
			else
				renderXX = false
				term.setBackgroundColor(colors.black)
				term.setTextColor(colors.white)
				term.clear()
				term.setCursorPos(1, 1)
				shell.run(locationPath)
				print("[Lemon] Press Any Key...")
				os.pullEvent("key")
				renderXX = true
			end
		end
	end

	function dataReader(data, sep, onelas, cooler)
		if type(data) == "string" then
			dataR = {}
			dataR[1] = ""
			readingIndex = 1
			for i=1,string.len(data) do
				currChar = string.sub(data, i, i)
				if currChar == sep then
					readingIndex = readingIndex + 1
					dataR[readingIndex] = ""
				else
					dataR[readingIndex] = dataR[readingIndex]..currChar
				end
			end
		else
			dataR[1] = ""
		end
		if onelas == 1 then
			dataR[1] = dataR[readingIndex]
		end
		if cooler == 1 then
			dataR[1] = readingIndex
		end
		return dataR
	end

	function menuResolve(menuString, argsxx)
		if menuString == "Run" then
			if fs.isDir(root..fileSelected) == false then
				fManRun(root..fileSelected)
			else
				if changepos == true then
					root = root..fileSelected.."/"
				end
				fileSelected = ""
			end
		elseif menuString == "Edit" then
			if fs.isDir(root..fileSelected) == false then
				renderXX = false
				term.setBackgroundColor(colors.black)
				term.setTextColor(colors.white)
				term.clear()
				term.setCursorPos(1, 1)
				shell.run("edit", root..fileSelected)
				renderXX = true
			end
		elseif menuString == "Copy" then
			copyFile = root..fileSelected
		elseif menuString == "Delete" then
			if fs.exists(root..fileSelected) == true then
				if deleteFiles == true then
					fs.delete(root..fileSelected)
					fileSelected = nil
				end
			end
		elseif menuString == "Deselect" then
			if changepos == true then
				fileSelected = ""
			end
		elseif menuString == "Open with" then
			if openWith == "" then
				openWith = root..fileSelected
			else
				openWith = ""
			end
		elseif menuString == "Yes" then
			loopRun = false
			term.setBackgroundColor(colors.black)
			term.setTextColor(colors.white)
			term.clear()
			term.setCursorPos(1, 1)
			loopRun = false
		elseif menuString == "No" then
			fSetFile = true
			if fileSelected == "" then
				menuItems = {"Paste", "New", "nfx"}
				menuItemsRenX = {"  Paste   ", "   New    ", "New Folder"}
			else
				menuItems = {"Run", "----------", "Edit", "Copy", "Delete", "Deselect", "Open with", "rnm"}
				menuItemsRenX = {"   Run    ", "----------", "   Edit   ", "   Copy   ", "  Delete  ", " Deselect ", "Open With.", "  Rename  "}
			end
		elseif menuString == "nfx" then
			enterText = true
			textData = ""
			textPurpose = "nf"
		elseif menuString == "nf" then
			if argsxx ~= nil then
				if fs.exists(root..argsxx) == false then
					fs.makeDir(argsxx)
					fileSelected = argsxx
				end
			end
		elseif menuString == "Paste" then
			if fs.exists(copyFile) == true then
				copyFileString = dataReader(copyFile, "/", 1)[1]
				if fs.exists(root..copyFileString) == true then
					
				else
					
				end
				copyFileRoot = ""
				rootsX = tostring(dataReader(copyFile, "/", 0, 1)[1])
				--rootsX = 3
				for i=2,rootsX - 1 do
					copyFileRoot = copyFileRoot.."/"..dataReader(copyFile, "/", 0, 0)[i]
				end
				copyFileRoot = copyFileRoot.."/" 
				rnn = copyFileString
				num = 2
				errorX = false
				if fs.exists(root..rnn) == true then
					while true do
						if fs.exists(root..rnn) == true then
							rnn = copyFileString
							rnn = rnn..tostring(num)
							num = num + 1
						else
							break
						end
					end
				end
				if fs.isDir(copyFile) == true then
					fs.copy(copyFile, root..rnn)
				else
					readerX = fs.open(copyFile, "r")
					copyDataX = readerX.readAll()
					readerX.close()
					writerX = fs.open(root..rnn, "w")
					writerX.write(copyDataX)
					writerX.close()
				end
			end
		elseif menuString == "rnm" then
			changepos = false
			enterText = true
			textData = ""
			textPurpose = "rename"
		elseif menuString == "rename" then
			if fileSelected ~= nil and fileSelected ~= "" then
				if fs.exists(root..tostring(argsxx)) == false then
					fs.copy(root..fileSelected, root..tostring(argsxx))
					fs.delete(root..fileSelected)
					fileSelected = nil
				end
				changepos = true
			end
		elseif menuString == "New" then
			enterText = true
			textData = ""
			textPurpose = "nw"
		elseif menuString == "nw" then
			if fs.exists(root..argsxx) == false then
				fileNew = fs.open(root..argsxx, "w")
				fileNew.write("")
				fileNew.close()
				fileSelected = argsxx
			end
		else
		
		end
	end

	function backUpRoot(rootP)
		if rootP ~= "/" then
			rootx = rootP
			lef = string.len(rootP) - 1
			for i=1,string.len(rootP) do
				check = i + lef
				check = check - 1
				if check > 0 then
					--DO CHECK HERE
					if string.sub(rootP, check, check) == "/" then
						break
					end
					--END CHECK HERE
					lef = lef - 2
				end
			end
			rootx = string.sub(rootx, 1, check)
		else
			rootx = rootP
		end
		return rootx
	end

	function getFiles(path, many)
		files = {"", ""}
		mIndex = 1
		cout = 0
		sDir = shell.resolve( path )
		local tAll = fs.list( sDir )
		for n, sItem in pairs( tAll ) do
			local sPath = fs.combine( sDir, sItem )
			if fs.isDir( sPath ) == false then
				files[mIndex] = dataReader(sPath, "/", 1)[1]
				mIndex = mIndex + 1
				files[mIndex] = ""
				cout = cout + 1
			end
		end
		if many == 1 then
			files[1] = cout
		end
		return files
	end

	function getDirectories(path, many)
		directories = {"", ""}
		mIndex = 1
		cout = 0
		sDir = shell.resolve( path )
		local tAll = fs.list( sDir )
		for n, sItem in pairs( tAll ) do
			local sPath = fs.combine( sDir, sItem )
			if fs.isDir( sPath ) then
				directories[mIndex] = dataReader(sPath, "/", 1)[1]
				mIndex = mIndex + 1
				directories[mIndex] = ""
				cout = cout + 1
			end
		end
		if many == 1 then
			directories[1] = cout
		end
		return directories
	end

	function updateList()
		filesMany = getFiles(root, 1)[1]
		directoriesMany = getDirectories(root, 1)[1]
		filesx = getFiles(root, 0)
		directoriesx = getDirectories(root, 0)
		scrollText = ""
		for i=1,w / 2 do
			scrollText = scrollText.."v"
		end
		for i=1,w / 2 do
			scrollText = scrollText.."^"
		end
		if fileSelected == nil or fileSelected == " " then
			fileSelected = ""
		end
		menuVisible = true
		menuX = w - menuWidth - 1
		menuY = 2
		renstr = openWith
		if fSetFile == true then
			if fileSelected == "" or fileSelected == nil or fileSelected == " " then
				menuItems = {"Paste", "New", "nfx"}
				menuItemsRenX = {"  Paste   ", " New File ", "New Folder"}
			else
				menuItems = {"Run", "----------", "Edit", "Copy", "Delete", "Deselect", "Open with", "rnm"}
				menuItemsRenX = {"   Run    ", "----------", "   Edit   ", "   Copy   ", "  Delete  ", " Deselect ", "Open With.", "  Rename  "}
			end
		end
		menuHeight = table.getn(menuItems)
		timeX = tostring(textutils.formatTime(os.time(), false))
		if string.sub(root, string.len(root) - 1, string.len(root)) == "//" then
			root = string.sub(root, 1, string.len(root) - 1)
		end
	end
	
	function render()
		while loopRun == true do
			sleep(0)
			if loopRun == false then
				term.setBackgroundColor(colors.black)
				term.setTextColor(colors.white)
				term.clear()
				term.setCursorPos(1, 1)
			end
			if renderXX == true then
				if clickDoubleTimer ~= lasClickDoubleTimer then
					if clickDoubleTimer == true then
						cdTimer = os.time()
						cdLasTimer = os.time()
					else
						cdTotalTimer = 0
					end
					lasClickDoubleTimer = clickDoubleTimer
				end
				if clickDoubleTimer == true then
					cdTimer = os.time()
					cdTotalTimer = cdTimer - cdLasTimer
					if cdTotalTimer > 0.003 then
						clickDoubleTimer = false
					end
				end
				term.setBackgroundColor(colors.white)
				term.clear()
				ind = 1
				allowScroll = true
				for i=4,h do
					term.setCursorPos(1, i)
					--RENDER AND DOCUMENT ALL FILES!!
					if directoriesx[i - 3 + scroll] ~= nil and directoriesx[i - 3 + scroll] ~= "" then
						term.setBackgroundColor(colors.gray)
						term.setTextColor(colors.white)
						write("[=]")
						term.setBackgroundColor(colors.white)
						term.setTextColor(colors.gray)
						screenpos[i] = directoriesx[i - 3 + scroll]
						if directoriesx[i - 3 + scroll] == fileSelected then
							term.setBackgroundColor(colors.lightBlue)
							write(" "..directoriesx[i - 3 + scroll]..string.sub(blackStr, 1, w))
						else
							write(" "..directoriesx[i - 3 + scroll])
						end
					end
					if ind > directoriesMany - scroll then
						if filesx[ind - directoriesMany + scroll] ~= nil and filesx[ind - directoriesMany + scroll] ~= "" then
							term.setBackgroundColor(colors.gray)
							if openWith ~= "" then
								if openWith ~= root..filesx[ind - directoriesMany + scroll] then
									term.setTextColor(colors.orange)
								else
									term.setTextColor(colors.lime)
								end
							else
								term.setTextColor(colors.lime)
							end
							write("-~-")
							term.setBackgroundColor(colors.white)
							term.setTextColor(colors.gray)
							filepos[i] = filesx[ind - directoriesMany + scroll]
							if filesx[ind - directoriesMany + scroll] == fileSelected then
								term.setBackgroundColor(colors.lightBlue)
								write(" "..filesx[ind - directoriesMany + scroll]..string.sub(blackStr, 1, w))
							else
								write(" "..filesx[ind - directoriesMany + scroll])
							end
						end
					end
					--END
					ind = ind + 1
				end
				term.setBackgroundColor(colors.lightBlue)
				term.setCursorPos(1, 1)
				term.clearLine()
				term.setTextColor(colors.white)
				write("[Beenden]")
				if renderTime == true then
					term.setCursorPos(w - string.len(timeX), 1)
					write(timeX)
				end
				term.setTextColor(colors.lightGray)
				term.setBackgroundColor(colors.white)
				term.setCursorPos(1, 2)
				write(root..string.sub(blackStr, 1, w))
				term.setCursorPos(1, 3)
				term.setBackgroundColor(colors.gray)
				term.setTextColor(colors.lightBlue)
				write("<< ")
				if fileSelected == ".." then
					term.setBackgroundColor(colors.lightBlue)
				else
					term.setBackgroundColor(colors.white)
				end
				term.setTextColor(colors.lightGray)
				write(" .."..string.sub(blackStr, 1, w))
				term.setCursorPos(1, h + 1)
				term.setBackgroundColor(colors.yellow)
				term.clearLine()
				term.setTextColor(colors.cyan)
				if enterText == false then
					write(Version.." "..Who)
				else
					write(textData.."|")
				end
				if allowScroll == true then
					term.setCursorPos(w, h + 1)
					term.setBackgroundColor(colors.gray)
					term.setTextColor(colors.white)
					if scroll < directoriesMany + filesMany - h + 3 then
						write("v")
					else
						write(" ")
					end
					term.setCursorPos(w, 2)
					if scroll ~= 0 then
						write("^")
					else
						write(" ")
					end
					term.setCursorPos(w - 1, h + 1)
					term.setBackgroundColor(colors.gray)
					term.setTextColor(colors.white)
					if scroll < directoriesMany + filesMany - h + 3 then
						write("v")
					else
						write(" ")
					end
					term.setCursorPos(w - 1, 2)
					if scroll ~= 0 then
						write("^")
					else
						write(" ")
					end
					if scroll < directoriesMany + filesMany - h + 3 or scroll ~= 0 then
						switch = 1
						for i=3,h do
							if switch == 1 then
								switch = 1
								term.setBackgroundColor(colors.gray)
							else
								switch = 1
								term.setBackgroundColor(colors.lightGray)
							end
							term.setCursorPos(w, i)
							write(" ")
							term.setCursorPos(w - 1, i)
							write(" ")
						end
					else
						for i=3,h do
							term.setBackgroundColor(colors.gray)
							term.setCursorPos(w, i)
							write(" ")
							term.setCursorPos(w - 1, i)
							write(" ")
						end
					end
				end
				if menuVisible == true then
					if fSetFile == true then
						term.setBackgroundColor(colors.cyan)
					else
						term.setBackgroundColor(colors.green)
					end
					term.setTextColor(colors.black)
					for i=1,table.getn(menuItems) do
						term.setCursorPos(menuX, menuY + i - 1)
						if menuItemsRenX[i] ~= nil then
							write(menuItemsRenX[i])
						end
					end
					for i=table.getn(menuItems) + 1,h + 1 do
						term.setCursorPos(menuX, menuY + i - 1)
						write("          ")
					end
				end
			end
			if loopRun == false then
				term.setBackgroundColor(colors.black)
				term.setTextColor(colors.white)
				term.clear()
				term.setCursorPos(1, 1)
			end
		end
	end
	
	function input()
		while true do
			local event, p1, p2, p3 = os.pullEvent()
			if event == "mouse_click" then
				if menuVisible == false then
					menuCheck = true
				else
					if p2 > menuX - 1 and p2 < menuX - 1 + menuWidth + 1 and p3 > menuY - 1 and p3 < menuY - 1 + menuHeight + 1 then
						menuCheck = false
						itM = p3 - menuY + 1
						if menuItems[itM] ~= nil then
							if fSetFile == true then
								if fileSelected ~= nil and fileSelected ~= "" then
									menuResolve(tostring(menuItems[itM]))
								end
								if fileSelected == "" then
									menuResolve(tostring(menuItems[itM]))
								end
							else
								menuResolve(tostring(menuItems[itM]))
							end
						else
							break
						end
					else
						menuCheck = true
					end
				end
				if menuCheck == true then
					if p3 == 1 then
						if p1 == 1 then
							if p2 < 8 then
								if instaClose == true then
									menuResolve("Yes")
								else
									fSetFile = false
									menuItems = {"Yes", "No"}
									menuItemsRenX = {"   Yes    ", "    No    "}
								end
							end
						end
					elseif p3 == 3 then
						if changepos == true then
							fileSelected = ".."
						end
						if cdTotalTimer ~= 0 then
							if changepos == true then
								root = backUpRoot(root)
							end
							scroll = 0
						end
						clickDoubleTimer = true
					elseif p3 < h + 1 then
						if p3 ~= 2 then
							if p2 <= w - menuWidth - 2 then
								pe = p3 - 4
								file11 = false
								if pe >= directoriesMany - scroll then
									--Clicked On A File
									if filepos[p3] ~= nil and filepos[p3] ~= "" then
										file11 = true
										--renderXX = false
										--term.setBackgroundColor(colors.black)
										--term.setTextColor(colors.white)
										--term.clear()
										--term.setCursorPos(1, 1)
										--shell.run(root..filepos[p3])
										--renderXX = true
										if p1 == 1 then
											if changepos == true then
												fileSelected = filepos[p3]
											end
											if cdTotalTimer ~= 0 then
												fManRun(root..fileSelected)
												end
												clickDoubleTimer = true
											end
										else
											if changepos == true then
												fileSelected = filepos[p3]
											end
										end
									else
									--Clicked On A Folder
									if screenpos[p3] ~= nil and screenpos[p3] ~= "" then
										if p1 == 1 then
											if changepos == true then
												fileSelected = screenpos[p3]
											end
											if cdTotalTimer ~= 0 then
												if changepos == true then
													root = root..screenpos[p3].."/"
												end
												if changepos == true then
													fileSelected = ""
												end
											end
											clickDoubleTimer = true
										else
											if changepos == true then
												fileSelected = screenpos[p3]
											end
										end
									end
								end
							end
						else
							if p2 >= w - 1 then
								if allowScroll == true then
									if scroll ~= 0 then
										scroll = scroll - 1
									end
								end
							end
						end
					elseif p3 == h + 1 then
						if p2 >= w - 1 then
							if allowScroll == true then
								if scroll < directoriesMany + filesMany - h + 3 then
									scroll = scroll + 1
								end
							end
						end
					end
				end
			elseif event == "mouse_drag" then
				if allowScroll == true then
					if p2 >= w - 1 then
						if dragLasY ~= p3 then
							if p3 > dragLasY then
								if scroll < directoriesMany + filesMany - h + 3 then
									scroll = scroll + 1
								end
							else
								if scroll ~= 0 then
									scroll = scroll - 1
								end
							end
						end
						dragLasY = p3
					end
				end
			elseif event == "key" then
				if enterText == true then
					if p1 == 28 then
						local ok, err = (menuResolve(textPurpose, textData))
						textData = ""
						textPurpose = ""
						enterText = false
					elseif p1 == 14 then
						textData = string.sub(textData, 1, string.len(textData) - 1)
					end
				end
			elseif event == "char" then
				if enterText == true then
					textData = textData..p1
				end
			end
			updateList()
		end
	end
	updateList()
	
	parallel.waitForAny(render, input)

end

while true do
local ok, err = pcall(startMain)
	if not ok then
		term.setBackgroundColor(colors.blue)
		for i=-5,5 do
			term.setCursorPos(1, h / 2 + i)
			term.clearLine()
		end
		term.setTextColor(1)
		term.setCursorPos(math.floor(w-string.len(" Runtime Error! "))/2, h / 2 - 4)
		term.setBackgroundColor(colors.white)
		term.setTextColor(colors.blue)
		write(" Runtime Error! ")
		term.setCursorPos(math.floor(w-string.len(err))/2, h / 2 - 2)
		term.setBackgroundColor(colors.blue)
		term.setTextColor(1)
		write(err)
		term.setCursorPos(math.floor(w-string.len("A/?? - Continue Program"))/2, h / 2 + 2)
		write("A/?? - Continue Program")
		term.setCursorPos(math.floor(w-string.len("B - Terminate Program"))/2, h / 2 + 4)
		write("B - Terminate Program")
		local event, p1 = os.pullEvent("char")
		if p1 == "B" or p1 == "b" then
			term.setBackgroundColor(colors.black)
			term.setTextColor(colors.white)
			term.setCursorPos(1, 1)
			term.clear()
			break
		else
			changepos = true
			enterText = false
			textData = ""
			textPurpose = ""
			updateList()
		end
	else
		break
	end
end