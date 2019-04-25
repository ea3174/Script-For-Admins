script_name("SFA")
script_description("/SFA - Основная команда.")
script_version("1.4")
script_author("Rickot") 
script_dependencies("SAMPFUNCS, SAMP")
--[[Билиотеки которые будут применяться  после local и перед =, это локальная переменная...
 которая обращается к функции брав нужную либу]]
require("lib.moonloader")
require("lib.sampfuncs")
local sampev = require 'lib.samp.events'
local imgui = require "imgui"
local key = require "vkeys"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local window1 = imgui.ImBool(false)
local window2 = imgui.ImBool(false)
local mainwindow = imgui.ImBool(false)
--[[Энкодинг это грубо говоря перевод UTF8 в кирилицу (а как мы знаем utf8 это инглиш..)]]
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
sname = "{ffffff}* [SFA]:{00BFFF} "

jstart = 1 -- jstart это воспроизводная текста при запуске..

function main()
  	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(1000) end
	autoupdate("https://raw.githubusercontent.com/ea3174/SFA/master/SFA.json", '['..string.upper(thisScript().name)..']: ', "http://vk.com/rickot")
--   checkUpdate()
    -- По принту можно понять что ниже проверка сервера
    print("Проверка сервера...")
    	if sampGetCurrentServerAddress() == "194.61.44.100" then
    		gameServer = "Amazing MZ"
    		srv = 1
	--[[elseif это как if выше ток доп к однуму else и end]]	elseif sampGetCurrentServerAddress() == "" then -- эт добавил шоб я мог его тестить
    		gameServer = ""
    		srv = 2
		else
			print("Сервер не допущен, работа скрипта завершена")
    		sampAddChatMessage("[SFA]{FFFFFF} К сожалению, данный скрипт недоступен для работы на данном сервере.", 0x046D63)
    		sampAddChatMessage("[SFA]{FFFFFF} Свяжитесь с разработчиком, если хотите уточнить возможность решения данной проблемы.", 0x046D63)
    		thisScript():unload()
    		return
    	end
    	print("Проверка пройдена, сервер: "..tostring(gameServer))

 if jstart == 1 then-- отправляет сообщение в игровой чат
    sampAddChatMessage("{ffffff}* [SFA{ffffff}]:{00BFFF} SFA для администрации Amazing ZM", -1)
    sampAddChatMessage("{ffffff}* [SFA{ffffff}]:{00BFFF} Скрипт успешно запущен. - [/sfa].", -1)
	sampAddChatMessage('{ffffff}* [SFA{ffffff}]:{00BFFF} Текущая версия: '..thisScript().version)
 elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055} SFA{ffffff}]: {949055}Текущая версия : '..thisScript().version)
  end
  --------------------------КОМАНДЫ--------------------------
sampRegisterChatCommand("sfa", window)
     ---------------------Ответы в репорту-------------------
sampRegisterChatCommand("da", otvetda)
sampRegisterChatCommand("net", otvetnet)
sampRegisterChatCommand("pri", otvetpri)
sampRegisterChatCommand("spect", otvetspect)
sampRegisterChatCommand("prest", otvetprest)
sampRegisterChatCommand("ukrit", otvetukrit)
sampRegisterChatCommand("chist", otvetchist)
sampRegisterChatCommand("infroll", otvetinfrol)
sampRegisterChatCommand("infclass", otvetinfclass)
sampRegisterChatCommand("forum", otvetforum)
sampRegisterChatCommand("nakazan", otvetnakazan)
sampRegisterChatCommand("tut", tut)
sampRegisterChatCommand("hz", otvethz)
---------------------Наказания для пидарасов-------------------
sampRegisterChatCommand("cheat", cheat)
sampRegisterChatCommand("capsosk", capsosk)
sampRegisterChatCommand("caps", caps)
sampRegisterChatCommand("pomeha", pomeha)
sampRegisterChatCommand("prohod", prohod)
sampRegisterChatCommand("tkgrenade", tkgrenade)
sampRegisterChatCommand("oskproject", oskproject)
sampRegisterChatCommand("tkrpg", tkrpg)
sampRegisterChatCommand("upom", upominul)
sampRegisterChatCommand("afk", heafk)
sampRegisterChatCommand("tks", tksurvive)
sampRegisterChatCommand("tkz", tkzombie)
sampRegisterChatCommand("teampvp", teampvp)
sampRegisterChatCommand("rekl", reklama)
sampRegisterChatCommand("bag", bag)
sampRegisterChatCommand("wafk", afkvbou)
sampRegisterChatCommand("neproh", neproh)
sampRegisterChatCommand("beg", begun)
sampRegisterChatCommand("offtop", offtopinreport)
sampRegisterChatCommand("osk", oskorbil)
sampRegisterChatCommand("admosk", adminaosknyl)
sampRegisterChatCommand("udlin", dlinner)
sampRegisterChatCommand("pust", pustoi)
sampRegisterChatCommand("zapret", zapret)
sampRegisterChatCommand("flo", flooder)
sampRegisterChatCommand("jbc", jalobnik_chat)
resX, resY = getScreenResolution()
while true do wait(0)
    ------------- Имгуи процесс это рега окон имгуи..
imgui.Process = window1.v or window2.v or  mainwindow.v

end
end

function otvetda(param) -- Param: говорим скрипту принимать параметр (если не будет param то работать ясен хер не будет)
    id = tonumber(param) -- Параметр переводить в переменную id..
    if param then
        if id ~= nil then -- if id ~= nil это тип "Если параметр не пустой то пишем то что в сенде"
                    sampSendChat('/ans '..id..' Да.')
                 else -- Если параметр пуст выводим текст ниже...
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Да".[/da id].', -1)
        end
    end
end

    function otvetnet(param)
            id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' Нет.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Нет". [/net id].', -1)
        end
    end
end

function otvetpri(param)
    id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' Приятной игры на Amazing ZM :)')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Приятной игры". [/pri id].', -1)
        end
    end
end

function otvetspect(param)
id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' Начал работать по вашей жалобе.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Слежу". [/spect id]', -1)
        end
    end
end

function otvetprest(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
                    sampSendChat('/ans '..id..'  Для получения престижа, вам нужно прокачать любой класс до 6 уровня.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Как получить престиж. [/prest id]', -1) -- -1 это цвет в стандарт ставим
        end
    end
end
function otvetukrit(param)
    id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' У вас есть 15 секунд, чтобы найти укрытие!')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "В укрыие". [/ukrit id]', -1)
        end
    end
end
function otvetchist(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
    sampSendChat('/ans '..id..' Не заметил нарушений от данного игрока.')
   else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Нарушений не заметил". [/chist id]', -1)
      end
     end
end

function otvethz(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
    sampSendChat('/ans '..id..' К сожалению, я не могу ответить на этот вопрос.')
   else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Не могу ответь на этот вопрос". [/hz id]', -1)
      end
     end
end

function otvetinfrol(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
    sampSendChat('/ans '..id..' Вся информация о рулетке - /roll. ')
   else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "/roll". [/infroll id]', -1)
      end
     end
end

function otvetnakazan(param)
	if param then
		if id ~= nil then
			sampSendChat('/ans '..id..' Игрок наказан. Приятной игры :) ')
		else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Игрок наказан". [/nakazan id]', -1)
		end
	end
end

function otvetinfclass(param)
	 id = tonumber(param)
	 if param then
		 if id ~= nil then
                sampSendChat('/ans '..id..' Каждый класс уникален по-своему. Стоимость смены класса(/class) - 50.000. ')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ на вопрос по классам. [/infclass id]', -1)
        end
    end
end

function otvetforum(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' Напишите жалобу на форум.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Жалобу на форум". [/forum id]', -1)
		end
    end
end

function tut(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' Вы тут? Начинайте игру, иначе вы будете кикнуты.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Начинайте игру". [/tut id]', -1)
		end
    end
end

function prohod(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' Проходите карту.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Ответ "Проходите карту". [/prohod id]', -1)
		end
    end
end

function bag(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' Багоюз.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за багоюз [/bag id]', -1)
		end
	end
end

function cheat(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 Чит.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать бан за использование читов [/cheat id]', -1)
		end
	end
end

function teampvp(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..'  Командная игра на ПВП.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за командную игру на ПВП [/teampvp id]', -1)
		end
	end
end

function upominul(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 360 Упоминание родных.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать мут за упоминание родных [/upom id]', -1)
		end
	end
end

function heafk(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' Афк без паузы (esc).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Кикнуть за афк без паузы [/afk id]', -1)
		end
	end
end

function caps(param)
	id = tonumber(param)
	if param then
		if id ~= nil then
			sampSendChat('/mute '..id..' 15 Верхний регистр(caps). ')
		end
	end
end

function tksurvive(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' ТК (Survive).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Кикнуть за тк (выживший) [/tks id]', -1)
		end
	end
end

function tkzombie(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' ТК (Zombie).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за ТК зомби [/tkz id]', -1)
		end
	end
end

function tkrpg(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' ТК с РПГ.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за ТК с РПГ [/tkrpg id]', -1)
		end
	end
end

function pomeha(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' Помеха.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Кикнуть за помеху [/pomeha id]', -1)
		end
	end
end

function reklama(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 Реклама. ')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Забанить чертового рекламщика [/rekl id]', -1)
		end
	end
end

function neproh(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' Непрохождение карты.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Кикнуть за непрохождение карты [/neproh id]', -1)
		end
	end
end

function tkgrenade(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' ТК гранатой.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за ТК гранатой [/tkgrenade id]', -1)
		end
	end
end

function begun(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' Бег по карте.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Кикнуть за бег по карте [/beg id]', -1)
		end
	end
end

function offtopinreport(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 30 Оффтоп в репорт. ')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за оффтоп в репорт [/offtop id]', -1)
		end
	end
end

function oskorbil(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 40 Оскорбление игроков')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за оск. игроков [/osk id]', -1)
		end
	end
end

function capsosk(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 55 Оск. игроков + Капс.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за капс + оск. [/capsosk id]', -1)
		end
	end
end

function flooder(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 Flood.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за флуд [/flo id]', -1)
		end
	end
end

function oskproject(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 Оскорбление проекта.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать бан за оскорбление проекта [/oskproject id]', -1)
		end
	end
end

function adminaosknyl(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 90 Оскорбление администрации.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за оскорбление Администрации [/admosk id]', -1)
		end
	end
end

function dlinner(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 Удлиннение слов.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за удлиннение слов [/udlin id]', -1)
		end
	end
end

function pustoi(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 30 Пустые сообщения.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за пустые сообщения [/pust id]', -1)
		end
	end
end

function jalobnik_chat(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 Жалоба в чат.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Дать мут за жалобу в чат [/jbc id]', -1)
		end
	end
end

function zapret(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' Запретная нычка.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: Выдать варн за запретную нычку [/zapret id]', -1)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------MENU--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function apply_custom_style() --[[имгуи стиль.. стоит андровира, но можно
    поставить и другую.. НО часто их выкладывают в C++ тобишь надо будет перевести в lua (это изи)]]
			imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
	colors[clr.WindowBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
	colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PopupBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.Border] = ImVec4(0.86, 0.86, 0.86, 1.00)
	colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg] = ImVec4(0.21, 0.20, 0.21, 0.60)
	colors[clr.FrameBgHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.FrameBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.MenuBarBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.00, 0.46, 0.65, 0.00)
	colors[clr.ScrollbarGrab] = ImVec4(0.00, 0.46, 0.65, 0.44)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.00, 0.46, 0.65, 0.74)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ComboBg] = ImVec4(0.15, 0.14, 0.15, 1.00)
	colors[clr.CheckMark] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.SliderGrab] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.SliderGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.Button] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.Header] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.30)
	colors[clr.ResizeGripHovered] = ImVec4(1.00, 1.00, 1.00, 0.60)
	colors[clr.ResizeGripActive] = ImVec4(1.00, 1.00, 1.00, 0.90)
	colors[clr.CloseButton] = ImVec4(1.00, 0.10, 0.24, 0.00)
	colors[clr.CloseButtonHovered] = ImVec4(0.00, 0.10, 0.24, 0.00)
	colors[clr.CloseButtonActive] = ImVec4(1.00, 0.10, 0.24, 0.00)
	colors[clr.PlotLines] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotLinesHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotHistogram] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotHistogramHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.TextSelectedBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.00)
end
apply_custom_style()
do
	local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
	local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
	local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
	local glyph_ranges_cyrillic = nil
function imgui.OnDrawFrame()
if mainwindow.v then window1.v = false window2.v = false -- фалс ставить когда окон несколько.. чтоб одно закрывалось при вызове другово
imgui.SetNextWindowSize(imgui.ImVec2(720, 555), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'Главное меню |SFA| Разработчик: Rickot.', mainwindow, img_state) --imgui.WindowFlags.NoResize)
		imgui.BeginChild('#MM', imgui.ImVec2(720,500), true)
		local nakaz = [[Блокировка чата:
/flo - Флуд
/offtop - Оффтоп в репорт
/osk - Оскорбление игроков
/admosk - Оскорбление администрации
/upom - Упоминание родных
/jbc  - Жалоба в чат.
/udlin - Удлинение слов.
/pust - Пустые сообщения.
/caps - Капс.
/capsosk - Капс + оск.

Кик игрока:
/tks - Team Kill (Выживший/Survivor)
/neproh - Непрохождение карты.
/beg - Бег по карте.
/afk - Афк без паузы.
/pomeha - Помеха

Предупреждения:
/bag - Багоюз.
/zapret - Запретная нычка.
/wafk - Афк в бою.
/teampvp - Командная игра на пвп.
/tkz - Team Kill (Зомби/Zombie)
/tkgrenade - ТК гранатой.
/tkrpg - ТК с РПГ.

Блокировка аккаунта:
/rekl - Реклама любого ресурса.
/oskproject - Оскорбление проекта.
/cheat - Использование чит программ]]
		imgui.Text(u8(nakaz))
		imgui.Text('---------------------------------------------------------------')
local otv = [[Ответы по репорту:
/da -  Да.
/net -   Нет.
/pri -   Приятной игры :)
/spect -   Работаю по Вашей жалобе.
/nakazan - Игрок наказан.
/chist -   Не наблюдаю нарушений от данного игрока.
/ukrit -   Бегите скорее в укрытие.
/prohod - Проходите карту.
/tut - Начинайте игру.
/forum -   Напишите жалобу на форум.
/prest -   Для получения престижа.
/infroll -   Информация о рулетке.
/infclass -    Подробная инфорция о классах.
]]
	imgui.Text(u8(otv))

  imgui.EndChild()
  imgui.End()
end
end
end

			function window() -- функция вызова главного окна..
			mainwindow.v = not mainwindow.v
			end

---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Прочая поебота-------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end

------------------------------------ Автообновление -------------------------

function ftext(message)
    sampAddChatMessage(string.format('%s %s', sname, message), 0xffffff)
end


color = 0xffffff

function checkUpdate()
  local fpath = os.getenv('TEMP') .. '\\SFA.json'
  downloadUrlToFile('https://raw.githubusercontent.com/ea3174/SFA/master/SFA.json', fpath, function(id, status, p1, p2)
    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    local f = io.open(fpath, 'r')
    if f then
      local info = decodeJson(f:read('*a'))
      updatelink = info.updateurl
      if info and info.latest then
        version = tonumber(info.latest)
        if version > tonumber(thisScript().version) then
          lua_thread.create(goupdate)
        else
          update = false
          ftext(('У вас последняя версия! Обновление не требуется!'), color)
        end
      end
    end
  end
end)
end

function goupdate()
ftext(('Обнаружено обновление. AutoReload может конфликтовать. Обновляюсь...'), color)
ftext(('Текущая версия: '..thisScript().version..". Новая версия: "..version), color)
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
  if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
  ftext(('Обновление завершено!'), color)
  thisScript():reload()
end
end)
end
