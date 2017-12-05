-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

UVCLTimesUV = {735,745,800,815,830,845,900,915,930,1000,1015,1030,1045,1100,1115,
	1200,1215,1230,1245,1300,1315,1330,1400,1415,1430,1445,1500,1515,1530,1545,
	1630,1645,1700,1715,1730,1745,1800,1830,1845,1900,2010,2120,2220,2255}
UVCLTimesUVLast = 2255

UVCLTimesRAW = {739,750,805,820,835,850,905,920,1005,1020,1035,1050,1105,1205,
	1220,1235,1250,1305,1320,1405,1420,1435,1450,1505,1520,1535,1635,1650,1705
	,1720,1735,1750,1835,1850,1905,1935,2045,2125,2220}
UVCLTimesRAWLast = 2220

FridayUV = {740,830,920,1025,1120,1240,1330,1435,1520,1610,1700,1755,1900}
FridayUVLast = 1900

FridayRAW = {700,750,840,945,1035,1155,1245,1350,1440,1710,1815}
FridayRAWLast = 1900

FrinightUV = {2020,2100,2145,2235,2315,2425,2510,2545}
FrinightUVLast = 2545

FrinightRAW = {1950,2030,2110,2205,2245,2355,2435,2515}
FrinightRAWLast = 2515

SaturdayUV = {830,910,955,1035,1130,1210,1250,1400,1440,1520,1600,1655,1735,
	1815,1855,1935,2030,2110,2150,2300,2340,2420,2515}
SaturdayUVLast = 2515

SaturdayRAW = {800,840,920,1000,1055,1135,1215,1325,1405,1445,1525,1620,1700,
	1740,1820,1900,1955,2035,2115,2225,2305,2345,2440}
SaturdayRAWLast = 2440

SundayUV = {830,910,955,1035,1130,1210,1250,1400,1440,1520,1600,1640,1720,
	1815,1855,1935,2045,2125,2205}
SundayUVLast = 2205

SundayRAW = {800,840,920,1000,1055,1135,1215,1325,1405,1445,1525,1605,1645,
	1740,1820,1900,2010,2050,2130}
SundayRAWLast = 2130

function toTimeString( x )
	if x == 0 then 
		return "Tomorrow"
	end
	local mins = x % 100
	local hours = math.floor( x / 100 )
	if hours > 24 then
		ampm = "am"
		hours = hours - 24
	elseif hours > 12 then
		ampm = "pm"
		hours = hours - 12
	else
		ampm = "am" 
	end
	if mins > 9 then
		timeString = "at "..tostring(hours)..":"..tostring(mins)..ampm
	else
		timeString = "at "..tostring(hours)..":0"..tostring(mins)..ampm
	end
	return timeString
end

function checkShuttleName(nextShuttle)
	if date.wday > 1 and date.wday < 6 then
		if nextShuttle > 1906 then
			shuttleName = "CV Bart"
		else
			shuttleName = "UVCL"
		end
	elseif date.wday == 6 and hhmm <= 1900 then
		shuttleName = "CV Bart"
	elseif date.wday == 6 then
		shuttleName = "Hayward Bart"
	elseif date.wday == 7 and hhmm <= 145 then
		shuttleName = "Hayward Bart"
	elseif date.wday == 7 then
		shuttleName = "Hayward Bart"
	elseif date.wday == 1 and hhmm <= 115 then 
		shuttleName = "Hayward Bart"
	elseif date.wday == 1 then
		shuttleName = "Hayward Bart"
	end
end

function incrementTime()
	lastI = lastI + 1
	if lastArr[lastI] then
		if isUVCL and lastArr[lastI] > 1905 then 
			shuttleName = "CV Bart"
		end
	else
		shuttleName = "Next Shuttle"
	end

	if lastArr[lastI] then
		nextShuttle = lastArr[lastI]
	else
		nextShuttle = 0
		lastI = lastI - 1
	end
	checkShuttleName(nextShuttle)
	displayNext()
	timeChanged = true
end

function decrementTime()
	if shuttleName ~= "Next Shuttle" then
		lastI = lastI - 1
	end
	if lastArr[lastI] then
		if isUVCL and lastArr[lastI] > 1905 then 
			shuttleName = "CV Bart"
		end
	else
		shuttleName = "Next Shuttle"
	end

	if lastArr[lastI] then
		nextShuttle = lastArr[lastI]
	else
		nextShuttle = 0
	end
	checkShuttleName(nextShuttle)
	displayNext()
	timeChanged = true
end

function onNextShuttleTouch( event )
	if event.phase == "began" then
		timeChanged = false
		print("inEventBegan")
	end
	if event.phase == "moved" and event.y - event.yStart > 10 then
		if not timeChanged then	
			timer.performWithDelay( 100, incrementTime())
		end
	end
	if event.phase == "moved" and event.y - event.yStart < -10 then
		if not timeChanged then	
			timer.performWithDelay( 100, decrementTime())
		end
	end
end

function processDate()
	date = os.date( "*t" )
	hhmm = (date.hour * 100) + date.min
	hhmm = 1800
	isUVCL = false
	isFriday = false
	isFrinight = false
	isSaturday = false
	isSunday = false

	if date.wday > 1 and date.wday < 6 then
		isUVCL = true
	elseif date.wday == 6 and hhmm <= 1900 then
		isFriday = true
	elseif date.wday == 6 then
		isFrinight = true
	elseif date.wday == 7 and hhmm <= 145 then
		isFrinight = true
	elseif date.wday == 7 then
		isSaturday = true
	elseif date.wday == 1 and hhmm <= 115 then 
		isSaturday = true
	elseif date.wday == 1 then
		isSunday = true
	end
end

function displayNext()
	print("in DisplayNext")

	if nextShuttle == 0 then
		shuttleName = "Next Shuttle"
	end
	display.remove(nextShuttleBox)
	display.remove(nextShuttleText)

	nextShuttleBox = display.newRoundedRect( centerX, centerY*5/4, 400, 300, 40)
	nextShuttleBox:setFillColor(0.5,0.8,1)
	local options = 
	{
	    text = shuttleName.." is "..toTimeString(nextShuttle),     
	    x = centerX,
	    y = centerY * 5/4,
	    width = 400,
	    font = native.systemFont,   
	    fontSize = 50,
	    align = "center"  -- Alignment parameter
	} 
	nextShuttleText = display.newText(options)
	nextShuttleText:setFillColor( 0, 0, 0 )
	
	nextShuttleBox:addEventListener( "touch", onNextShuttleTouch)
end

function setNextShuttle( arr, i)
	lastArr = arr
	lastI = i
	nextShuttle = arr[i]
end

function findToCsu( event )
	if event.phase == "began" then
		findPlace = "csu"
		processDate()
		shuttleName = "Next Shuttle"
		if isUVCL then
			if hhmm > UVCLTimesUVLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > UVCLTimesUV[i] do
					i = i + 1
				end
				setNextShuttle(UVCLTimesUV, i)
				shuttleName = "UVCL"
			end
		elseif isFriday then
			if hhmm > FridayUVLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > FridayUV[i] do
					i = i + 1
				end
				setNextShuttle(FridayUV, i)
				shuttleName = "CV Bart"
			end
		elseif isFrinight then
			if hhmm > FrinightUVLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > FrinightUV[i] do
					i = i + 1
				end
				setNextShuttle(FrinightUV, i)
				shuttleName = "Hayward Bart from Endeavor"
			end
		elseif isSaturday then
			if hhmm > SaturdayUVLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > SaturdayUV[i] do
					i = i + 1
				end
				setNextShuttle(SaturdayUV, i)
				shuttleName = "Hayward Bart from Endeavor"
			end
		elseif isSunday then
			if hhmm > SundayUVLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > SundayUV[i] do
					i = i + 1
				end
				setNextShuttle(SundayUV, i)
				shuttleName = "Hayward Bart from Endeavor"
			end
		end
		displayNext()
	end

end

function findToUv( event )
	if event.phase == "began" then
		findPlace = "uv"
		processDate()
		shuttleName = "Next Shuttle"
		if isUVCL then
			if hhmm > UVCLTimesRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > UVCLTimesRAW[i] do
					i = i + 1
				end
				setNextShuttle(UVCLTimesRAW, i)
				shuttleName = "UVCL"
			end
		elseif isFriday then
			if hhmm > FridayRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > FridayRAW[i] do
					i = i + 1
				end
				setNextShuttle(FridayRAW, i)
				shuttleName = "CV Bart"
			end
		elseif isFrinight then
			if hhmm > FrinightRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > FrinightRAW[i] do
					i = i + 1
				end
				setNextShuttle(FrinightRAW, i)
				shuttleName = "Hayward Bart to Discovery"
			end
		elseif isSaturday then
			if hhmm > SaturdayRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > SaturdayRAW[i] do
					i = i + 1
				end
				setNextShuttle(SaturdayRAW, i)
				shuttleName = "Hayward Bart to Discovery"
			end
		elseif isSunday then
			if hhmm > SundayRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > SundayRAW[i] do
					i = i + 1
				end
				setNextShuttle(SundayRAW, i)
				shuttleName = "Hayward Bart to Discovery"
			end
		end
		displayNext()
	end
end

function titleScreen()
	local background = display.newRect( centerX, centerY, _W, _H)
	background:setFillColor( 0, 0, 0)


	local toCsuButton = display.newRoundedRect( centerX, centerY/2, 200, 100, 20)
	toCsuButton:setFillColor(0.5,0.8,1)
	local options = 
	{
	    text = "To CSUEB",     
	    x = centerX,
	    y = centerY/2,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local toCsuText = display.newText(options)
	toCsuText:setFillColor( 0, 0, 0 )
	toCsuButton:addEventListener( "touch", findToCsu)
	
	local toUvButton = display.newRoundedRect( centerX, centerY*3/4, 200, 100, 20)
	toUvButton:setFillColor(0.5,0.8,1)
	local options = 
	{
	    text = "To UV",     
	    x = centerX,
	    y = centerY*3/4,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local toUvText = display.newText(options)
	toUvText:setFillColor( 0, 0, 0 )

	toUvButton:addEventListener( "touch", findToUv)
end
titleScreen()


