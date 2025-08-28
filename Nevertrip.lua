local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()

local TIME_SELECTED = {
	["30 Sec"] = 30,
	["1 Min"] = 60,      -- 1 минута = 60 секунд
	["2 Min"] = 120,     -- 2 минуты = 120 секунд
	["3 Min"] = 180,     -- 3 минуты = 180 секунд
	["5 Min"] = 300,     -- 5 минут = 300 секунд
	["10 Min"] = 600,    -- 10 минут = 600 секунд
	["15 Min"] = 900     -- 15 минут = 900 секунд
}

local isEnabled = false

local Window = Library:CreateWindow{
	Title = `Celestum X`,
	SubTitle = "RECODE",
	TabWidth = 160,
	Size = UDim2.fromScale(0.45, 0.7),
	Resize = false, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
	MinSize = Vector2.new(470, 380),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Tomorrow Night Blue",
	MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
}

local SELECTED_TIME = 30

-- Fluent Renewed provides ALL 1544 Lucide 0.469.0 https://lucide.dev/icons/ Icons and ALL 9072 Phosphor 2.1.0 https://phosphoricons.com/ Icons for the tabs, icons are optional
local Tabs = {
	Main = Window:CreateTab{
		Title = "Main",
		Icon = "phosphor-users-bold"
	},
	Visuals = Window:CreateTab{
		Title = "Visuals",
		Icon = "cloud"
	},
	Player = Window:CreateTab{
		Title = "Player",
		Icon = "user"
	},
	Settings = Window:CreateTab{
		Title = "Settings",
		Icon = "settings"
	}
}

local Options = Library.Options

Library:Notify{
	Title = "Welcome in Celestum X",
	Content = "More functions.",
	SubContent = "Good luck", -- Optional
	Duration = 5 -- Set to nil to make the notification not disappear
}

local AutoCollectMoney = Tabs.Main:AddSection("Auto Collect Money")

-- Таблица соответствия времени в секундах
local TIME_SELECTED = {
	["30 Sec"] = 30,
	["1 Min"] = 60,
	["2 Min"] = 120,
	["3 Min"] = 180,
	["5 Min"] = 300,
	["10 Min"] = 600,
	["15 Min"] = 900
}

-- Переменная для хранения выбранного времени
local SELECTED_TIME = 60 -- По умолчанию 1 минута


-- Теперь создаем toggle
local AutoCollect = Tabs.Main:CreateToggle("AutoCollectToggle", {
	Title = "Auto Collect Money", 
	Default = false 
})
-- Создаем dropdown ПЕРВЫМ, чтобы TIME_SELECTED был определен
local Dropdown = Tabs.Main:CreateDropdown("Dropdown", {
	Title = "He will collect the money every:",
	Values = {"30 Sec", "1 Min", "2 Min", "3 Min", "5 Min", "10 Min", "15 Min"},
	Multi = false,
	Default = 1,
})

-- Обработчик изменения dropdown
Dropdown:OnChanged(function(Value)
	SELECTED_TIME = TIME_SELECTED[Value] or 60
	print("Время сбора установлено: " .. Value .. " (" .. SELECTED_TIME .. " секунд)")
end)

AutoCollect:OnChanged(function(Value)
	if Value then
		task.spawn(function()
			local Plots = game.Workspace:WaitForChild("Plots")
			local Plr = game.Players.LocalPlayer

			while AutoCollect.Value do
				local Chr = Plr.Character
				if not Chr then
					Chr = Plr.CharacterAdded:Wait()
				end

				local Humanoid = Chr:WaitForChild("Humanoid")
				local RootPart = Chr:WaitForChild("HumanoidRootPart")

				local function Collect()
					local pointsVisited = 0

					for _, Plot in Plots:GetChildren() do
						if not AutoCollect.Value then break end

						local text = Plot:FindFirstChild("PlotSign")
						if text then
							local yourBase = text:FindFirstChild("YourBase")
							if yourBase and yourBase.Enabled == true then
								local AnimalPodiums = Plot:FindFirstChild("AnimalPodiums")
								if AnimalPodiums then

									local points = {
										AnimalPodiums:FindFirstChild("1"),
										AnimalPodiums:FindFirstChild("5"), 
										AnimalPodiums:FindFirstChild("6"),
										AnimalPodiums:FindFirstChild("10")
									}

									for _, point in ipairs(points) do
										if not AutoCollect.Value then break end
										if not point then continue end

										local claim = point:FindFirstChild("Claim")
										if claim then
											local hitbox = claim:FindFirstChild("Hitbox")
											if hitbox then
												local targetPos = hitbox:GetPivot().Position
												local currentY = RootPart.Position.Y
												local flatTargetPos = Vector3.new(targetPos.X, currentY, targetPos.Z)

												Humanoid:MoveTo(flatTargetPos)
												pointsVisited += 1

												-- Ждем достижения точки или таймаут
												local reached = Humanoid.MoveToFinished:Wait(5)
												if not reached then
													wait(1)
												else
													wait(0.5)
												end

												-- Если прошли все 4 точки, возвращаем true
												if pointsVisited >= 4 then
													return true
												end
											end
										end
									end
								end
							end
						end
					end
					return false
				end

				local completedAllPoints = Collect()

				if completedAllPoints then
					print("Все 4 точки пройдены. Ожидание " .. SELECTED_TIME .. " секунд...")
					wait(SELECTED_TIME)
				else
					wait(2)
				end
			end
		end)
	else
		print("Auto Collect выключен")
	end
end) 

local AutoClose = Tabs.Main:AddSection("Auto Close Base")

local AutoCloseT = Tabs.Visuals:CreateToggle("AutoCloseToggle", {
	Title = "Auto Close Base",
	Default = false 
})

AutoCloseT:OnChanged(function()
	local Proximity = game:GetService("ProximityPromptService")
	local Player = game:GetService("Players").LocalPlayer
	local Chr = Player.Character
	local HumRootPart = Chr:WaitForChild("HumanoidRootPart")

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Workspace = game:GetService("Workspace")
	local UserInputService = game:GetService("UserInputService")

	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	local function findTaser()
		-- Ищем тазер в инвентаре
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			for _, tool in ipairs(backpack:GetChildren()) do
				if tool:IsA("Tool") and (tool.Name:lower():find("taser") or tool.Name:lower():find("stun") or tool.Name:lower():find("gun")) then
					return tool
				end
			end
		end

		-- Ищем в руках
		local character = player.Character
		if character then
			for _, tool in ipairs(character:GetChildren()) do
				if tool:IsA("Tool") and (tool.Name:lower():find("taser") or tool.Name:lower():find("stun") or tool.Name:lower():find("gun")) then
					return tool
				end
			end
		end

		return nil
	end

	local function autoTaser()
		local taser = findTaser()
		if taser then
			-- Экипируем если не в руках
			if taser.Parent ~= player.Character then
				taser.Parent = player.Character
			end
		end
	end



	while wait(0.1)  do
		if Options.AutoCloseToggle.Value == true then
			for _, Plot in workspace.Plots:GetChildren() do
				local Owner = Plot:WaitForChild("PlotSign").YourBase
				if Owner.Enabled == true and Plot.Purchases.PlotBlock.Main.BillboardGui.Locked.Enabled == false then
					autoTaser()
					local args = {
						Player.Character:WaitForChild("UpperTorso")
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/UseItem"):FireServer(unpack(args))
					HumRootPart.CFrame = CFrame.new(Plot.Purchases.PlotBlock.Hitbox.CFrame)
				end
			end
		end
	end
end)


local WHack = Tabs.Visuals:AddSection("WallHack")


local WallHack = Tabs.Visuals:CreateToggle("WallHackToggle", {
	Title = "WallHack",
	Default = false 
})

WallHack:OnChanged(function()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	-- Функция добавления Highlight к игроку
	local function addHighlightToPlayer(targetPlayer)
		if targetPlayer.Character then
			local oldHighlight = targetPlayer.Character:FindFirstChildOfClass("Highlight")
			if oldHighlight then
				oldHighlight:Destroy()
			end

			local highlight = Instance.new("Highlight")
			highlight.FillColor = Color3.fromRGB(255, 0, 0)
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Parent = targetPlayer.Character
		end
	end

	-- Функция удаления Highlight у игрока
	local function removeHighlightFromPlayer(targetPlayer)
		if targetPlayer.Character then
			local highlight = targetPlayer.Character:FindFirstChildOfClass("Highlight")
			if highlight then
				highlight:Destroy()
			end
		end
	end

	-- Функция удаления всех хайлайтов
	local function removeAllHighlights()
		for _, targetPlayer in pairs(Players:GetPlayers()) do
			if targetPlayer ~= player then
				removeHighlightFromPlayer(targetPlayer)
			end
		end
	end

	if Options.WallHackToggle.Value == true then
		-- Включаем хайлайты
		for _, targetPlayer in pairs(Players:GetPlayers()) do
			if targetPlayer ~= player then
				addHighlightToPlayer(targetPlayer)

				targetPlayer.CharacterAdded:Connect(function(character)
					character:WaitForChild("Humanoid")
					addHighlightToPlayer(targetPlayer)
				end)
			end
		end
	else
		-- Выключаем хайлайты
		removeAllHighlights()
	end
end)

local ESP = Tabs.Visuals:AddSection("ESP")

local ESPPlayers = Tabs.Visuals:CreateToggle("ESPPlayersToggle", {Title = "Players Box", Default = false })

ESPPlayers:OnChanged(function()
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local pld = Players.LocalPlayer 

	-- Таблица для хранения ESP объектов
	local espObjects = {}

	local function createESP(player)
		-- Не создаем ESP для самого себя
		if player == pld then return end
		if not player.Character then return end

		-- Проверяем, не создан ли уже ESP для этого игрока
		if espObjects[player] then return end

		local character = player.Character
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then return end

		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "PlayerESP"
		billboardGui.Adornee = humanoidRootPart
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 1.000
		billboardGui.Size = UDim2.new(4, 0, 7, 0)
		billboardGui.Parent = humanoidRootPart

		local Frame = Instance.new("Frame")
		Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
		Frame.BackgroundTransparency = 0.700
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.Parent = billboardGui

		local Corner = Instance.new("UIStroke")
		Corner.Color = Color3.new(0, 255,255)
		Corner.Thickness = 1.5
		Corner.Parent = Frame

		-- Сохраняем ссылку на ESP объект
		espObjects[player] = billboardGui

		-- Обработчик удаления персонажа
		local function characterRemoved()
			if espObjects[player] then
				espObjects[player]:Destroy()
				espObjects[player] = nil
			end
		end

		character.AncestryChanged:Connect(function(_, parent)
			if not parent then
				characterRemoved()
			end
		end)

		character:GetPropertyChangedSignal("Parent"):Connect(function()
			if not character.Parent then
				characterRemoved()
			end
		end)
	end

	local function deleteESP(player)
		if espObjects[player] then
			espObjects[player]:Destroy()
			espObjects[player] = nil
		end
	end

	local function deleteAllESP()
		for player, espObject in pairs(espObjects) do
			espObject:Destroy()
		end
		espObjects = {}
	end

	local function onPlayerAdded(player)
		player.CharacterAdded:Connect(function(character)
			if Options and Options.ESPPlayersToggle and Options.ESPPlayersToggle.Value == true then
				createESP(player)
			end
		end)

		if player.Character and Options and Options.ESPPlayersToggle and Options.ESPPlayersToggle.Value == true then
			createESP(player)
		end
	end

	local function onPlayerRemoving(player)
		deleteESP(player)
	end

	-- Инициализация для существующих игроков
	for _, player in ipairs(Players:GetPlayers()) do
		onPlayerAdded(player)
	end

	-- Обработка новых игроков
	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)

	-- Основной цикл обновления
	RunService.Heartbeat:Connect(function()
		if Options and Options.ESPPlayersToggle then
			if Options.ESPPlayersToggle.Value == true then
				-- Создаем ESP для всех игроков кроме себя
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= pld then
						createESP(player)
					end
				end
			else
				-- Удаляем все ESP
				deleteAllESP()
			end
		end
	end)
end)

local Base = Tabs.Visuals:AddSection("ESP Base")

local MyBase = Tabs.Visuals:CreateToggle("MyBaseToggle", {Title = "Gui State", Default = false })

MyBase:OnChanged(function()
	if Options.MyBaseToggle.Value == true then
		local plots = game.Workspace.Plots
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")

		local localPlayer = Players.LocalPlayer
		local screenGui = nil

		-- Функция создания интерфейса
		local function createGui()
			if screenGui and screenGui.Parent then
				screenGui:Destroy()
			end

			screenGui = Instance.new("ScreenGui")
			local Frame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Lock = Instance.new("TextLabel")
			local Time = Instance.new("TextLabel")
			local stroke = Instance.new("UIStroke")

			--Properties:
			screenGui.Name = "BaseStatusGui"
			screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.ResetOnSpawn = false -- Важно: не удалять при респавне

			Frame.Parent = screenGui
			Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BackgroundTransparency = 0.500
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.449746937, 0, 0.0331674963, 0)
			Frame.Size = UDim2.new(0.115690529, 0, 0.05, 0)

			UICorner.CornerRadius = UDim.new(0.150000006, 0)
			UICorner.Parent = Frame

			Lock.Name = "Lock"
			Lock.Parent = Frame
			Lock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Lock.BackgroundTransparency = 1.000
			Lock.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BorderSizePixel = 0
			Lock.Position = UDim2.new(0, 0, 0.0188679248, 0)
			Lock.Size = UDim2.new(1, 0, 0.566037714, 0)
			Lock.Font = Enum.Font.Nunito
			Lock.TextColor3 = Color3.fromRGB(255, 255, 255)
			Lock.TextScaled = true
			Lock.TextSize = 29.000
			Lock.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Lock.TextWrapped = true

			stroke.Parent = Frame
			stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			stroke.Thickness = 1.5
			stroke.Color = Color3.fromRGB(170, 181, 255)

			Time.Name = "Timer"
			Time.Parent = Frame
			Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Time.BackgroundTransparency = 1.000
			Time.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Time.BorderSizePixel = 0
			Time.Position = UDim2.new(0, 0, 0.584905684, 0)
			Time.Size = UDim2.new(1, 0, 0.415094346, 0)
			Time.Font = Enum.Font.Nunito
			Time.TextColor3 = Color3.fromRGB(255, 255, 255)
			Time.TextScaled = true
			Time.TextSize = 29.000
			Time.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			Time.TextWrapped = true

			return screenGui, Lock, Time
		end

		-- Создаем интерфейс при запуске
		local gui, lockLabel, timeLabel = createGui()
		local sizelocked = UDim2.new(1, 0, 0.566037714, 0)

		local function GuiLocked()
			for _, Plot in plots:GetChildren() do
				local owner = Plot.PlotSign.YourBase
				if owner.Enabled == true then
					local Purchases = Plot.Purchases.PlotBlock.Main.BillboardGui
					local Timer = Purchases.RemainingTime
					local Locked = Purchases.Locked
					if Locked.Visible == true then
						timeLabel.Visible = true
						lockLabel.Size = sizelocked
						lockLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
						lockLabel.Text = Locked.Text
						timeLabel.Text = Timer.Text
					else
						lockLabel.TextColor3 = Color3.fromRGB(255, 247, 0)
						lockLabel.Size = UDim2.new(1, 0, 0.9, 0)
						lockLabel.Text = "Unlocked"
						timeLabel.Visible = false
					end
				end
			end
		end

		-- Обработчик смерти игрока
		local function onCharacterAdded(character)
			-- Проверяем, что переключатель все еще включен
			if Options.MyBaseToggle.Value == true then
				-- Пересоздаем интерфейс
				gui, lockLabel, timeLabel = createGui()
				print("Интерфейс восстановлен после смерти")
			end
		end

		-- Подписываемся на событие появления персонажа
		localPlayer.CharacterAdded:Connect(onCharacterAdded)

		-- Запускаем основной цикл
		local heartbeatConnection = RunService.Heartbeat:Connect(function()
			if gui and gui.Parent then
				GuiLocked()
			end
		end)

		-- Функция для очистки при выключении
		return function()
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
			if gui and gui.Parent then
				gui:Destroy()
			end
		end

	else
		if game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("BaseStatusGui") then
			game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("BaseStatusGui"):Destroy()
		end
	end
	
end)

local BrainRotsESP = Tabs.Visuals:CreateToggle("MyBaseStateToggle", {Title = "ESP Brain Rot", Default = false })

local BrainESP = Tabs.Visuals:CreateDropdown("BrainRotsESPT", {
	Title = "Rarity BrainRot",
	Description = "Select need rarity",
	Values = {
		"Common",
		"Rare", 
		"Epic",
		"Legendary",
		"Mythic",
		"Brainrot God",
		"Secret"
	},
	Multi = true,
	Default = {"Common"},
})

local SelectedRarity = {"Common"}
local highlights = {} -- Таблица для хранения созданных хайлайтов

BrainESP:OnChanged(function(Value)
	SelectedRarity = {}
	for rarity, isSelected in pairs(Value) do
		if isSelected then
			table.insert(SelectedRarity, rarity)
		end
	end
end)

BrainRotsESP:OnChanged(function(State)
	local Plots = workspace:FindFirstChild("Plots")
	if not Plots then 
		warn("Plots not found in workspace!")
		return 
	end

	local function shouldShowESP(rarityText)
		for _, selectedRarity in ipairs(SelectedRarity) do
			if rarityText == selectedRarity then
				return true
			end
		end
		return false
	end

	local function updateESP()
		for _, Plot in pairs(Plots:GetChildren()) do
			local Animals = Plot:FindFirstChild("AnimalPodiums")
			if Animals then
				for _, Animal in pairs(Animals:GetChildren()) do
					local Base = Animal:FindFirstChild("Base")
					if Base then
						local Decorations = Base:FindFirstChild("Decorations")
						local Spawnd = Base:FindFirstChild("Spawn")
						if Spawnd and Decorations then
							local Attachment = Spawnd:FindFirstChild("Attachment")
							if Attachment then
								local OverHead = Attachment:FindFirstChild("AnimalOverhead")
								if OverHead and OverHead:FindFirstChild("Rarity") then
									local rarityText = OverHead.Rarity.Text
									local animalId = tostring(Animal:GetDebugId()) -- Уникальный ID для хранения хайлайта

									if State and shouldShowESP(rarityText) then
										-- Включаем ESP для выбранных редкостей
										if not highlights[animalId] then
											local highlight = Instance.new("Highlight")
											highlight.FillColor = Color3.fromRGB(170, 181, 255)
											highlight.FillTransparency = 0.5
											highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
											highlight.OutlineTransparency = 0
											highlight.Parent = Decorations
											highlights[animalId] = highlight
										end

										-- Включаем видимость имени и редкости
										OverHead.ClipsDescendants = false
										OverHead.AlwaysOnTop = true
										OverHead.MaxDistance = 9999
										OverHead.Size = UDim2.new(50, 80, 8, 80)
									else
										-- Выключаем ESP для остальных
										if highlights[animalId] then
											highlights[animalId]:Destroy()
											highlights[animalId] = nil
										end

										OverHead.ClipsDescendants = true
										OverHead.AlwaysOnTop = false
										OverHead.MaxDistance = 60
										OverHead.Size = UDim2.new(50, 80, 8, 80)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if State then
		-- Включаем ESP
		if BrainRotsESP.connection then
			BrainRotsESP.connection:Disconnect()
		end
		BrainRotsESP.connection = game:GetService("RunService").Heartbeat:Connect(updateESP)
		updateESP() -- Первоначальное обновление
		print("ESP BrainRot: ON")
	else
		-- Выключаем ESP
		if BrainRotsESP.connection then
			BrainRotsESP.connection:Disconnect()
			BrainRotsESP.connection = nil
		end

		-- Удаляем все хайлайты
		for animalId, highlight in pairs(highlights) do
			if highlight then
				highlight:Destroy()
			end
		end
		highlights = {} -- Очищаем таблицу

		-- Сбрасываем все к значениям по умолчанию
		for _, Plot in pairs(Plots:GetChildren()) do
			local Animals = Plot:FindFirstChild("AnimalPodiums")
			if Animals then
				for _, Animal in pairs(Animals:GetChildren()) do
					local Base = Animal:FindFirstChild("Base")
					if Base then
						local Spawnd = Base:FindFirstChild("Spawn")
						if Spawnd then
							local Attachment = Spawnd:FindFirstChild("Attachment")
							if Attachment then
								local OverHead = Attachment:FindFirstChild("AnimalOverhead")
								if OverHead then
									OverHead.ClipsDescendants = true
									OverHead.AlwaysOnTop = false
									OverHead.MaxDistance = 60
									OverHead.Size = UDim2.new(0, 50, 0, 50)
								end
							end
						end
					end
				end
			end
		end
		print("ESP BrainRot: OFF")
	end
end)


local Combat = Tabs.Player:AddSection("Combat")

local HitTarget = Tabs.Player:CreateToggle("HitTargetToggle", {Title = "Hit Target", Default = false })

HitTarget:OnChanged(function()
	isEnabled = Options.HitTargetToggle.Value
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Создаем таблицу с именами игроков для Dropdown
local playerNames = {"Auto"}
for _, otherPlayer in ipairs(Players:GetPlayers()) do
	if otherPlayer ~= player then
		table.insert(playerNames, otherPlayer.Name)
	end
end



-- Переменные для бота
local targetPlayer = nil
local attackRange = 8
local lastAttackTime = 0
local attackCooldown = 0.5
local selectedPlayer = "Auto"

-- Создаем Dropdown (предполагая, что у тебя уже есть Tabs)
local Dropdown = Tabs.Player:CreateDropdown("PlayerSelector", {
	Title = "Select Target",
	Values = playerNames,
	Multi = false,
	Default = 1,
})
-- Функция для установки цели
local function setTarget()
	if selectedPlayer == "Auto" then
		-- Автоматический выбор ближайшего игрока
		local closestPlayer = nil
		local closestDistance = math.huge

		for _, otherPlayer in pairs(Players:GetPlayers()) do
			if otherPlayer ~= player and otherPlayer.Character then
				local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
				local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

				if otherRoot and myRoot then
					local distance = (myRoot.Position - otherRoot.Position).Magnitude
					if distance < closestDistance then
						closestDistance = distance
						closestPlayer = otherPlayer
					end
				end
			end
		end

		targetPlayer = closestPlayer
	else
		-- Поиск игрока по имени из Dropdown
		for _, otherPlayer in pairs(Players:GetPlayers()) do
			if otherPlayer.Name == selectedPlayer and otherPlayer ~= player then
				targetPlayer = otherPlayer
				return
			end
		end
		targetPlayer = nil
	end
end

-- Включение/выключение по клавише F
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if isEnabled then
		setTarget() -- Устанавливаем цель при включении
	end
end)

-- Функция для симуляции клика мыши
local function simulateMouseClick()
	local virtualInput = game:GetService("VirtualInputManager")
	virtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 1)
	task.wait(0.1)
	virtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

-- Проверка на препятствия
local function hasClearPath(startPos, endPos)
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	raycastParams.FilterDescendantsInstances = {player.Character}

	local direction = (endPos - startPos).Unit
	local distance = (startPos - endPos).Magnitude
	local raycastResult = workspace:Raycast(startPos, direction * distance, raycastParams)

	return raycastResult == nil
end

-- Поиск обходного пути
local function findAlternativePath(currentPos, targetPos)
	local directions = {
		Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
		Vector3.new(0, 0, 1), Vector3.new(0, 0, -1),
		Vector3.new(1, 0, 1), Vector3.new(-1, 0, 1),
		Vector3.new(1, 0, -1), Vector3.new(-1, 0, -1)
	}

	for _, dir in pairs(directions) do
		local testPos = currentPos + dir * 5
		if hasClearPath(currentPos, testPos) and hasClearPath(testPos, targetPos) then
			return testPos
		end
	end

	return nil
end

-- Основной цикл преследования и атаки
RunService.Heartbeat:Connect(function()
	if not isEnabled or not targetPlayer then return end

	local character = player.Character
	local targetCharacter = targetPlayer.Character

	if not character or not targetCharacter then return end

	local humanoid = character:FindFirstChild("Humanoid")
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
	local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")

	if not humanoid or not humanoidRootPart or not targetRoot or not targetHumanoid then return end
	if targetHumanoid.Health <= 0 then return end

	-- Расчет расстояния до цели
	local distance = (humanoidRootPart.Position - targetRoot.Position).Magnitude

	if distance > attackRange then
		if hasClearPath(humanoidRootPart.Position, targetRoot.Position) then
			humanoid:MoveTo(targetRoot.Position)
		else
			local alternativePath = findAlternativePath(humanoidRootPart.Position, targetRoot.Position)
			if alternativePath then
				humanoid:MoveTo(alternativePath)
			else
				humanoid:MoveTo(targetRoot.Position)
			end
		end
	else
		humanoid:MoveTo(humanoidRootPart.Position)

		local currentTime = tick()
		if currentTime - lastAttackTime >= attackCooldown then
			simulateMouseClick()
			lastAttackTime = currentTime
		end

		local lookAt = CFrame.lookAt(humanoidRootPart.Position, targetRoot.Position)
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0, lookAt:ToEulerAnglesXYZ(), 0)
	end
end)

-- Обновление списка игроков в Dropdown при подключении/отключении
local function updatePlayerList()
	local newPlayerNames = {"Auto"}
	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= player then
			table.insert(newPlayerNames, otherPlayer.Name)
		end
	end
	Dropdown:SetValues(newPlayerNames)
end

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
-- Обработчик выбора в Dropdown
Dropdown:OnChanged(function(selection)
	selectedPlayer = selection
	print("Выбран игрок: " .. selection)

	if isEnabled then
		setTarget() -- Переустанавливаем цель если бот включен
	end
end)

local Helper = Tabs.Player:AddSection("Helper")

local CancelPacket = Tabs.Player:CreateToggle("CancelPacketToggle", {
	Title = "Cancel Packet",
	Default = false
})

CancelPacket:OnChanged(function()
	task.spawn(function()
		local RunService = game:GetService("RunService")
		RunService.Heartbeat:Connect(function()
			local plr = game:GetService("Players").LocalPlayer
			local chr = plr.Character or plr.CharacterAdded:Wait()
			local hum = chr:FindFirstChild("Humanoid")
			local hpr = chr:FindFirstChild("HumanoidRootPart")
			if Options.CancelPacketToggle.Value == true then
				hpr.Anchored = not hpr.Anchored
			end
		end)
	end)
end)

local CancelRagdoll = Tabs.Player:CreateToggle("CancelRagdollToggle", {
	Title = "Cancel Ragdoll",
	Default = false
})

CancelRagdoll:OnChanged(function()
	task.spawn(function()
		local RunService = game:GetService("RunService")
		RunService.Heartbeat:Connect(function()
			local plr = game:GetService("Players").LocalPlayer
			local chr = plr.Character or plr.CharacterAdded:Wait()
			local hum = chr:FindFirstChild("Humanoid")
			local hpr = chr:FindFirstChild("HumanoidRootPart")
			if Options.CancelRagdollToggle.Value == true then
				if hum:GetState() == Enum.HumanoidStateType.Physics then
					hpr.Anchored = not hpr.Anchored
				end
			end
		end)
	end)
end)

local InfiniteJump = Tabs.Player:CreateToggle("InfiniteJumpToggle", {Title = "Infinite Jump", Default = false })

InfiniteJump:OnChanged(function()
	task.spawn(function()
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")

		local player = Players.LocalPlayer
		local platform = nil
		local connection = nil

		-- Функция создания/удаления платформы
		local function updatePlatform()
			if platform then
				platform:Destroy()
				platform = nil
			end

			if Options.InfiniteJumpToggle.Value == true then
				platform = Instance.new("Part")
				platform.Name = "PlayerPlatform"
				platform.Size = Vector3.new(8, 1, 8)
				platform.Anchored = true
				platform.CanCollide = true
				platform.Transparency = 1
				platform.Parent = workspace
			end
		end

		-- Функция обновления позиции платформы
		local function updatePlatformPosition()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			if Options.InfiniteJumpToggle.Value == true then
				connection = RunService.Heartbeat:Connect(function()
					if platform and player.Character then
						local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
						if rootPart then
							local playerPos = rootPart.Position
							platform.Position = Vector3.new(playerPos.X, playerPos.Y - 4, playerPos.Z)
						end
					end
				end)
			end
		end

		-- Обработчик изменения значения тоггла
		Options.InfiniteJumpToggle:OnChanged(function(value)
			updatePlatform()
			updatePlatformPosition()
		end)

		-- Обработка смены персонажа
		player.CharacterAdded:Connect(function()
			updatePlatform()
			updatePlatformPosition()
		end)

		-- Инициализация
		updatePlatform()
		updatePlatformPosition()
	end)
end)

local AutoSpeed = Tabs.Player:CreateToggle("AutoSpeedToggle", {
	Title = "Auto Speed",
	Default = false })

AutoSpeed:OnChanged(function()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	local function equipBestCoil()
		local character = player.Character
		if not character then return end

		-- Проверяем есть ли уже инструмент в руках
		local hasTool = false
		for _, item in ipairs(character:GetChildren()) do
			if item:IsA("Tool") then
				hasTool = true
				break
			end
		end

		-- Если инструмента нет - ищем лучший доступный coil
		if not hasTool then
			local backpack = player:FindFirstChild("Backpack")
			if backpack then
				local coilCombo = nil
				local speedCoil = nil

				-- Ищем все доступные coils
				for _, item in ipairs(backpack:GetChildren()) do
					if item:IsA("Tool") then
						if item.Name:lower():find("combo") then
							coilCombo = item -- Приоритет: Coil Combo
						elseif item.Name:lower():find("speed") and not speedCoil then
							speedCoil = item -- Запасной: Speed Coil
						end
					end
				end

				-- Экипируем лучший доступный вариант
				if coilCombo then
					coilCombo.Parent = character
				elseif speedCoil then
					speedCoil.Parent = character
				end
			end
		end
	end


	task.spawn(function()
		while true do
			if Options.AutoSpeedToggle.Value == true then
				equipBestCoil()
			end
			wait(0.1)
		end
	end)
end)

local Other = Tabs.Player:AddSection("Other")

local SpinBot = Tabs.Player:CreateToggle("SpinBotToggle", {Title = "Spin Bot", Default = false })

SpinBot:OnChanged(function()
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")

	local player = Players.LocalPlayer
	local mouse = player:GetMouse()

	local spinSpeed = 8

	game:GetService("RunService").RenderStepped:Connect(function()
		if Options.SpinBotToggle.Value == true then
			local character = player.Character
			if character then
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
				end
			end
		end
	end)
end)


local FakeLag = Tabs.Player:CreateToggle("FakeLagToggle", {Title = "Fake Lag", Default = false })

FakeLag:OnChanged(function()
	local plr = game:GetService("Players").LocalPlayer
	local chr = plr.Character or plr.CharacterAdded:Wait()
	local Hrp = chr:WaitForChild("HumanoidRootPart")

	task.spawn(function()
		while true do
			if Options.FakeLagToggle.Value == true then
				Hrp.Anchored = not Hrp.Anchored
				task.wait(0.1)
			else
				Hrp.Anchored = false
				break
			end
		end
	end)
end)

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes{}

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
	Title = "Celestum X",
	Content = "The script has been loaded.",
	Duration = 8
}

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
