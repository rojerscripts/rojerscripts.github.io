script_name("[ARZ] Helper Lovli")
script_author("rojerscripts")
script_properties("work-in-pause")
script_version_number(1.0)
script_version(" 03.05.2021")
local imgui = require 'imgui'
local samp = require 'lib.samp.events'
local keys = require 'vkeys'
local fa = require 'fAwesome5'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
local mem = require 'memory'
local requests = require('requests')
encoding.default = 'CP1251'
u8 = encoding.UTF8



local tpCountt, timert = 0, 0
local main_window_state = imgui.ImBool(false)
local test = imgui.ImInt(0)
local netest = imgui.ImInt(0)
local menu = 1
local t = 0
local fams = {"Family", "Dynasty", "Corporation", "Squad", "Crew", "Empire", "Brotherhood"}
local ybaritxyiny = imgui.ImBool(false)
local collision = imgui.ImBool(false)
local wallhackboys = imgui.ImBool(false)
local delnoflood = imgui.ImBool(false)
local antirvaan = imgui.ImBool(true)
local wh = imgui.ImBool(false)
local time = nil
local captcha = ''
local captime = 0
local captchaTable = {}
local items = { 
	u8"Тёмная тема",
	u8"Синяя тема", 
	u8"Красная тема", 
	u8"Голубая тема", 
	u8"Оранжевая тема", 
	u8"Фиолетовая тема", 
	u8"Темно-красная тема", 
	u8"Тёмная тема BlastHack", 
	u8"Белая тема", 
	u8"Темно-салатовая тема" 
}
local settingshelper = '..\\config\\arz_helper_lovli.ini'

local mainIni = inicfg.load({
    config = {
		theme = 0,
	},
	chat = {
		textlovli = false,
		atextlovlya = "Введите текст кричалки by rojerscripts"
	},
	trenercaptcha = {
		thenerkey = "N",
		truefalsekey = false,
		chatsamp = true,
		printsamp = false,
	},
	osnovnoe = {
		rvanka = false,
		delnoflood = false,
		collision = false,
		ybaritxyiny = false,
		wallhackboys = false,
	}
},settingshelper)

function saveIniFile()
    local eblan = inicfg.save(mainIni,settingshelper)
end
saveIniFile()


local imgui_theme = imgui.ImInt(mainIni.config.theme)

function GenerateTextDraw(id, PosX, PosY)
	if id == 0 then
	  t = t + 1
	  sampTextdrawCreate(t, "LD_SPAC:white", PosX - 5, PosY + 7)
	  sampTextdrawSetLetterSizeAndColor(t, 0, 3, 0x80808080)
	  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX+5, 0.000000)
	elseif id == 1 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then offsetX = 3; offsetBX = 15 else offsetX = -3; offsetBX = -15; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX - offsetX, PosY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, 4.5, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	elseif id == 2 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then offsetX = -8; offsetY = 7 offsetBX = 15 else offsetX = 6; offsetY = 25 offsetBX = -15; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX - offsetX, PosY + offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, 0.8, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	elseif id == 3 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 0.8; offsetY = 7 else size = 1; offsetY = 25 end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX+10, PosY+offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, 1, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-15, 0.000000)
	  end
	elseif id == 4 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 1.8; offsetX = -10; offsetY = 0 offsetBX = 10 else size = 2; offsetX = -10; offsetY = 25 offsetBX = 15; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX - offsetX, PosY + offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, size, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	elseif id == 5 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 0.8; offsetX = 8; offsetY = 7 offsetBX = -15 else size = 1; offsetX = -10; offsetY = 25 offsetBX = 15; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX - offsetX, PosY + offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, size, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	elseif id == 6 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 0.8; offsetX = 7.5; offsetY = 7 offsetBX = -15 else size = 1; offsetX = -10; offsetY = 25 offsetBX = 10; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX - offsetX, PosY + offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, size, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	elseif id == 7 then
	  t = t + 1
	  sampTextdrawCreate(t, "LD_SPAC:white", PosX - 13, PosY + 7)
	  sampTextdrawSetLetterSizeAndColor(t, 0, 3.75, 0x80808080)
	  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX+5, 0.000000)
	elseif id == 8 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 0.8; offsetY = 7 else size = 1; offsetY = 25 end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX+10, PosY+offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, 1, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-10, 0.000000)
	  end
	elseif id == 9 then
	  for i = 0, 1 do
		  t = t + 1
		  if i == 0 then size = 0.8; offsetY = 6; offsetBX = 10; else size = 1; offsetY = 25; offsetBX = 15; end
		  sampTextdrawCreate(t, "LD_SPAC:white", PosX+10, PosY+offsetY)
		  sampTextdrawSetLetterSizeAndColor(t, 0, 1, 0x80808080)
		  sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, PosX-offsetBX, 0.000000)
	  end
	end
  end

textlovlya = imgui.ImBuffer(tostring(mainIni.chat.atextlovlya), 256)
textlovlya.v = string.gsub(tostring(textlovlya.v), '"', '')
keybuff = imgui.ImBuffer(tostring(mainIni.trenercaptcha.thenerkey), 2)
function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then
	end
	repeat wait(0) until isSampAvailable()
    local request = requests.get('https://raw.githubusercontent.com/rojerscripts/rojerscripts.github.io/main/roejrscrips.txt')
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    local function res()
        for n in request.text:gmatch('[^\r\n]+') do
            if nick:find(n) then return true end
        end
        return false
    end
    if not res() then sampAddChatMessage("{FF0000}[Подписка] {FFFFFF} Проверка базы авторизованных ников.", 0xFF0000) wait(5000)  sampAddChatMessage("{FF0000}[Подписка] {FFFFFF} Ошибка проверки авторизированных ников.", 0xFF0000) sampAddChatMessage("{FF0000}[Подписка] {FFFFFF} Оформите подписку по ссылке", 0xFF0000)  error('не привязан иди нахуй')  end
    sampAddChatMessage("{FF0000}[Подписка]{FFFFFF} Проверка базы авторизованных ников.", 0xFF0000)
	sampAddChatMessage('{FF0000}[Подписка]{FFFFFF} Ваш универсальный UUID найден в базе данных авторизированных аккаунтов', 0xFF0000)
	sampAddChatMessage('{FF0000}[Подписка]{FFFFFF} Приятной игры с Хелпером ловли rojerscripts', 0xFF0000)
	wait(3000)
    sampAddChatMessage("{808080}[ARZ Helper Lovli]{C0C0C0} Скрипт успешно запущен! Версия скрипта: "..thisScript().version, 0x808080)
    sampAddChatMessage("{808080}[Developers]{C0C0C0} Разработчики скрипта - rojersctipts (https://rojerscripts.github.io)", 0x808080)

    sampRegisterChatCommand("helper", function() main_window_state.v = not main_window_state.v end)
	sampRegisterChatCommand('wh',wh)
    sampRegisterChatCommand("fh",function(arg) sampSendChat("/findihouse "..arg) end)
    sampRegisterChatCommand("fbiz",function(arg) sampSendChat("/findibiz "..arg) end)
	while not isSampAvailable() do
		wait(0)
	end
    local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local nick = sampGetPlayerNickname(id)
    while true do
        wait(0)
		 if  isKeyJustPressed(113) then
			wh = not wh
                if wh then
                    nameTagOn()
                    addOneOffSound(0.0, 0.0, 0.0, 1139)
                else 
                    nameTagOff()
                    addOneOffSound(0.0, 0.0, 0.0, 1138)
                end
			end
		if mainIni.osnovnoe.collision then kol() end
		if os.clock() - timert > 0 and synct then
			timert, tpCountt = 0, 0
			synct = true
			sampForceOnfootSync()
			synct = true
		  end
		keybuff.v = string.upper(keybuff.v)
        if main_window_state.v then
            imgui.ShowCursor = true
            imgui.Process = true
        end
		if wasKeyPressed(keys.name_to_id(keybuff.v, false)) and mainIni.trenercaptcha.truefalsekey and not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() then showCaptcha() end
		local result, button, list, input = sampHasDialogRespond(8812)
    if result then
      if button == 1 then
        if input == captcha..'0' then sampAddChatMessage(string.format('{A9A9A9}[Training Captcha] {ffffff}Ответ верный | ('..captcha..'0 / '..input..') Скорость ввода: [%.3f]', os.clock() - captime), -1)
        elseif input ~= captcha..'0' then sampAddChatMessage(string.format('{A9A9A9}[Training Captcha] {ffffff}Ответ неверный | Капча ('..captcha..'0 / '..input..') Скорость ввода: [%.3f]', os.clock() - captime), -1) end
      end
      removeTextdraws()
			if captcha == nil then
				showCaptcha()
			end
    end
    end
end

function imgui.CreatePaddingX(padding_custom)
	padding_custom = padding_custom or 8 
	imgui.SetCursorPosX(imgui.GetCursorPos().x + padding_custom)
end
function imgui.CreatePaddingY(padding_custom)
	padding_custom = padding_custom or 8
	imgui.SetCursorPosY(imgui.GetCursorPos().y + padding_custom)
end
function imgui.CreatePadding(padding_custom,padding_custom2)
	padding_custom, padding_custom2 = padding_custom or 8, padding_custom2 or 8
	imgui.CreatePaddingX(padding_custom)
	imgui.CreatePaddingY(padding_custom2)
end
function imgui.CenterText(text) 
	local width = imgui.GetWindowWidth()
	local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end
function imgui.CenterColumnText(text)
    imgui.SetCursorPosX((imgui.GetColumnOffset() + (imgui.GetColumnWidth() / 2)) - imgui.CalcTextSize(text).x / 2)
    imgui.Text(text)
end

function imgui.Link(link,name,myfunc)
	myfunc = type(name) == 'boolean' and name or myfunc or false
	name = type(name) == 'string' and name or type(name) == 'boolean' and link or link
	local size = imgui.CalcTextSize(name)
	local p = imgui.GetCursorScreenPos()
	local p2 = imgui.GetCursorPos()
	local resultBtn = imgui.InvisibleButton('##'..link..name, size)
	if resultBtn then
		if not myfunc then
		    os.execute('explorer '..link)
		end
	end
	imgui.SetCursorPos(p2)
	if imgui.IsItemHovered() then
		imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.ButtonHovered], name)
		imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + size.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.ButtonHovered]))
	else
		imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.Button], name)
	end
	return resultBtn
end

function imgui.TextQuestion(text)
	imgui.TextDisabled(fa.ICON_QUESTION)
	if imgui.IsItemHovered() then
	  imgui.BeginTooltip()
	  local p = imgui.GetCursorScreenPos()
	  imgui.SetCursorScreenPos(imgui.ImVec2(p.x + 14,p.y + 14))
	  imgui.PushTextWrapPos(450)
	  imgui.TextUnformatted(text)
	  local p = imgui.GetCursorScreenPos()
	  local obrez = imgui.GetFont():CalcTextSizeA(imgui.GetFont().FontSize,450,450,text).x
	  imgui.SetCursorScreenPos(imgui.ImVec2(p.x + obrez + 28,p.y + 14))
	  imgui.PopTextWrapPos()
	  imgui.EndTooltip()
	end
end
function imgui.TextQuestion(text)
	imgui.TextDisabled('(?)')
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end


function imgui.OnDrawFrame()
	imgui.ShowCursor = main_window_state.v 
	local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local nick = sampGetPlayerNickname(id)
	local sw, sh = getScreenResolution()
	if main_window_state.v then
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(500,340), imgui.Cond.FirstUseEver)
		imgui.Begin('[ARZ] Helper Lovli',main_window_state,imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)
		imgui.CenterText(u8('Привет, '..nick:gsub('_',' ')))
        imgui.BeginChild("left", imgui.ImVec2(150, 290), true)
        if imgui.Selectable(u8' Главные настройки', menu == 1) then menu = 1
		elseif imgui.Selectable(u8' Помощь на слёте', menu == 2) then menu = 2
		elseif imgui.Selectable(u8' Тренер капчи', menu == 3) then menu = 3 end
        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginChild('right', imgui.ImVec2(325, 290), true)
            if menu == 1 then
			imgui.Text(u8" Текущая версия скрипта:"..thisScript().version)
			imgui.Text(u8" Разработчики скрипта -") imgui.SameLine() imgui.Link('https://rojerscripts.github.io/downloads', 'rojerscripts')
			imgui.Separator()
	        imgui.Text(u8' Выбор темы:')
			if imgui.Combo(u8'##Thema', imgui_theme, items, -1)then
				mainIni.config.theme = imgui_theme.v
				saveIniFile()
				setstyleandtheme()
			end
			imgui.Separator()
			imgui.Text(u8"Специальные функции скрипта:")
			if imgui.Button(u8'Перезагрузить скрипт') then showCursor(false, false) sampAddChatMessage("{808080}[Reload]{C0C0C0} Скрипт был перезагружен, ошибок не найдено.", 0x808080) thisScript():reload() end
			if imgui.Button(u8'Выгрузить скрипт', imgui.SameLine()) then showCursor(false, false) sampAddChatMessage('{808080}[Loading]{C0C0C0} Скрипт был отключён, для восстановления работы нажмите комбинацию клавиш CTRL+R', 0x808080) thisScript():unload() end
		end
		if menu == 2 then
			if imgui.Checkbox(u8'Collision', imgui.ImBool(mainIni.osnovnoe.collision)) then
				mainIni.osnovnoe.collision = not mainIni.osnovnoe.collision
				saveIniFile()
			end
			if imgui.Checkbox(u8'Антирванка', imgui.ImBool(mainIni.osnovnoe.rvanka)) then
				mainIni.osnovnoe.rvanka = not mainIni.osnovnoe.rvanka
				saveIniFile()
			end
			imgui.Separator()
			if imgui.Checkbox(u8'Удаление строчек "Не флуди" в чате', imgui.ImBool(mainIni.osnovnoe.delnoflood)) then
				mainIni.osnovnoe.delnoflood = not mainIni.osnovnoe.delnoflood
				saveIniFile()
			end
			if imgui.Checkbox(u8'Отключить ники, семьи и описания', ybaritxyiny) then
				pStSet = sampGetServerSettingsPtr()
if ybaritxyiny.v then
		mem.setint8(pStSet + 56, 0)
		for i = 1, 2048 do
				if sampIs3dTextDefined(i) then
						local text, color, posX, posY, posZ, distance, ignoreWalls, player, vehicle = sampGet3dTextInfoById(i)
						for ii = 1, #fams do if text:match(string.format('.+%s', fams[tonumber(ii)])) then sampDestroy3dText(i) end end
				end
		end
		for i=0, 2048 do
			if sampIs3dTextDefined(i) then
			local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
				if color == 4291611852 and playerId >= 0 then sampDestroy3dText(i) end

			end
		end
else
		pStSet = sampGetServerSettingsPtr()
		mem.setint8(pStSet + 56, 1)
end
end
		end
	        
		if menu == 3 then
			imgui.Text(u8'Кнопка')
        if imgui.InputText('##3', keybuff, imgui.SameLine()) then
			mainIni.trenercaptcha.thenerkey = string.format('%s', tostring(keybuff.v))
			saveIniFile()
		end
		if imgui.Checkbox(u8'Открывать капчу по кнопке', imgui.ImBool(mainIni.trenercaptcha.truefalsekey)) then
			mainIni.trenercaptcha.truefalsekey = not mainIni.trenercaptcha.truefalsekey
			saveIniFile()
		  end
		end
		imgui.EndChild()
		imgui.CenterText(u8" Скрипт активирован до 22.06.2022")
		imgui.End()
	end
end


function kol()
	for _, pedv in ipairs(getAllChars()) do
	if doesCharExist(pedv) then
		if pedv ~= playerPed then
	   setCharCollision(pedv, false)
	end
end
end
end

function samp.onPlayerSync(id, data)
	if mainIni.osnovnoe.rvanka then
		local x, y, z = getCharCoordinates(PLAYER_PED)
		if x - data.position.x > -1.5 and x - data.position.x < 1.5 then
			if (data.moveSpeed.x >= 1.5 or data.moveSpeed.x <= -1.5) or (data.moveSpeed.y >= 1.5 or data.moveSpeed.y <= -1.5) or (data.moveSpeed.z >= 0.5 or data.moveSpeed.z <= -0.5) then
				data.moveSpeed.x, data.moveSpeed.y, data.moveSpeed.z = 0, 0, 0
			end
		end
	end
	return {id, data}
end

function samp.onVehicleSync(id, vehid, data)
	if mainIni.osnovnoe.rvanka then
		local x, y, z = getCharCoordinates(PLAYER_PED)
		if x - data.position.x > -1.5 and x - data.position.x < 1.5 then
			if (data.moveSpeed.x >= 1.5 or data.moveSpeed.x <= -1.5) or (data.moveSpeed.y >= 1.5 or data.moveSpeed.y <= -1.5) or (data.moveSpeed.z >= 0.5 or data.moveSpeed.z <= -0.5) then
				data.moveSpeed.x, data.moveSpeed.y, data.moveSpeed.z = 0, 0, 0
				data.position.x = data.position.x - 5
			end
		end
	end
	return {id, vehid, data}
end



function samp.onServerMessage(color, text)
	if mainIni.osnovnoe.delnoflood then
		if text:find('Не флуди') then
		return false
	end
end
end


function nameTagOn()
	local pStSet = sampGetServerSettingsPtr()
	NTdist = mem.getfloat(pStSet + 39)
	NTwalls = mem.getint8(pStSet + 47)
	NTshow = mem.getint8(pStSet + 56)
	mem.setfloat(pStSet + 39, 1488.0)
	mem.setint8(pStSet + 47, 0)
	mem.setint8(pStSet + 56, 1)
end



function nameTagOff()
	local pStSet = sampGetServerSettingsPtr()
	mem.setfloat(pStSet + 39, NTdist)
	mem.setint8(pStSet + 47, NTwalls)
	mem.setint8(pStSet + 56, NTshow)
end



function wh()
	act = not act
	if act then
	nameTagOn()
	printStringNow('Wallhack activated by rojerscripts!', 1000)
	else
	nameTagOff()
	printStringNow('Wallhack disabled by rojerscripts!', 1000)
	end
end

function samp.onSendDialogResponse(id, but, lis, input)
	if id == did then
		time = os.clock() - start
		time1 = string.format("%.3f", time)
	if oopsTimer.v then
		sampAddChatMessage("{EE82EE}[Таймер ловли]{FFFFFF} Вы ввели за: {FB8900}"..time1.." {FFFFFF} секунд. Твоя капча была: {FB8900}"..input.."{FFFFFF} !", -1)
	end
	end
	end

function showCaptcha()
    removeTextdraws()
    t = t + 1
    sampTextdrawCreate(t, "LD_SPAC:white", math.random(220,math.random(219.1,math.random(221.5,218.1))), math.random(120,math.random(121.2,119.1)))
    sampTextdrawSetLetterSizeAndColor(t, 0, 6.5, 0x80808080)
    sampTextdrawSetBoxColorAndSize(t, 1, 0xFF1A2432, 380, 0.000000)

    t = t + 1
    sampTextdrawCreate(t, "LD_SPAC:white", math.random(225,math.random(226.1,224.4)), math.random(125,126.1))
    sampTextdrawSetLetterSizeAndColor(t, 0, 5.5, 0x80808080)
    sampTextdrawSetBoxColorAndSize(t, 1, 0xFF759DA3, 375, 0.000000)
    nextPos = math.random(-30,math.random(-28,math.random(-27,-33)));

    math.randomseed(os.time())
    for i = 1, 4 do
        a = math.random(0, 9)
        table.insert(captchaTable, a)
        captcha = captcha..a
    end
       -- sampTextdrawCreate(t, "usebox", math.random(239.8,math.random(240.5,math.random(241.1,238.9))) + nextPos, math.random(128.8,math.random(130.5,math.random(127.3,math.random(131.1,math.random(132.1,129.1))))))
    for i = 0, 4 do
        nextPos = nextPos + math.random(30,29.5)
        t = t + 1
        sampTextdrawCreate(t, "usebox", math.random(240,math.random(239,math.random(241,math.random(240.5,math.random(242.5,math.random(239.6,math.random(237.6,math.random(235,230)))))))) + nextPos, math.random(130,math.random(131,math.random(132,math.random(133,math.random(134,math.random(135,math.random(129,math.random(128,math.random(124,126.6))))))))))
        sampTextdrawSetLetterSizeAndColor(t, 0, 4.5, 0x80808080)
        sampTextdrawSetBoxColorAndSize(t, 1, 0xFF1A2432, math.random(30,31), 25.000000)
        sampTextdrawSetAlign(t, 2)
        if i < 4 then GenerateTextDraw(captchaTable[i + 1], math.random(240,239) + nextPos, math.random(130,131), 3 + i * 10)
        else GenerateTextDraw(0, 240 + nextPos, math.random(130,math.random(129,131)), 3 + i * 10) end
    end
    captchaTable = {}
    sampShowDialog(8812, '{F89168}Проверка на робота', '{FFFFFF}Введите {C6FB4A}5{FFFFFF} символов, которые\nвидно на {C6FB4A}вашем{FFFFFF} экране.', 'Принять', 'Отмена', 1)
    captime = os.clock()
end

function removeTextdraws()
	if t > 0 then
	  for i = 1, t do sampTextdrawDelete(i) end
	  t = 0
	  captcha = ''
	  captime = 0
	end
  end

local cc = {}
function cc:hex(hex,alpha)
    alpha = tonumber(alpha) or 255
    local methods = {}
    function methods:rgb()
        return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    end
    function methods:rgba()
        local r,g,b = methods:rgb()
        return r,g,b,alpha
    end
    function methods:ImVec4()
        local r,g,b,a = methods:rgba()
        return imgui.ImVec4(r/255,g/255,b/255,a/255)
    end
    function methods:ImColor()
        return imgui.ImColor(methods:ImVec4())
    end
    function methods:U32()
        return methods:ImColor():GetU32()
    end
    return methods
end

function theme1()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00);
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00);
    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00);
	colors[clr.ChildWindowBg]          = ImVec4(0.10, 0.10, 0.10, 1.00);
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00);
    colors[clr.Border]                 = ImVec4(0.60, 0.60, 0.60, 0.40);
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.00);
    colors[clr.FrameBg]                = ImVec4(0.36, 0.36, 0.36, 0.30);
    colors[clr.FrameBgHovered]         = ImVec4(0.53, 0.53, 0.53, 0.30);
    colors[clr.FrameBgActive]          = ImVec4(0.62, 0.62, 0.62, 0.30);
    colors[clr.TitleBg]                = ImVec4(0.12, 0.12, 0.12, 0.92);
    colors[clr.TitleBgActive]          = ImVec4(0.11, 0.11, 0.11, 1.00);
    colors[clr.TitleBgCollapsed]       = ImVec4(0.11, 0.11, 0.11, 0.85);
    colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
    colors[clr.ScrollbarBg]            = ImVec4(0.13, 0.13, 0.13, 1.00);
    colors[clr.ScrollbarGrab]          = ImVec4(0.26, 0.26, 0.26, 1.00);
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.19, 0.19, 0.19, 1.00);
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.40, 0.40, 0.40, 1.00);
    colors[clr.ComboBg]                = ImVec4(0.23, 0.23, 0.23, 1.00);
    colors[clr.CheckMark]              = ImVec4(0.90, 0.90, 0.90, 1.00);
    colors[clr.SliderGrab]             = ImVec4(0.27, 0.27, 0.27, 1.00);
    colors[clr.SliderGrabActive]       = ImVec4(0.24, 0.23, 0.23, 1.00);
    colors[clr.Button]                 = ImVec4(0.36, 0.36, 0.36, 1.90);
    colors[clr.ButtonHovered]          = ImVec4(0.47, 0.46, 0.46, 0.90);
    colors[clr.ButtonActive]           = ImVec4(0.64, 0.64, 0.64, 1.53);
    colors[clr.Header]                 = ImVec4(0.36, 0.36, 0.36, 0.30);
    colors[clr.HeaderHovered]          = ImVec4(0.49, 0.49, 0.49, 0.30);
    colors[clr.HeaderActive]           = ImVec4(0.42, 0.42, 0.42, 0.30);
    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.30);
    colors[clr.SeparatorHovered]       = ImVec4(0.36, 0.36, 0.36, 0.30);
    colors[clr.SeparatorActive]        = ImVec4(0.23, 0.23, 0.23, 0.30);
    colors[clr.ResizeGrip]             = ImVec4(0.36, 0.36, 0.36, 0.30);
    colors[clr.ResizeGripHovered]      = ImVec4(0.49, 0.49, 0.49, 0.30);
    colors[clr.ResizeGripActive]       = ImVec4(0.25, 0.25, 0.25, 0.30);
    colors[clr.CloseButton]            = ImVec4(0.36, 0.36, 0.36, 0.30);
    colors[clr.CloseButtonHovered]     = ImVec4(0.51, 0.51, 0.51, 0.30);
    colors[clr.CloseButtonActive]      = ImVec4(0.22, 0.22, 0.22, 0.30);
    colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00);
    colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00);
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00);
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00);
    colors[clr.TextSelectedBg]         = ImVec4(0.25, 0.25, 0.25, 0.80);
    colors[clr.ModalWindowDarkening]   = ImVec4(0.21, 0.21, 0.21, 0.21);
end
function theme2()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 1.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme3()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 1.40)
	colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
	colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
	colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme4()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 1.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme6()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.Text] = ImVec4(0.90, 0.90, 0.90, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
	colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
	colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
	colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
	colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
	colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
	colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
	colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
	colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
	colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
	colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
	colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
	colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
	colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
	colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
	colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
	colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
	colors[clr.TextSelectedBg] = cc:hex('FFA633',200):ImVec4()
	colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme7()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.WindowBg]              = ImVec4(0.14, 0.12, 0.16, 1.00);
	colors[clr.ChildWindowBg]         = ImVec4(0.30, 0.20, 0.39, 0.00);
	colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
	colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
	colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
	colors[clr.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
	colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
	colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
	colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
	colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
	colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
	colors[clr.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
	colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
	colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
	colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.ComboBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
	colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
	colors[clr.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
	colors[clr.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 1.44);
	colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
	colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
	colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
	colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
	colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
	colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
	colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.CloseButton]           = ImVec4(1.00, 1.00, 1.00, 0.75);
	colors[clr.CloseButtonHovered]    = ImVec4(0.88, 0.74, 1.00, 0.59);
	colors[clr.CloseButtonActive]     = ImVec4(0.88, 0.85, 0.92, 1.00);
	colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
	colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
	colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
	colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
	colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme9()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
	colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
	colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
	colors[clr.ChildWindowBg]          = ImVec4(0.17, 0.17, 0.17, 1.00);
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
	colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
	colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
	colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
	colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);
	colors[clr.FrameBgActive]          = ImVec4(0.10, 0.10, 0.10, 1.00);
	colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
	colors[clr.TitleBgActive]          = ImVec4(0.12, 0.12, 0.12, 1.00);
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
	colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
	colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.18, 0.22, 0.25, 1.00);
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.24, 0.24, 0.24, 1.00);
	colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
	colors[clr.CheckMark]              = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.SliderGrab]             = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.SliderGrabActive]       = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.Button]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.ButtonHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
	colors[clr.ButtonActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
	colors[clr.Header]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.HeaderHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
	colors[clr.HeaderActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
	colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
	colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
	colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
	colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
	colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
	colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
	colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
	colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end
function theme10()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
	colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
	colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
	colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
	colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
	colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
	colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
	colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
	colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
	colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
	colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
	colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
	colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
	colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
	colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
	colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
	colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
	colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
	colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg] = cc:hex('3A33FF',180):ImVec4()
	colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35);
end
function theme11()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	
    colors[clr.Text]   = ImVec4(0.00, 0.00, 0.00, 0.71)
    colors[clr.TextDisabled]   = ImVec4(0.24, 0.24, 0.24, 1.00)
    colors[clr.WindowBg]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.ChildWindowBg]         = ImVec4(0.96, 0.96, 0.96, 1.00)
    colors[clr.PopupBg]               = ImVec4(0.92, 0.92, 0.92, 1.00)
    colors[clr.Border]                = ImVec4(0.86, 0.86, 0.86, 1.00)
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]               = ImVec4(0.88, 0.88, 0.88, 1.00)
    colors[clr.FrameBgHovered]        = ImVec4(0.82, 0.82, 0.82, 1.00)
    colors[clr.FrameBgActive]         = ImVec4(0.76, 0.76, 0.76, 1.00)
    colors[clr.TitleBg]               = ImVec4(0.00, 0.45, 1.00, 0.82)
    colors[clr.TitleBgCollapsed]      = ImVec4(0.00, 0.45, 1.00, 0.82)
    colors[clr.TitleBgActive]         = ImVec4(0.00, 0.45, 1.00, 1.00)
    colors[clr.MenuBarBg]             = ImVec4(0.00, 0.37, 0.78, 1.00)
    colors[clr.ScrollbarBg]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.ScrollbarGrab]         = ImVec4(0.00, 0.35, 1.00, 0.78)
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.00, 0.33, 1.00, 0.84)
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.00, 0.31, 1.00, 0.88)
    colors[clr.ComboBg]               = ImVec4(0.92, 0.92, 0.92, 1.00)
    colors[clr.CheckMark]             = ImVec4(0.00, 0.49, 1.00, 0.59)
    colors[clr.SliderGrab]            = ImVec4(0.00, 0.49, 1.00, 0.59)
    colors[clr.SliderGrabActive]      = ImVec4(0.00, 0.39, 1.00, 0.71)
    colors[clr.Button]                = ImVec4(0.00, 0.49, 1.00, 1.59)
    colors[clr.ButtonHovered]         = ImVec4(0.00, 0.49, 1.00, 0.71)
    colors[clr.ButtonActive]          = ImVec4(0.00, 0.49, 1.00, 0.78)
    colors[clr.Header]                = ImVec4(0.00, 0.49, 1.00, 0.78)
    colors[clr.HeaderHovered]         = ImVec4(0.00, 0.49, 1.00, 0.71)
    colors[clr.HeaderActive]          = ImVec4(0.00, 0.49, 1.00, 0.78)
    colors[clr.ResizeGrip]            = ImVec4(0.00, 0.39, 1.00, 0.59)
    colors[clr.ResizeGripHovered]     = ImVec4(0.00, 0.27, 1.00, 0.59)
    colors[clr.ResizeGripActive]      = ImVec4(0.00, 0.25, 1.00, 0.63)
    colors[clr.CloseButton]           = ImVec4(0.00, 0.35, 0.96, 0.71)
    colors[clr.CloseButtonHovered]    = ImVec4(0.00, 0.31, 0.88, 0.69)
    colors[clr.CloseButtonActive]     = ImVec4(0.00, 0.25, 0.88, 0.67)
    colors[clr.PlotLines]             = ImVec4(0.00, 0.39, 1.00, 0.75)
    colors[clr.PlotLinesHovered]      = ImVec4(0.00, 0.39, 1.00, 0.75)
    colors[clr.PlotHistogram]         = ImVec4(0.00, 0.39, 1.00, 0.75)
    colors[clr.PlotHistogramHovered]  = ImVec4(0.00, 0.35, 0.92, 0.78)
    colors[clr.TextSelectedBg]        = ImVec4(0.00, 0.47, 1.00, 0.59)
    colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35)
end
function theme12()
	imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(0.10, 0.10, 0.10, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
    colors[clr.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
    colors[clr.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
    colors[clr.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
    colors[clr.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
    colors[clr.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
    colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
    colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
    colors[clr.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.CloseButtonHovered]     = ImVec4(0.00, 0.88, 0.42, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.17, 0.17, 0.17, 0.48)
end	

function setstyleandtheme()
	if mainIni.config.theme == 0 then theme1()
	elseif mainIni.config.theme == 1 then theme2()
	elseif mainIni.config.theme == 2 then theme3()
	elseif mainIni.config.theme == 3 then theme4()
	elseif mainIni.config.theme == 4 then theme6() 
	elseif mainIni.config.theme == 5 then theme7() 
	elseif mainIni.config.theme == 6 then theme9() 
	elseif mainIni.config.theme == 7 then theme10()
	elseif mainIni.config.theme == 8 then theme11()
	elseif mainIni.config.theme == 9 then theme12() end	
end
setstyleandtheme()