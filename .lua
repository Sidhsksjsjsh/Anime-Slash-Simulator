local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
local workspace = game:GetService("Workspace")

--Workspace.Game.Stages.Naruto.Duel.Naruto.Miscs.Prompt.ProximityPrompt

local function workspaceChildren(str,func)
for _,v in pairs(str:GetChildren()) do
      func(v)
end
end

local function workspaceDesc(str,func)
for _,v in pairs(str:GetDescendants()) do
      func(v)
end
end

local function EquipBest()
game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["ChampsService"]["RF"]["EquipBest"]:InvokeServer()
end

local function Craft()
game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["ChampsService"]["RF"]["UpgradeAll"]:InvokeServer()
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Duel",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Sword",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local swordHandle = {}
local eggHandle = {}
local duelCharHandle = {}
local champsHandle = {}
local worldHandle = {}

OrionLib:AddTable(game:GetService("ReplicatedStorage")["Assets"]["Swords"],swordHandle)
OrionLib:AddTable(game:GetService("ReplicatedStorage")["Assets"]["Eggs"],eggHandle)
OrionLib:AddTable(game:GetService("ReplicatedStorage")["Assets"]["DuelCharacter"],duelCharHandle)
OrionLib:AddTable(game:GetService("ReplicatedStorage")["Assets"]["Champs"],champsHandle)
OrionLib:AddTable(workspace["Game"]["Stages"],worldHandle)

T2:AddDropdown({
Name = "Select World",
Default = worldHandle[1],
Options = worldHandle,
Callback = function(Value)
_G.DuelWorld = Value
end    
})

T5:AddDropdown({
Name = "Select World",
Default = worldHandle[1],
Options = worldHandle,
Callback = function(Value)
_G._World = Value
end    
})

T2:AddDropdown({
Name = "Select Duelist",
Default = duelCharHandle[1],
Options = duelCharHandle,
Callback = function(Value)
_G.Duelist = Value
end    
})

T3:AddDropdown({
Name = "Select Egg",
Default = eggHandle[1],
Options = eggHandle,
Callback = function(Value)
_G.Eggs = Value
end    
})

T4:AddDropdown({
Name = "Select Swords",
Default = swordHandle[1],
Options = swordHandle,
Callback = function(Value)
_G.Swords = Value
end    
})

T4:AddButton({
Name = "Equip Sword",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["EquipSword"]:InvokeServer(_G.Swords)
  end    
})

T5:AddButton({
Name = "Teleport",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["TeleportService"]["RF"]["RequestTeleport"]:InvokeServer(_G._World)
  end    
})

T3:AddToggle({
Name = "Auto Hatch",
Default = false,
Callback = function(Value)
_G.ht = Value
      while wait() do
        if _G.ht == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["EggService"]["RF"]["Hatch"]:InvokeServer(_G.Eggs,{})
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["EggService"]["RF"]["FinishedAnimation"]:InvokeServer()
      end
end    
})

T3:AddToggle({
Name = "Equip Best",
Default = false,
Callback = function(Value)
_G.eb = Value
      while wait() do
        if _G.eb == false then break end
        EquipBest()
      end
end    
})

T3:AddToggle({
Name = "Craft",
Default = false,
Callback = function(Value)
_G.crf = Value
      while wait() do
        if _G.crf == false then break end
        Craft()
      end
end    
})

T2:AddSlider({
  Name = "Duel Cooldown",
  Min = 0,
  Max = 60,
  Default = 1.5,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Cooldown",
  Callback = function(Value)
     _G._duel_cd = Value
  end    
})

T2:AddToggle({
Name = "Auto Duel",
Default = false,
Callback = function(Value)
_G.d = Value
      while wait(_G._duel_cd) do
        if _G.d == false then break end
        workspaceDesc(workspace["Game"]["Stages"][_G.DuelWorld]["Duel"][_G.Duelist],function(v)
            if v:IsA("ProximityPrompt") then
                  fireproximityprompt(v)
            end
       end)
      end
end    
})

T2:AddToggle({
Name = "Auto Click",
Default = false,
Callback = function(Value)
_G.Click2 = Value
      while wait() do
        if _G.Click2 == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["DuelService"]["RF"]["Attack"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Auto Click",
Default = false,
Callback = function(Value)
_G.Click = Value
      while wait() do
        if _G.Click == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SwordService"]["RF"]["Attack"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Auto Spin",
Default = false,
Callback = function(Value)
_G.s = Value
      while wait() do
        if _G.s == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["SpinWheelService"]["RF"]["TrySpin"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(Value)
_G.r = Value
      while wait() do
        if _G.r == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["RebirthService"]["RF"]["Rebirth"]:InvokeServer()
      end
end    
})

T1:AddToggle({
Name = "Auto Claim Gifts",
Default = false,
Callback = function(Value)
_G.gs = Value
      while wait() do
        if _G.gs == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(1)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(2)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(3)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(4)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(5)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(6)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(7)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(8)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(9)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(10)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(11)
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.5.1")["knit"]["Services"]["GiftService"]["RF"]["Claim"]:InvokeServer(12)
      end
end    
})

workspaceDesc(workspace,function(int)
      if int:IsA("ProximityPrompt") then
            int.HoldDuration = 0
            int.ActionText = "TurtleOS V1.0.0"
      end
end)
