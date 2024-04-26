-- credit to guardian v2 https://scriptblox.com/script/Universal-Script-Guardian-V2-9148
if not game:IsLoaded() then game.Loaded:Wait() end
local options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
local Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="MADE BY:",
    Text="galactichypernova",
    Button1="Okay!",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost,
    httpGetAsync,
    (typeof(syn_backup)=='table' and syn_backup.request)
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
local savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[game.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest, ChatMain, MessagePostedEvent
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
    SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    ChatMain=ChatScript:WaitForChild("ChatMain")
	for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
	    if typeof(Event) == "Instance" then
	        MessagePostedEvent = Event
	    end
	end

else
	ChatScript = cGame.CoreGui.RobloxGui.Modules.Server.ClientChat.ChatScript
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6,
	["CopyAuthCookieFromBrowserToEngine"]=nil,
	["ReturnToJavaScript"]=nil,
	["EmitHybridEvent"]=nil
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil,
        ["PromptThirdPartyPurchase"]=nil,
        ["PromptRobloxPurchase"]=nil,
        ["PromptNativePurchaseWithLocalPlayer"]=nil,
        ["PromptNativePurchase"]=nil,
        ["PromptCollectiblesPurchase"]=nil,
        ["PrepareCollectiblesPurchase"]=nil,
        ["ReportAssetSale"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]="",
	["Call"]=3,
	["MakeRequest"]=nil,
	["Subscribe"]=nil
    },
    ["HttpService"]={
        ["RequestInternal"]=1,
	["GetSecret"]=nil
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2,
	["HttpGetAsync"]="",
	["HttpPostAsync"]=""
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    },
    ["OpenCloudService"]={
	["HttpRequestAsync"]={},
	["InvokeAsync"]={}
    },
    ["ScriptContext"]={
	["AddCoreScriptLocal"]=nil
    },
    ["VideoCaptureService"]={
        ["GetCameraDevices"]={}
    },
    ["CaptureService"]={
	["DeleteCapture"]=nil,
	["PromptSaveCapturesToGallery"]=nil,
	["PromptShareCapture"]=nil,
	["RetrieveCaptures"]={},
	["SaveCaptureToExternalStorage"]=nil,
	["SaveScreenshotCapture"]=nil
    },
    ["SafetyService"]={
    	["TakeScreenshot"]=0
    },
    ["LoginService"]={
	["PromptLogin"]=nil,
	["Logout"]=nil
    },
    ["PermissionsService"]={
	["SetPermissions"]=nil
    }
}
local c
local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				pcall(function()
					local old7
					old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
					    if options.MaliciousNamecalls.Enabled then
	                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
	                        return not checkcaller() and old7(...)or nil
	                    end
	                    return old7(...)
					end)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		if not options.ChatBan.Enabled then
			return old13(...)
		end
		if self==MessagePostedEvent then
			return options.Output("MessagePosted usage was attempted. Attempt denied.")
		end
		return old13(...)
	end)
	if ChatBar then
		old12=hookfunction(ChatBar.CaptureFocus,function(...)
			if options.ChatBan.Enabled and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not c then
						StarterGui:SetCore("SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
							Button1="Okay!",
							Duration=15
						})
						StarterGui:SetCore("SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
						setclipboard(getcallingscript():GetFullName())
							StarterGui:SetCore("SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						c="e"
					end
				end
				return
			end
			return old12(...)
		end)
	end
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		if options.GUIDetection and args[1]==Content and typeof(args[2])=="table" then
			return options.Output("GUI detection attempted. Attempt denied.")
		end
		return old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,500)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		if options.AntiKick and args[1]==LocalPlayer then
			return options.Output("Attempt to kick player denied.")
		end
		return old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
		if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
			return options.Output("Script attempted to access the bank. Attempt denied.")
		end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			pcall(function()
				local old6
				old6=hookfunction(v,function(...)
					local args={...}
					if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
						options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
						if options.AntiLog.Payback and not is_sirhurt_closure then
							args[1].Method="DELETE"
						else
							args[1].Url="https://google.com"
						end
						return old6(unpack(args))
					end
					if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
						options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
						return 
					end 
					if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
						options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
						return 
					end
					return old6(...)
				end)
			end)
		end
	end
        pcall(function()
	local oldHttpPost
	oldHttpPost = hookfunction(game.HttpPost, function (...)
		local args = {...}
		options.Output("HttpPost request attempted. Attempt denied.")
		return
	end)
        end)
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
local a
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...) or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
				options.Output("Script attempted to access the bank. Attempt denied.")
				return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			local outerProp = rawget(savedProps,self)
			local prop = rawget(outerProp,b)
			if not checkcaller() and outerProp and prop and rawget(options,"BasicAntiCheatBypass") then
				return prop
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end
if options.Error then
    for i,v in next,getconnections(cGame:GetService("ScriptContext").Error) do
	v:Disable()
    end
end
if options.Message then
    for i,v in next,getconnections(cGame:GetService("LogService").MessageOut) do
	v:Disable()
    end
end
if options.AntiIdle then
    for i,v in next,getconnections(LocalPlayer.Idled) do
	v:Disable()
    end
end
if not game:IsLoaded() then game.Loaded:Wait() end
local options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
local Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="MADE BY:",
    Text="galactichypernova",
    Button1="Okay!",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost,
    httpGetAsync,
    (typeof(syn_backup)=='table' and syn_backup.request)
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
local savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[game.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest, ChatMain, MessagePostedEvent
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
    SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    ChatMain=ChatScript:WaitForChild("ChatMain")
	for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
	    if typeof(Event) == "Instance" then
	        MessagePostedEvent = Event
	    end
	end

else
	ChatScript = cGame.CoreGui.RobloxGui.Modules.Server.ClientChat.ChatScript
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6,
	["CopyAuthCookieFromBrowserToEngine"]=nil,
	["ReturnToJavaScript"]=nil,
	["EmitHybridEvent"]=nil
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil,
        ["PromptThirdPartyPurchase"]=nil,
        ["PromptRobloxPurchase"]=nil,
        ["PromptNativePurchaseWithLocalPlayer"]=nil,
        ["PromptNativePurchase"]=nil,
        ["PromptCollectiblesPurchase"]=nil,
        ["PrepareCollectiblesPurchase"]=nil,
        ["ReportAssetSale"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]="",
	["Call"]=3,
	["MakeRequest"]=nil,
	["Subscribe"]=nil
    },
    ["HttpService"]={
        ["RequestInternal"]=1,
	["GetSecret"]=nil
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2,
	["HttpGetAsync"]="",
	["HttpPostAsync"]=""
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    },
    ["OpenCloudService"]={
	["HttpRequestAsync"]={},
	["InvokeAsync"]={}
    },
    ["ScriptContext"]={
	["AddCoreScriptLocal"]=nil
    },
    ["VideoCaptureService"]={
        ["GetCameraDevices"]={}
    },
    ["CaptureService"]={
	["DeleteCapture"]=nil,
	["PromptSaveCapturesToGallery"]=nil,
	["PromptShareCapture"]=nil,
	["RetrieveCaptures"]={},
	["SaveCaptureToExternalStorage"]=nil,
	["SaveScreenshotCapture"]=nil
    },
    ["SafetyService"]={
    	["TakeScreenshot"]=0
    },
    ["LoginService"]={
	["PromptLogin"]=nil,
	["Logout"]=nil
    },
    ["PermissionsService"]={
	["SetPermissions"]=nil
    }
}
local c
local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				pcall(function()
					local old7
					old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
					    if options.MaliciousNamecalls.Enabled then
	                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
	                        return not checkcaller() and old7(...)or nil
	                    end
	                    return old7(...)
					end)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		return not options.ChatBan.Enabled and old13(...) or self==MessagePostedEvent and options.Output("MessagePosted usage was attempted. Attempt denied.") or old13(...)
	end)
	if ChatBar then
		old12=hookfunction(ChatBar.CaptureFocus,function(...)
			if options.ChatBan.Enabled and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not c then
						StarterGui:SetCore("SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
							Button1="Okay!",
							Duration=15
						})
						StarterGui:SetCore("SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
						setclipboard(getcallingscript():GetFullName())
							StarterGui:SetCore("SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						c="e"
					end
				end
				return
			end
			return old12(...)
		end)
	end
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		return options.GUIDetection and (args[1]==Content and typeof(args[2])=="table" and options.Output("GUI detection attempted. Attempt denied.")) or old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,550)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		return options.AntiKick and (args[1]==LocalPlayer and options.Output("Attempt to kick player denied.")) or old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
		if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
			return options.Output("Script attempted to access the bank. Attempt denied.")
		end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			pcall(function()
				local old6
				old6=hookfunction(v,function(...)
					local args={...}
					if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
						options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
						if options.AntiLog.Payback and not is_sirhurt_closure then
							args[1].Method="DELETE"
						else
							args[1].Url="https://google.com"
						end
						return old6(unpack(args))
					end
					if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
						options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
						return 
					end 
					if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
						options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
						return 
					end
					return old6(...)
				end)
			end)
		end
	end
        pcall(function()
	local oldHttpPost
	oldHttpPost = hookfunction(game.HttpPost, function (...)
		local args = {...}
		options.Output("HttpPost request attempted. Attempt denied.")
		return
	end)
        end)
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
local a
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...)or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
				options.Output("Script attempted to access the bank. Attempt denied.")
				return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			if not checkcaller() and rawget(savedProps,self) and rawget(rawget(savedProps,self),b) and rawget(options,"BasicAntiCheatBypass") then
				return rawget(rawget(savedProps,self),b)
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end


if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().Guardian then return end
getgenv().options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
getgenv().Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="By galactichypernova",
    Text="With love <3",
    Button1="<3",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
getgenv().savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[cGame.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
end
ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local ChatMain=ChatScript:WaitForChild("ChatMain")
local MessagePostedEvent
for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
    if typeof(Event) == "Instance" then
        MessagePostedEvent = Event
    end
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]=2
    },
    ["HttpService"]={
        ["RequestInternal"]=1
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    }
}
if cGame:GetService("VideoCaptureService") then
    namecall["VideoCaptureService"]={
        ["GetCameraDevices"]=1
    }
end

local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				local old7
				old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
				    if options.MaliciousNamecalls.Enabled then
                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                        return not checkcaller() and old7(...)or nil
                    end
                    return old7(...)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		return not options.ChatBan.Enabled and old13(...) or self==MessagePostedEvent and options.Output("MessagePosted usage was attempted. Attempt denied.") or old13(...)
	end)
	old12=hookfunction(ChatBar.CaptureFocus,function(...)
		if options.ChatBan.Enabled and options.ChatBan.Slash then
			options.Output("Chat focus capture as local player was attempted. Attempt denied.")
			if getcallingscript()~=ChatScript then
				if not rawget(getgenv(),"c") then
					StarterGui:SetCore("SendNotification",{
						Title="WARNING!",
						Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
						Button1="Okay!",
						Duration=15
					})
					StarterGui:SetCore("SendNotification",{
						Title="What to do",
						Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
						Button1="Okay!",
						Duration=15
					})
					if getcallingscript() then
					setclipboard(getcallingscript():GetFullName())
						StarterGui:SetCore("SendNotification",{
							Title="Copied to clipboard",
							Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
							Button1="Okay!",
							Duration=15
						})
					end
					rawset(getgenv(),"c","e")
				end
			end
			return
		end
		return old12(...)
	end)
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		return options.GUIDetection and (args[1]==Content and typeof(args[2])=="table" and options.Output("GUI detection attempted. Attempt denied.")) or old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,550)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		return options.AntiKick and (args[1]==LocalPlayer and options.Output("Attempt to kick player denied.")) or old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
                if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
                        return options.Output("Script attempted to access the bank. Attempt denied.")
                end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			local old6
			old6=hookfunction(v,function(...)
				local args={...}
				if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
					options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
					if options.AntiLog.Payback and not is_sirhurt_closure then
						args[1].Method="DELETE"
					else
						args[1].Url="https://google.com"
					end
					return old6(unpack(args))
				end
				if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
					options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
					return 
				end
				if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
					options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
					return 
				end
				return old6(...)
			end)
		end
	end
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not getgenv().a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						getgenv().a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...)or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
                                options.Output("Script attempted to access the bank. Attempt denied.")
                                return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			if not checkcaller() and rawget(savedProps,self) and rawget(rawget(savedProps,self),b) and rawget(options,"BasicAntiCheatBypass") then
				return rawget(rawget(savedProps,self),b)
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end
if options.Error then
    for i,v in next,getconnections(cGame:GetService("ScriptContext").Error) do
	v:Disable()
    end
end
if options.Message then
    for i,v in next,getconnections(cGame:GetService("LogService").MessageOut) do
	v:Disable()
    end
end
if options.AntiIdle then
    for i,v in next,getconnections(LocalPlayer.Idled) do
	v:Disable()
    end
end
