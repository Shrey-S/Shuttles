-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--[[
display.setStatusBar( display.HiddenStatusBar )

------------------------------
-- RENDER THE SAMPLE CODE UI
------------------------------

local sampleUI = require( "sampleUI.sampleUI" )
sampleUI:newUI( { theme="darkgrey", title="Appodeal", showBuildNum=true } )

------------------------------
-- CONFIGURE STAGE
------------------------------
display.getCurrentStage():insert( sampleUI.backGroup )
local mainGroup = display.newGroup()
display.getCurrentStage():insert( sampleUI.frontGroup )

]]

--[[shuttleStop = class(function(name, arr, stopLatitude, stopLongitude))

function shuttleStop:getTime()
	-- body
end
]]

function declarations()
	centerX = display.contentCenterX
	centerY = display.contentCenterY
	_W = display.contentWidth
	_H = display.contentHeight



	fromArr = {"CSUEB", "Hayward  Bart", "UV", "B Street, Stop 1", "B Street, Stop 2", 
			"C Street, Stop 3", "CV Bart", "Discovery Stop", "Endeavor Stop", "Music Building",
			"Arts & Education", "Student & Faculty", "Recreation & Wellness", 
			"Meiklejohn Hall", "Library", "Parking Lot M"}
		fromI = 1
		from = fromArr[fromI]
		timeIncrement = 0

	UV_CSU = {1895, 1905, 1920, 1935, 1950, 1965, 1980, 1995, 2010, 2040, 2055, 2070, 2085, 2100, 2115, 2160, 2175, 2190, 2205, 2220, 2235, 2250, 2280, 2295, 2310, 2325, 2340, 2355, 2370, 2385, 2430, 2445, 2460, 2475, 2490, 2505, 2520, 2550, 2565, 2580, 2650, 2720, 2780, 2815, 3335, 3345, 3360, 3375, 3390, 3405, 3420, 3435, 3450, 3480, 3495, 3510, 3525, 3540, 3555, 3600, 3615, 3630, 3645, 3660, 3675, 3690, 3720, 3735, 3750, 3765, 3780, 3795, 3810, 3825, 3870, 3885, 3900, 3915, 3930, 3945, 3960, 3990, 4005, 4020, 4090, 4160, 4220, 4255, 4775, 4785, 4800, 4815, 4830, 4845, 4860, 4875, 4890, 4920, 4935, 4950, 4965, 4980, 4995, 5040, 5055, 5070, 5085, 5100, 5115, 5130, 5160, 5175, 5190, 5205, 5220, 5235, 5250, 5265, 5310, 5325, 5340, 5355, 5370, 5385, 5400, 5430, 5445, 5460, 5530, 5600, 5660, 5695, 6215, 6225, 6240, 6255, 6270, 6285, 6300, 6315, 6330, 6360, 6375, 6390, 6405, 6420, 6435, 6480, 6495, 6510, 6525, 6540, 6555, 6570, 6600, 6615, 6630, 6645, 6660, 6675, 6690, 6705, 6750, 6765, 6780, 6795, 6810, 6825, 6840, 6870, 6885, 6900, 6970, 7040, 7100, 7135}

	MUSIC_CSU = {1896, 1907, 1922, 1937, 1952, 1967, 1982, 1997, 2012, 2042, 2057, 2072, 2087, 2102, 2117, 2162, 2177, 2192, 2207, 2222, 2237, 2252, 2282, 2297, 2312, 2327, 2342, 2357, 2372, 2387, 2432, 2447, 2462, 2477, 2492, 2507, 2522, 2552, 2567, 3336, 3347, 3362, 3377, 3392, 3407, 3422, 3437, 3452, 3482, 3497, 3512, 3527, 3542, 3557, 3602, 3617, 3632, 3647, 3662, 3677, 3692, 3722, 3737, 3752, 3767, 3782, 3797, 3812, 3827, 3872, 3887, 3902, 3917, 3932, 3947, 3962, 3992, 4007, 4776, 4787, 4802, 4817, 4832, 4847, 4862, 4877, 4892, 4922, 4937, 4952, 4967, 4982, 4997, 5042, 5057, 5072, 5087, 5102, 5117, 5132, 5162, 5177, 5192, 5207, 5222, 5237, 5252, 5267, 5312, 5327, 5342, 5357, 5372, 5387, 5402, 5432, 5447, 6216, 6227, 6242, 6257, 6272, 6287, 6302, 6317, 6332, 6362, 6377, 6392, 6407, 6422, 6437, 6482, 6497, 6512, 6527, 6542, 6557, 6572, 6602, 6617, 6632, 6647, 6662, 6677, 6692, 6707, 6752, 6767, 6782, 6797, 6812, 6827, 6842, 6872, 6887}

	CSU_UV = {1899, 1910, 1925, 1940, 1955, 1970, 1985, 2000, 2045, 2060, 2075, 2090, 2105, 2165, 2180, 2195, 2210, 2225, 2240, 2285, 2300, 2315, 2330, 2345, 2360, 2375, 2435, 2450, 2465, 2480, 2495, 2510, 2555, 2570, 2585, 2620, 2690, 2730, 2785, 3339, 3350, 3365, 3380, 3395, 3410, 3425, 3440, 3485, 3500, 3515, 3530, 3545, 3605, 3620, 3635, 3650, 3665, 3680, 3725, 3740, 3755, 3770, 3785, 3800, 3815, 3875, 3890, 3905, 3920, 3935, 3950, 3995, 4010, 4025, 4060, 4130, 4170, 4225, 4779, 4790, 4805, 4820, 4835, 4850, 4865, 4880, 4925, 4940, 4955, 4970, 4985, 5045, 5060, 5075, 5090, 5105, 5120, 5165, 5180, 5195, 5210, 5225, 5240, 5255, 5315, 5330, 5345, 5360, 5375, 5390, 5435, 5450, 5465, 5500, 5570, 5610, 5665, 6219, 6230, 6245, 6260, 6275, 6290, 6305, 6320, 6365, 6380, 6395, 6410, 6425, 6485, 6500, 6515, 6530, 6545, 6560, 6605, 6620, 6635, 6650, 6665, 6680, 6695, 6755, 6770, 6785, 6800, 6815, 6830, 6875, 6890, 6905, 6940, 7010, 7050, 7105}

	hBart_CSU = {5, 60, 500, 540, 580, 620, 675, 715, 720, 755, 825, 865, 905, 945, 985, 1025, 1080, 1120, 1160, 1230, 1270, 1310, 1940, 1980, 2020, 2060, 2115, 2155, 2195, 2265, 2305, 2345, 2385, 2425, 2465, 2520, 2560, 2600, 2670, 2710, 2750, 3380, 3420, 3460, 3500, 3555, 3595, 3635, 3705, 3745, 3785, 3825, 3865, 3905, 3960, 4000, 4040, 4110, 4150, 4190, 4820, 4860, 4900, 4940, 4995, 5035, 5075, 5145, 5185, 5225, 5265, 5305, 5345, 5400, 5440, 5480, 5550, 5590, 5630, 6140, 6180, 6200, 6220, 6235, 6250, 6260, 6275, 6290, 6305, 6315, 6330, 6345, 6355, 6360, 6370, 6385, 6395, 6400, 6410, 6425, 6440, 6450, 6465, 6495, 6505, 6520, 6535, 6545, 6560, 6575, 6590, 6600, 6615, 6622, 6630, 6640, 6655, 6662, 6670, 6680, 6695, 6702, 6710, 6720, 6735, 6750, 6760, 6775, 6780, 6790, 6800, 6815, 6830, 6845, 6855, 6870, 6885, 6910, 6925, 6940, 6950, 6975, 7005, 7015, 7035, 7045, 7080, 7095, 7110, 7140, 7155, 7185, 7215, 7275, 7305, 7335, 7365, 7580, 7620, 7640, 7660, 7680, 7700, 7720, 7755, 7775, 7795, 7815, 7835, 7855, 7905, 7925, 7945, 7965, 7985, 8020, 8040, 8060, 8080, 8100, 8120, 8140, 8160, 8190, 8220, 8240, 8260, 8280, 8300, 8335, 8370, 8410, 8450, 8490, 8545, 8585, 8655, 8695, 8735, 9140, 9180, 9220, 9260, 9315, 9355, 9395, 9465, 9505, 9545, 9585, 9640, 9680, 9720, 9760, 9800, 9855, 9895, 9935, 10005, 10045}

	CSU_hBart = {40, 480, 520, 560, 600, 655, 695, 735, 805, 845, 885, 925, 965, 1005, 1060, 1100, 1140, 1210, 1250, 1290, 1920, 1960, 2000, 2040, 2095, 2135, 2175, 2245, 2285, 2325, 2365, 2405, 2445, 2500, 2540, 2580, 2650, 2690, 2730, 3360, 3400, 3440, 3480, 3535, 3575, 3615, 3685, 3725, 3765, 3805, 3845, 3885, 3940, 3980, 4020, 4090, 4130, 4170, 4800, 4840, 4880, 4920, 4975, 5015, 5055, 5125, 5165, 5205, 5245, 5285, 5325, 5380, 5420, 5460, 5530, 5570, 5610, 6120, 6160, 6180, 6200, 6215, 6230, 6240, 6255, 6270, 6285, 6295, 6310, 6325, 6335, 6340, 6350, 6365, 6375, 6380, 6390, 6405, 6420, 6430, 6445, 6460, 6475, 6485, 6500, 6515, 6525, 6540, 6555, 6570, 6580, 6595, 6602, 6610, 6620, 6635, 6642, 6650, 6660, 6675, 6682, 6690, 6700, 6715, 6730, 6740, 6755, 6760, 6770, 6780, 6795, 6810, 6825, 6835, 6850, 6865, 6890, 6905, 6920, 6930, 6960, 6990, 7000, 7020, 7030, 7065, 7080, 7095, 7125, 7140, 7170, 7200, 7260, 7290, 7320, 7350, 7560, 7600, 7620, 7640, 7660, 7680, 7700, 7735, 7755, 7775, 7795, 7815, 7835, 7885, 7905, 7925, 7945, 7965, 8000, 8020, 8040, 8060, 8080, 8100, 8120, 8140, 8170, 8200, 8220, 8240, 8260, 8280, 8315, 8350, 8390, 8430, 8470, 8525, 8565, 8635, 8675, 8715, 9120, 9160, 9200, 9240, 9295, 9335, 9375, 9445, 9485, 9525, 9565, 9620, 9660, 9700, 9740, 9780, 9835, 9875, 9915, 9985, 10025, 10065}
end
declarations()

function toWdayText(shuttleDay)
	if shuttleDay == wday then 
		return "Today"
	elseif shuttleDay + 1 == wday then
		return " Yesterday"
	elseif shuttleDay - 1 == wday then
		return " Tomorrow"
	elseif shuttleDay == 0 then
		return "Sunday"
	elseif shuttleDay == 1 then
		return "Monday"
	elseif shuttleDay == 2 then
		return "Tuesday"
	elseif shuttleDay == 3 then
		return "Wednesday"
	elseif shuttleDay == 4 then
		return "Thursday"
	elseif shuttleDay == 5 then
		return "Friday"
	elseif shuttleDay == 6 then
		return "Saturday"
	else
		return "Wday Error!"
	end
end 
		
function toTimeDay(val)
	-- accept Minutes Since Sunday 12:00AM
	-- return Time and Day in String Format
	timeUntilShuttle = val - minutesThisWeek
	--[[if timeUntilShuttle > 150 then
		if from == "UV" then
			if to == "CSUEB" then
				from = "Endeavor Stop"
				temp = retrieveTime()
				if temp - minutesThisWeek < timeUntilShuttle then
					displayFrom(1)
					return toTimeDay()
				end
			end
		end
	end]]
	hh = val % 1440
	day = (val - hh) / 1440
	mm = hh % 60
	hh = (hh - mm) / 60
	ampm = "AM"
	if hh > 12 then 
		hh = hh - 12
		ampm = "PM"
	end 
	if hh == 0 then 
		hh = "12"
	end
	if mm < 10 then
		mm = "0"..tostring(mm)
	end
	text = tostring(hh) .. ":" .. tostring(mm) .. ampm 
	if timeUntilShuttle < -60 then
		text = "Left at " .. text .. ", " .. toWdayText(day)
	elseif timeUntilShuttle > -60  and timeUntilShuttle < 0 then 
		text = -timeUntilShuttle .. " minutes ago at " .. text
	elseif timeUntilShuttle < 60 then
		text = " In " .. timeUntilShuttle .. " minutes at " .. text
	else 
		text = text .. ", " .. toWdayText(day)
	end
	return text
end

function retrieveTime()
	date = os.date( "*t" )
	hhmm = (date.hour * 100) + date.min
	wday = date.wday - 1 				-- Zero Indexed WeekDay, Sunday: 0
	minutesThisWeek = wday * 1440 + date.hour * 60 + date.min 
	

	UVCLTimesUV = {735,745,800,815,830,845,900,915,930,1000,1015,1030,1045,1100,1115,
		1200,1215,1230,1245,1300,1315,1330,1400,1415,1430,1445,1500,1515,1530,1545,
		1630,1645,1700,1715,1730,1745,1800,1830,1845,1900,2010,2120,2220,2255}
	CSU_hBart_NEW = {}
	--[[for j = 1, 3 do
		for i, v in ipairs(CSU_hBart_MON) do
			if v > 1440 then 
				v = v % 1440
			end
			--mm = v % 100
			--hh = (v - mm) / 100
			CSU_hBart[table.getn(CSU_hBart) + 1] = (j * 1440) + v -- Minutes since Sunday 12:00AM
		end
	end]]
	for j = 1, 4 do
		for i, v in ipairs(UVCLTimesUV ) do
			local mm = v % 100
			local hh = (v - mm) / 100
			--local hh = temp % 24
			--local d = (temp - hh) / 24 
			temp = (j * 1440) + (hh * 60) + mm
			if hh == 7 and mm == 35 then
				temp = temp + 2
				CSU_hBart_NEW[table.getn(CSU_hBart_NEW) + 1] =  temp
			else 
				temp = temp + 3
				CSU_hBart_NEW[table.getn(CSU_hBart_NEW) + 1] =  temp
			end
			 -- Minutes since Sunday 12:00AM
		end		
	end
	arrayString = ""

	shuttleArray = CSU_hBart_NEW

	for i, v in ipairs(shuttleArray) do
		arrayString = arrayString .. v .. ", "
	end  	
	print(arrayString)
	print(table.getn(CSU_hBart_NEW))
	print(table.getn(UVCLTimesUV))
	

	-- Assign Array for Search
	shuttleArray = { -1}
	if from == "CSUEB" then
		if to == "Hayward  Bart" then 
			shuttleArray = CSU_hBart
		elseif to == "UV" then
			shuttleArray = CSU_UV
		end
	elseif from == "Hayward  Bart" then
		if to == "CSUEB" then
			shuttleArray = hBart_CSU
		end
	elseif from == "UV" then
		if to == "CSUEB" then
			shuttleArray = UV_CSU
		end 
	end

	-- SEARCH through Array

	for i, v in ipairs(shuttleArray) do
		if v > minutesThisWeek then
			if i + timeIncrement > table.getn(shuttleArray) then
				timeIncrement = 1 - i
			elseif i + timeIncrement < 1 then
				timeIncrement = table.getn(shuttleArray) - i
			end
			return shuttleArray[i + timeIncrement]
		end 
	end  	
	return -1
end

function locationHandler( event )
	latitude = event.latitude
	longitude = event.longitude
	altitude = event.altitude
	accuracy = event.accuracy
	direction = event.direction
	speed = event.speed
	locationTime = event.time
end
Runtime:addEventListener( "location", locationHandler )

function adjustToArr()
	
	if from == "CSUEB" or from == "RAW" then
		toArr = {"Hayward  Bart", "UV", "CV Bart"}
		toI = 1
		to = toArr[toI]
	elseif from == "Hayward  Bart" then
		toArr = {"CSUEB", "UV", "CV Bart"}
		toI = 1
		to = toArr[toI]
	elseif from == "UV" then
		toArr = {"CSUEB", "Hayward  Bart", "CV Bart"}
		toI = 1
		to = toArr[toI]
	end
end

function toTimeString( x )
	if x == 0 then 
		return "Tomorrow"
	end
	local mins = x % 100
	local hours = math.floor( x / 100 )
	if hours > 24 then
		ampm = "am"
		hours = hours - 24
	elseif hours > 23 then
		ampm = "am"
	elseif hours > 12 then
		ampm = "pm"
		hours = hours - 12
	elseif hours > 11 then
		ampm = "pm"
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

function incrementTime()
	timeIncrement = timeIncrement + 1
	displayNext()
	timeChanged = true
end

function decrementTime()
	timeIncrement = timeIncrement - 1
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
			incrementTime()
		end
	end
	if event.phase == "moved" and event.y - event.yStart < -10 then
		if not timeChanged then	
			decrementTime()
		end
	end
end

function getResultText()
	local time = retrieveTime()
	if time > 0 then 
		return toTimeDay(time)
	else
		return "Available in Next Update"
	end
end

function displayNext()
	display.remove(nextShuttleBox)
	display.remove(nextShuttleText)

	nextShuttleBox = display.newRoundedRect( centerX, centerY*5/4, 400, 300, 40)
	nextShuttleBox:setFillColor( 0.4, 0.7, 1)
	local options = 
	{
		text = getResultText(), --shuttleName.." is "..toTimeString(nextShuttle),     
		x = centerX,
		y = centerY * 5/4,
		width = 400,
		font = native.systemFont,   
		fontSize = 50,
		align = "center"  -- Alignment parameter
	} 
	nextShuttleText = display.newText(options)
	nextShuttleText:setFillColor( 0, 0, 0)
	
	nextShuttleBox:addEventListener( "touch", onNextShuttleTouch)
end
--[[
function displayNext( event)
	if event.phase == "began" then
		displayNext()
	end
end
]]
function incrementFrom()
	fromI = fromI + 1
	if fromI == 17 then 
		fromI = 1
	end
	if fromArr[fromI] then
		from = fromArr[fromI]
		fromChanged = true
	end
	displayFrom()
end

function decrementFrom()
	fromI = fromI - 1
	if fromI == 0 then 
		fromI = 16
	end
	if fromArr[fromI] then
		from = fromArr[fromI]
		fromChanged = true
	end
	displayFrom()
end

function fromTouch( event )
	if event.phase == "began" then
		fromChanged = false
	end
	if event.phase == "moved" and event.y - event.yStart > 10 then
		if not fromChanged then	
			incrementFrom()
		end
	end
	if event.phase == "moved" and event.y - event.yStart < -10 then
		if not fromChanged then	
			decrementFrom()
		end
	end
end

function displayFrom(a)
	if not a then 
		adjustToArr()
	end
	displayTo()
	display.remove(fromButton)
	display.remove(fromText)
	
	fromButton = display.newRoundedRect( centerX - 125, centerY/2, 200, 100, 20)
	fromButton:setFillColor( 0.6, 0.8, 1)
	local options = 
	{
	    text = from,     
	    x = centerX-125,
	    y = centerY/2,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local fromText = display.newText(options)
	fromText:setFillColor( 0, 0, 0 )
	fromButton:addEventListener( "touch", fromTouch)
end

function incrementTo()
	toI = toI + 1
	if toI > table.getn(toArr) then 
		toI = 1
	end
	if toArr[toI] then
		to = toArr[toI]
		toChanged = true
	end
	if from == to then
		incrementTo()
		return
	end
	displayTo()
end

function decrementTo()
	toI = toI - 1
	if toI == 0 then 
		toI = table.getn(toArr)
	end
	if toArr[toI] then
		to = toArr[toI]
		toChanged = true
	end
	displayTo()
	
end

function toTouch( event )
	if event.phase == "began" then
		toChanged = false
	end
	if event.phase == "moved" and event.y - event.yStart > 10 then
		if not toChanged then	
			incrementTo()
		end
	end
	if event.phase == "moved" and event.y - event.yStart < -10 then
		if not toChanged then	
			decrementTo()
		end
	end
end

function displayTo()
	display.remove(toButton)
	display.remove(toText)

	toButton = display.newRoundedRect( centerX+125, centerY/2, 200, 100, 20)
	toButton:setFillColor( 0.6, 0.8, 1)
	local options = 
	{
	    text = to,     
	    x = centerX+125,
	    y = centerY/2,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local toText = display.newText(options)
	toText:setFillColor( 0, 0, 0 )
	toButton:addEventListener( "touch", toTouch)

	timeIncrement = 0
	displayNext()
end

function displayGo()
	display.remove(goButton)
	display.remove(goText)

	goButton = display.newRoundedRect( centerX, centerY*3/4, 100, 100, 20)
	goButton:setFillColor( 0.6, 0.8, 1)
	local options = 
	{
	    text = "Go",     
	    x = centerX,
	    y = centerY*3/4,
	    width = 100,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local goText = display.newText(options)
	goText:setFillColor( 0, 0, 0 )
	goButton:addEventListener( "touch", displayNext)
end

function onAccelerometerDataReceived( event )
	background.x = _W * (4 - event.xGravity) / 8 
	background.y = _H * (4 + event.yGravity) / 8
end
  
if system.hasEventSource( "accelerometer" ) then
    Runtime:addEventListener( "accelerometer", onAccelerometerDataReceived )
end

function titleScreen()
	print("in TitleScreen")
	background = display.newImageRect( "raw_background.jpg", _W * 1.5, _H * 1.5)
	background.x = centerX
	background.y = centerY
	--background:setFillColor( 0, 0, 0)

	displayFrom()
	displayTo()
	--displayGo()
	
	local options = 
	{
	    text = "From:",     
	    x = centerX-125,
	    y = centerY/3,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local fromText = display.newText(options)
	fromText:setFillColor( 0, 0, 0)
	
	local options = 
	{
	    text = "To:",     
	    x = centerX+125,
	    y = centerY/3,
	    width = 200,
	    font = native.systemFont,   
	    fontSize = 35,
	    align = "center"  -- Alignment parameter
	} 
	local toText = display.newText(options)
	toText:setFillColor( 0, 0, 0 )
	

	
	print("finished TitleScreen")
end
titleScreen()

--[[
local function adListener( event )
 
    if ( event.phase == "init" ) then  -- Successful initialization
        appodeal.show( "banner", { yAlign = "top"})
    end
end ]]
--[[
function findToCsu( event )
	if event.phase == "began" then
		if findTo == "csu" then
			toCsuButton:setFillColor(0.4,0.7,1)
			toUvButton:setFillColor(0.6,0.8,1)
		elseif findTo == "uv" then
			toUvButton:setFillColor( 0.4, 0.7, 1)
			toCsuButton:setFillColor(0.6,0.8,1)
		end

		
		displayNext()
	end

end

function setNextShuttle( arr, i)
	lastArr = arr
	lastI = i
	nextShuttle = arr[i]
	--print("in setnextshuttle : ".. tostring(nextShuttle))
	
end
]]

--[[function checkShuttleName(nextShuttle)
	if date.wday > 1 and date.wday < 6 then
		if nextShuttle > 1906 then
			shuttleName = "CV Bart"
		else
			shuttleName = "UVCL"
		end
	elseif date.wday == 6 and hhmm <= 1900 then
		shuttleName = "CV Bart"
	else 
		shuttleName = "Hayward Bart"
		if findTo  == "csu" then
			shuttleName = shuttleName .. " from Endeavor"
		elseif findTo == "uv" then
			shuttleName = shuttleName .. " to Discovery"
		end
	end]]
	--[[elseif date.wday == 6 then
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
end]]

--[[
function findToUv( event )
	if event.phase == "began" then
		findTo = "uv"
		toUvButton:setFillColor( 0.4, 0.7, 1)
		toCsuButton:setFillColor(0.6,0.8,1)
	 
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
]]

	--[[
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

	SundayRAW = {800, 840, 920, 1000, 1055, 1135, 1215, 1325, 1405,1445,1525,1605,1645,
		1740,1820,1900,2010,2050,2130}
	SundayRAWLast = 2130 ]]

--[[
	lastShuttle = 0
	for i = 1, 10080 do 
		local mm = i % 60
		local temp = (i - mm) / 60
		local hh = temp % 24
		local d = ((temp - hh) / 24) + 1
		hhmm = (hh * 100) + mm

		isUVCL = false
		isFriday = false
		isFrinight = false
		isSaturday = false
		isSunday = false

		if d > 1 and d < 6 then
			isUVCL = true
		elseif d == 6 and hhmm <= 1900 then
			isFriday = true
		elseif d == 6 then
			isFrinight = true
		elseif d == 7 and hhmm <= 145 then
			isFrinight = true
		elseif d == 7 then
			isSaturday = true
		elseif d == 1 and hhmm <= 115 then 
			isSaturday = true
		elseif d == 1 then
			isSunday = true
		end

		nextShuttle = 0
		
		if isUVCL then
			if hhmm > UVCLTimesRAWLast then
				nextShuttle = 0
			else
				local i = 1
				while hhmm > UVCLTimesRAW[i] do
					if UVCLTimesRAW[i + 1] then 
						i = i + 1
					else 
						hhmm = 0
					end
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
					if FridayRAW[i + 1] then 
						i = i + 1
					else 
						hhmm = 0
					end
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
					if FrinightRAW[i + 1] then 
						i = i + 1
					else 
						hhmm = 0
					end
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
					if SaturdayRAW[i + 1] then 
						i = i + 1
					else 
						hhmm = 0
					end
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
					if SundayRAW[i + 1] then 
						i = i + 1
					else 
						hhmm = 0
					end
				end
				setNextShuttle(SundayRAW, i)
				shuttleName = "Hayward Bart to Discovery"
			end
		end
		
		if nextShuttle == lastShuttle or lastShuttle == 0 then

		else
			print("in if".. lastShuttle)
			mm = lastShuttle % 100
			hh = (lastShuttle - mm) / 100
			if hh > 23 then
				hh = hh - 24
			end
			CSU_hBart_NEW[table.getn(CSU_hBart_NEW) + 1] = ((d-1) * 1440) + (hh * 60) + mm 
		end
		lastShuttle = nextShuttle
		
	end ]]

--appodeal.init( adListener, { appKey="5d4de11624040ff75e3b0d4be21f84ec" } )

--[[

-- Abstract: Appodeal
-- Version: 1.0
-- Sample code is MIT licensed; see https://www.coronalabs.com/links/code/license
---------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

------------------------------
-- RENDER THE SAMPLE CODE UI
------------------------------
local sampleUI = require( "sampleUI.sampleUI" )
sampleUI:newUI( { theme="darkgrey", title="Appodeal", showBuildNum=true } )

------------------------------
-- CONFIGURE STAGE
------------------------------
display.getCurrentStage():insert( sampleUI.backGroup )
local mainGroup = display.newGroup()
display.getCurrentStage():insert( sampleUI.frontGroup )

----------------------
-- BEGIN SAMPLE CODE
----------------------

-- Require libraries/plugins
local appodeal = require( "plugin.appodeal" )
local widget = require( "widget" )

-- Set app font
local appFont = sampleUI.appFont

-- Preset Appodeal app keys (replace these with your own)
-- These must be gathered within the Appodeal developer portal: https://www.appodeal.com/apps
local appKey
if ( system.getInfo("platformName") == "Android" ) then  -- Android
	appKey = "[ANDROID-APP-KEY]"
elseif ( system.getInfo("platformName") == "iPhone OS" ) then  --iOS
	appKey = "[IOS-APP-KEY]"
end

-- Set local variables
local setupComplete = false
local availableAdTypes = {
	{ adUnitType="banner", label="Banner", xPos=103, yPos=110 },
	{ adUnitType="interstitial", label="Interstitial", xPos=103, yPos=150 },
	{ adUnitType="video", label="Video", xPos=250, yPos=110 },
	{ adUnitType="rewardedVideo", label="Rewarded Video", xPos=250, yPos=150 }
}
local currentAdType = 1
local showButton

-- Create asset image sheet
local assets = graphics.newImageSheet( "assets.png",
	{
		frames = {
			{ x=0, y=0, width=35, height=35 },
			{ x=0, y=35, width=35, height=35 },
		},
		sheetContentWidth=35, sheetContentHeight=70
	}
)


-- Function to prompt/alert user for setup
local function checkSetup()

	if ( system.getInfo( "environment" ) ~= "device" ) then return end

	if ( tostring(appKey) == "[ANDROID-APP-KEY]" or tostring(appKey) == "[IOS-APP-KEY]" ) then
		local alert = native.showAlert( "Important", 'Confirm that you have specified your unique Appodeal app keys within "main.lua" on lines 37 and 39. These must be gathered within the Appodeal developer portal.', { "OK", "appodeal.com" },
			function( event )
				if ( event.action == "clicked" and event.index == 2 ) then
					system.openURL( "https://www.appodeal.com/apps/" )
				end
			end )
	else
		setupComplete = true
	end
end


-- Ad listener function
local function adListener( event )

	-- Exit function if user hasn't set up testing parameters
	if ( setupComplete == false ) then return end
	
	-- Successful initialization of the Appodeal plugin
	if ( event.phase == "init" ) then
		print( "Appodeal event: initialization successful" )
		showButton:setEnabled( true )
		showButton.alpha = 1

	-- An ad loaded successfully
	elseif ( event.phase == "loaded" ) then
		print( "Appodeal event: " .. tostring(event.type) .. " ad loaded successfully" )

	-- The ad was displayed/played
	elseif ( event.phase == "displayed" or event.phase == "playbackBegan" ) then
		print( "Appodeal event: " .. tostring(event.type) .. " ad displayed" )

	-- The ad was closed/hidden/completed
	elseif ( event.phase == "hidden" or event.phase == "closed" or event.phase == "playbackEnded" ) then
		print( "Appodeal event: " .. tostring(event.type) .. " ad closed/hidden/completed" )

	-- The user clicked/tapped an ad
	elseif ( event.phase == "clicked" ) then
		print( "Appodeal event: " .. tostring(event.type) .. " ad clicked/tapped" )

	-- The ad failed to load
	elseif ( event.phase == "failed" ) then
		print( "Appodeal event: " .. tostring(event.type) .. " ad failed to load" )
	end
end


-- Button handler function
local function uiEvent( event )

	if ( event.target.id == "show" ) then
		print(availableAdTypes[currentAdType]["adUnitType"])
		appodeal.show( availableAdTypes[currentAdType]["adUnitType"] )

	elseif ( tonumber(event.target.id) ) then
		if ( event.target.isOn == true ) then
			currentAdType = event.target.id
		end
	end
	return true
end

-- Create radio buttons/labels
for i = 1,#availableAdTypes do
	local isOn = false ; if ( i == 1 ) then isOn = true end
	local radioButton = widget.newSwitch(
		{
			sheet = assets,
			width = 35,
			height = 35,
			frameOn = 1,
			frameOff = 2,
			x = availableAdTypes[i]["xPos"],
			y = availableAdTypes[i]["yPos"],
			style = "radio",
			id = i,
			initialSwitchState = isOn,
			onPress = uiEvent
		})
	mainGroup:insert( radioButton )
	local label = display.newText( mainGroup, availableAdTypes[i]["label"], radioButton.x+22, radioButton.y, appFont, 16 )
	label.anchorX = 0
end

-- Create button
showButton = widget.newButton(
	{
		label = "Show Appodeal Ad",
		id = "show",
		shape = "rectangle",
		x = display.contentCenterX,
		y = 220,
		width = 298,
		height = 32,
		font = appFont,
		fontSize = 16,
		fillColor = { default={ 0.12,0.32,0.52,1 }, over={ 0.132,0.352,0.572,1 } },
		labelColor = { default={ 1,1,1,1 }, over={ 1,1,1,1 } },
		onRelease = uiEvent
	})
showButton:setEnabled( false )
showButton.alpha = 0.3
mainGroup:insert( showButton )


-- Initially alert user to set up device for testing
checkSetup()

-- Init the Appodeal plugin
appodeal.init( adListener, { appKey=appKey, testMode=false } )

]]

