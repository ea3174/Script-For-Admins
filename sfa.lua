script_name("SFA")
script_description("/SFA - �������� �������.")
script_version("1.3")
script_author("Rickot")
script_dependencies("SAMPFUNCS, SAMP")
--[[��������� ������� ����� �����������  ����� local � ����� =, ��� ��������� ����������...
 ������� ���������� � ������� ���� ������ ����]]
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
--[[�������� ��� ����� ������ ������� UTF8 � �������� (� ��� �� ����� utf8 ��� ������..)]]
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

jstart = 1 -- jstart ��� �������������� ������ ��� �������..

function main()
  	if not isSampLoaded() or not isSampfuncsLoaded() then return end
		autoupdate("https://raw.githubusercontent.com/ea3174/Script-For-Admins/master/SFA.json", '['..string.upper(thisScript().name)..']: ', "http://vk.com/rickot")
	while not isSampAvailable() do wait(1000) end
--   checkUpdate()
    -- �� ������ ����� ������ ��� ���� �������� �������
    print("�������� �������...")
    	if sampGetCurrentServerAddress() == "194.61.44.100" then -- ��� ��� ip ������� ��� ���� ��� ����� ":7777"
    		gameServer = "Amazing MZ"
    		srv = 1
	--[[elseif ��� ��� if ���� ��� ��� � ������ else � end]]	elseif sampGetCurrentServerAddress() == "" then -- �� ������� ��� � ��� ��� �������
    		gameServer = ""
    		srv = 2
		else
			print("������ �� �������, ������ ������� ���������")
    		sampAddChatMessage("[SFA]{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
    		sampAddChatMessage("[SFA]{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
    		thisScript():unload()
    		return
    	end
    	print("�������� ��������, ������: "..tostring(gameServer))

 if jstart == 1 then-- ���������� ��������� � ������� ���
    sampAddChatMessage("{ffffff}* [SFA{ffffff}]: {00BFFF}SFA ��� ������������� Amazing ZM", -1)
    sampAddChatMessage("{ffffff}* [SFA{ffffff}]: {00BFFF}������ ������� �������. - [/sfa].", -1)
	sampAddChatMessage('{ffffff}* [SFA{ffffff}]: {00BFFF}������� ������: '..thisScript().version)
 elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055} SFA{ffffff}]: {949055}������� ������ : '..thisScript().version)
  end
  --------------------------�������--------------------------
sampRegisterChatCommand("sfa", window)
     ---------------------������ � �������-------------------
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
---------------------��������� ��� ���������-------------------
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
    ------------- ����� ������� ��� ���� ���� �����..
imgui.Process = window1.v or window2.v or  mainwindow.v

end
end

function otvetda(param) -- Param: ������� ������� ��������� �������� (���� �� ����� param �� �������� ���� ��� �� �����)
    id = tonumber(param) -- �������� ���������� � ���������� id..
    if param then
        if id ~= nil then -- if id ~= nil ��� ��� "���� �������� �� ������ �� ����� �� ��� � �����"
                    sampSendChat('/ans '..id..' ��.')
                 else -- ���� �������� ���� ������� ����� ����...
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "��".[/da id].', -1)
        end
    end
end

    function otvetnet(param)
            id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' ���.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "���". [/net id].', -1)
        end
    end
end

function otvetpri(param)
    id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' �������� ���� �� Amazing ZM :)')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "�������� ����". [/pri id].', -1)
        end
    end
end

function otvetspect(param)
id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' ����� �������� �� ����� ������.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "�����". [/spect id]', -1)
        end
    end
end

function otvetprest(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
                    sampSendChat('/ans '..id..'  ��� ��������� ��������, ��� ����� ��������� ����� ����� �� 6 ������.')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ��� �������� �������. [/prest id]', -1) -- -1 ��� ���� � �������� ������
        end
    end
end
function otvetukrit(param)
    id = tonumber(param)
    if param then
        if id ~= nil then
                    sampSendChat('/ans '..id..' � ��� ���� 15 ������, ����� ����� �������!')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "� ������". [/ukrit id]', -1)
        end
    end
end
function otvetchist(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
    sampSendChat('/ans '..id..' �� ������� ��������� �� ������� ������.')
   else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "��������� �� �������". [/chist id]', -1)
      end
     end
end

function otvetinfrol(param)
  id = tonumber(param)
  if param then
    if id ~= nil then
    sampSendChat('/ans '..id..' ��� ���������� � ������� - /roll. ')
   else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "/roll". [/infroll id]', -1)
      end
     end
end

function otvetnakazan(param)
	if param then
		if id ~= nil then
			sampSendChat('/ans '..id..' ����� �������. �������� ���� :) ')
		else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "����� �������". [/nakazan id]', -1)
		end
	end
end

function otvetinfclass(param)
	 id = tonumber(param)
	 if param then
		 if id ~= nil then
                sampSendChat('/ans '..id..' ������ ����� �������� ��-������. ��������� ����� ������(/class) - 50.000. ')
                 else
            sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� �� ������ �� �������. [/infclass id]', -1)
        end
    end
end

function otvetforum(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' �������� ������ �� �����.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "������ �� �����". [/forum id]', -1)
		end
    end
end

function tut(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' �� ���? ��������� ����, ����� �� ������ �������.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "��������� ����". [/tut id]', -1)
		end
    end
end

function prohod(param)
	id = tonumber(param)
    if param then
        if id ~= nil then
				sampSendChat('/ans '..id..' ��������� �����.')
								  		 else
			sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ����� "��������� �����". [/prohod id]', -1)
		end
    end
end

function bag(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' ������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� ������ [/bag id]', -1)
		end
	end
end

function cheat(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 ���.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ��� �� ������������� ����� [/cheat id]', -1)
		end
	end
end

function teampvp(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..'  ��������� ���� �� ���.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� ��������� ���� �� ��� [/teampvp id]', -1)
		end
	end
end

function upominul(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 360 ���������� ������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ��� �� ���������� ������ [/upom id]', -1)
		end
	end
end

function heafk(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' ��� ��� ����� (esc).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������� �� ��� ��� ����� [/afk id]', -1)
		end
	end
end

function caps(param)
	id = tonumber(param)
	if param then
		if id ~= nil then
			sampSendChat('/mute '..id..' 15 ������� �������(caps). ')
		end
	end
end

function tksurvive(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' �� (Survive).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������� �� �� (��������) [/tks id]', -1)
		end
	end
end

function tkzombie(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' �� (Zombie).')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� �� ����� [/tkz id]', -1)
		end
	end
end

function tkrpg(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' �� � ���.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� �� � ��� [/tkrpg id]', -1)
		end
	end
end

function pomeha(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' ������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������� �� ������ [/pomeha id]', -1)
		end
	end
end

function reklama(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 �������. ')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: �������� ��������� ���������� [/rekl id]', -1)
		end
	end
end

function neproh(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' ������������� �����.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������� �� ������������� ����� [/neproh id]', -1)
		end
	end
end

function tkgrenade(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' �� ��������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� �� �������� [/tkgrenade id]', -1)
		end
	end
end

function begun(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/kick '..id..' ��� �� �����.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������� �� ��� �� ����� [/beg id]', -1)
		end
	end
end

function offtopinreport(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 30 ������ � ������. ')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ������ � ������ [/offtop id]', -1)
		end
	end
end

function oskorbil(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 40 ����������� �������')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ���. ������� [/osk id]', -1)
		end
	end
end

function capsosk(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 55 ���. ������� + ����.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ���� + ���. [/capsosk id]', -1)
		end
	end
end

function flooder(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 Flood.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ���� [/flo id]', -1)
		end
	end
end

function oskproject(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/ban '..id..' 15 ����������� �������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ��� �� ����������� ������� [/oskproject id]', -1)
		end
	end
end

function adminaosknyl(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 90 ����������� �������������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ����������� ������������� [/admosk id]', -1)
		end
	end
end

function dlinner(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 ���������� ����.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ���������� ���� [/udlin id]', -1)
		end
	end
end

function pustoi(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 30 ������ ���������.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ������ ��������� [/pust id]', -1)
		end
	end
end

function jalobnik_chat(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/mute '..id..' 15 ������ � ���.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ���� ��� �� ������ � ��� [/jbc id]', -1)
		end
	end
end

function zapret(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/warn '..id..' ��������� �����.')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}SFA]{ffffff}: ������ ���� �� ��������� ����� [/zapret id]', -1)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------MENU--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function apply_custom_style() --[[����� �����.. ����� ���������, �� �����
    ��������� � ������.. �� ����� �� ����������� � C++ ������ ���� ����� ��������� � lua (��� ���)]]
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
if mainwindow.v then window1.v = false window2.v = false -- ���� ������� ����� ���� ���������.. ���� ���� ����������� ��� ������ �������
imgui.SetNextWindowSize(imgui.ImVec2(720, 555), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'������� ���� |SFA| �����������: Rickot.', mainwindow, img_state) --imgui.WindowFlags.NoResize)
		imgui.BeginChild('#MM', imgui.ImVec2(720,500), true)
		local nakaz = [[���������� ����:
/flo - ����
/offtop - ������ � ������
/osk - ����������� �������
/admosk - ����������� �������������
/upom - ���������� ������
/jbc  - ������ � ���.
/udlin - ��������� ����.
/pust - ������ ���������.
/caps - ����.
/capsosk - ���� + ���.

��� ������:
/tks - Team Kill (��������/Survivor)
/neproh - ������������� �����.
/beg - ��� �� �����.
/afk - ��� ��� �����.
/pomeha - ������

��������������:
/bag - ������.
/zapret - ��������� �����.
/wafk - ��� � ���.
/teampvp - ��������� ���� �� ���.
/tkz - Team Kill (�����/Zombie)
/tkgrenade - �� ��������.
/tkrpg - �� � ���.

���������� ��������:
/rekl - ������� ������ �������.
/oskproject - ����������� �������.
/cheat - ������������� ��� ��������]]
		imgui.Text(u8(nakaz))
		imgui.Text('---------------------------------------------------------------')
local otv = [[������ �� �������:
/da -  ��.
/net -   ���.
/pri -   �������� ���� :)
/spect -   ������� �� ����� ������.
/nakazan - ����� �������.
/chist -   �� �������� ��������� �� ������� ������.
/ukrit -   ������ ������ � �������.
/prohod - ��������� �����.
/tut - ��������� ����.
/forum -   �������� ������ �� �����.
/prest -   ��� ��������� ��������.
/infroll -   ���������� � �������.
/infclass -    ��������� �������� � �������.
]]
	imgui.Text(u8(otv))

  imgui.EndChild()
  imgui.End()
end
end
end

			function window() -- ������� ������ �������� ����..
			mainwindow.v = not mainwindow.v
			end

---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------������ �������-------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end



--------- �������������� -------------


function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      sampAddChatMessage((prefix..'���������� ���������!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': ���������� �� ���������.')
            end
          end
        else
          print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
