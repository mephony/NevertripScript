-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Gui = Instance.new("Frame")
local TabsFrame = Instance.new("Frame")
local Tabs = Instance.new("Folder")
local Main = Instance.new("TextButton")
local Text = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local ImageLabel = Instance.new("ImageLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local UICorner = Instance.new("UICorner")
local Visuals = Instance.new("TextButton")
local Text_2 = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local ImageLabel_2 = Instance.new("ImageLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local UICorner_3 = Instance.new("UICorner")
local ChildFrame = Instance.new("Frame")
local Visuals_2 = Instance.new("Frame")
local Slider = Instance.new("Folder")
local Buttons = Instance.new("Folder")
local Esp = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
local BaseStatus = Instance.new("ImageButton")
local TextLabel_2 = Instance.new("TextLabel")
local UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint")
local Main_2 = Instance.new("Frame")
local Slider_2 = Instance.new("Folder")
local Buttons_2 = Instance.new("Folder")
local UICorner_4 = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Watermark = Instance.new("Frame")
local Line = Instance.new("Frame")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local OpenMenu = Instance.new("TextButton")
local UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Gui.Name = "Gui"
Gui.Parent = ScreenGui
Gui.Active = true
Gui.AnchorPoint = Vector2.new(0.5, 0.5)
Gui.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Gui.BackgroundTransparency = 0.050
Gui.BorderColor3 = Color3.fromRGB(0, 0, 0)
Gui.BorderSizePixel = 0
Gui.Position = UDim2.new(0.5, 0, 0.5, 0)
Gui.Selectable = true
Gui.Size = UDim2.new(0.475695759, 0, 0.600990593, 0)

TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = Gui
TabsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabsFrame.BorderSizePixel = 0
TabsFrame.Position = UDim2.new(0.106471039, 0, 0.495214134, 0)
TabsFrame.Size = UDim2.new(0.199143454, 0, 0.962007165, 0)

Tabs.Name = "Tabs"
Tabs.Parent = TabsFrame

Main.Name = "Main"
Main.Parent = Tabs
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 1, 0, 1)
Main.Size = UDim2.new(0.951779664, 0, 0.0613236502, 0)
Main.Font = Enum.Font.SourceSans
Main.TextColor3 = Color3.fromRGB(554, 554, 554)
Main.TextScaled = true
Main.TextSize = 14.000
Main.TextTransparency = 1.000
Main.TextWrapped = true

Text.Name = "Text"
Text.Parent = Main
Text.AnchorPoint = Vector2.new(0.5, 0.5)
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.613985956, 0, 0.545632303, 0)
Text.Size = UDim2.new(0.77185303, 0, 0.99999994, 0)
Text.Font = Enum.Font.Nunito
Text.Text = "Main"
Text.TextColor3 = Color3.fromRGB(554, 554, 554)
Text.TextScaled = true
Text.TextSize = 14.000
Text.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Text.TextWrapped = true
Text.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint.Parent = Text
UITextSizeConstraint.MaxTextSize = 23

ImageLabel.Parent = Main
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.111040018, 0, 0.545632303, 0)
ImageLabel.Size = UDim2.new(0.228903279, 0, 0.766666532, 0)
ImageLabel.Image = "rbxassetid://4335479121"
ImageLabel.ScaleType = Enum.ScaleType.Fit

UITextSizeConstraint_2.Parent = Main
UITextSizeConstraint_2.MaxTextSize = 14

UICorner.Parent = Main

Visuals.Name = "Visuals"
Visuals.Parent = Tabs
Visuals.AnchorPoint = Vector2.new(0.5, 0.5)
Visuals.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Visuals.BorderColor3 = Color3.fromRGB(0, 0, 0)
Visuals.BorderSizePixel = 0
Visuals.Position = UDim2.new(0, 1, 0, 1)
Visuals.Size = UDim2.new(0.951779664, 0, 0.0593670122, 0)
Visuals.Font = Enum.Font.SourceSans
Visuals.TextColor3 = Color3.fromRGB(554, 554, 554)
Visuals.TextScaled = true
Visuals.TextSize = 14.000
Visuals.TextTransparency = 1.000
Visuals.TextWrapped = true

Text_2.Name = "Text"
Text_2.Parent = Visuals
Text_2.AnchorPoint = Vector2.new(0.5, 0.5)
Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_2.BackgroundTransparency = 1.000
Text_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text_2.BorderSizePixel = 0
Text_2.Position = UDim2.new(0.607454181, 0, 0.476905376, 0)
Text_2.Size = UDim2.new(0.77185303, 0, 0.99999994, 0)
Text_2.Font = Enum.Font.Nunito
Text_2.Text = "Visuals"
Text_2.TextColor3 = Color3.fromRGB(554, 554, 554)
Text_2.TextScaled = true
Text_2.TextSize = 14.000
Text_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Text_2.TextWrapped = true
Text_2.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_3.Parent = Text_2
UITextSizeConstraint_3.MaxTextSize = 30

ImageLabel_2.Parent = Visuals
ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.104508251, 0, 0.476905376, 0)
ImageLabel_2.Size = UDim2.new(0.216115892, 0, 0.766666532, 0)
ImageLabel_2.Image = "rbxassetid://3610254229"
ImageLabel_2.ScaleType = Enum.ScaleType.Fit

UITextSizeConstraint_4.Parent = Visuals
UITextSizeConstraint_4.MaxTextSize = 23

UICorner_2.Parent = Visuals

UIListLayout.Parent = Tabs
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.00999999978, 0)

UICorner_3.Parent = TabsFrame

ChildFrame.Name = "ChildFrame"
ChildFrame.Parent = Gui
ChildFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ChildFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ChildFrame.BackgroundTransparency = 1.000
ChildFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChildFrame.BorderSizePixel = 0
ChildFrame.Position = UDim2.new(0.607875347, 0, 0.495214134, 0)
ChildFrame.Size = UDim2.new(0.755910873, 0, 0.981381238, 0)

Visuals_2.Name = "Visuals"
Visuals_2.Parent = ChildFrame
Visuals_2.AnchorPoint = Vector2.new(0.5, 0.5)
Visuals_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Visuals_2.BackgroundTransparency = 1.000
Visuals_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Visuals_2.BorderSizePixel = 0
Visuals_2.ClipsDescendants = true
Visuals_2.Position = UDim2.new(0.499530822, 0, 0.504609346, 0)
Visuals_2.Size = UDim2.new(0.999999881, 0, 0.999999821, 0)

Slider.Name = "Slider"
Slider.Parent = Visuals_2

Buttons.Name = "Buttons"
Buttons.Parent = Visuals_2

Esp.Name = "Esp"
Esp.Parent = Buttons
Esp.AnchorPoint = Vector2.new(0.5, 0.5)
Esp.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Esp.BackgroundTransparency = 1.000
Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Esp.BorderSizePixel = 0
Esp.Position = UDim2.new(0.0179999731, 0, 0.0327996127, 0)
Esp.Size = UDim2.new(0.0425829589, 0, 0.0655992255, 0)
Esp.Image = "http://www.roblox.com/asset/?id=11772672161"
Esp.ScaleType = Enum.ScaleType.Fit

TextLabel.Parent = Esp
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(2.63295674, 0, 0.499999851, 0)
TextLabel.Size = UDim2.new(3.25219774, 0, 0.691913188, 0)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Esp"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_5.Parent = TextLabel
UITextSizeConstraint_5.MaxTextSize = 18

BaseStatus.Name = "BaseStatus"
BaseStatus.Parent = Buttons
BaseStatus.AnchorPoint = Vector2.new(0.5, 0.5)
BaseStatus.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BaseStatus.BackgroundTransparency = 1.000
BaseStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
BaseStatus.BorderSizePixel = 0
BaseStatus.Position = UDim2.new(0.0180158652, 0, 0.102523036, 0)
BaseStatus.Size = UDim2.new(0.0430000015, 0, 0.0680000037, 0)
BaseStatus.Image = "http://www.roblox.com/asset/?id=11772672161"
BaseStatus.ScaleType = Enum.ScaleType.Fit

TextLabel_2.Parent = BaseStatus
TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(2.59001899, 0, 0.519450843, 0)
TextLabel_2.Size = UDim2.new(3.25219774, 0, 0.691913188, 0)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "Base Status"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_6.Parent = TextLabel_2
UITextSizeConstraint_6.MaxTextSize = 18

Main_2.Name = "Main"
Main_2.Parent = ChildFrame
Main_2.AnchorPoint = Vector2.new(0.5, 0.5)
Main_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Main_2.BackgroundTransparency = 1.000
Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main_2.BorderSizePixel = 0
Main_2.ClipsDescendants = true
Main_2.Position = UDim2.new(0.5, 0, 0.504999995, 0)
Main_2.Size = UDim2.new(0.999999881, 0, 0.999999821, 0)

Slider_2.Name = "Slider"
Slider_2.Parent = Main_2

Buttons_2.Name = "Buttons"
Buttons_2.Parent = Main_2

UICorner_4.CornerRadius = UDim.new(0, 5)
UICorner_4.Parent = Gui

UIAspectRatioConstraint.Parent = Gui
UIAspectRatioConstraint.AspectRatio = 2.000

Watermark.Name = "Watermark"
Watermark.Parent = ScreenGui
Watermark.AnchorPoint = Vector2.new(0.5, 0.5)
Watermark.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
Watermark.BorderSizePixel = 0
Watermark.ClipsDescendants = true
Watermark.Position = UDim2.new(0.0871613696, 0, 0.97023809, 0)
Watermark.Size = UDim2.new(0.166868836, 0, 0.0360696502, 0)

Line.Name = "Line"
Line.Parent = Watermark
Line.AnchorPoint = Vector2.new(0.5, 0.5)
Line.BackgroundColor3 = Color3.fromRGB(255, 0, 76)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.5, 0, -0.00499999989, 0)
Line.Size = UDim2.new(1.00100005, 0, 0.119999997, 0)
Line.ZIndex = 2

UIAspectRatioConstraint_2.Parent = Watermark
UIAspectRatioConstraint_2.AspectRatio = 11.690

OpenMenu.Name = "OpenMenu"
OpenMenu.Parent = Watermark
OpenMenu.AnchorPoint = Vector2.new(0.5, 0.5)
OpenMenu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpenMenu.BackgroundTransparency = 1.000
OpenMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenMenu.BorderSizePixel = 0
OpenMenu.Position = UDim2.new(0.479983121, 0, 0.536330104, 0)
OpenMenu.Size = UDim2.new(0.960925579, 0, 0.939999342, 0)
OpenMenu.Font = Enum.Font.Unknown
OpenMenu.Text = "Nevertrip ││ Best Hub"
OpenMenu.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenMenu.TextScaled = true
OpenMenu.TextSize = 15.000
OpenMenu.TextWrapped = true

UITextSizeConstraint_7.Parent = OpenMenu
UITextSizeConstraint_7.MaxTextSize = 22

-- Scripts:
-- Добавьте эти строки после создания Esp и BaseStatus
local BoolValue = Instance.new("BoolValue")
BoolValue.Name = "Checked"
BoolValue.Value = false
BoolValue.Parent = Esp

local BoolValue2 = Instance.new("BoolValue")
BoolValue2.Name = "Checked"
BoolValue2.Value = false
BoolValue2.Parent = BaseStatus

local function DVSAHXG_fake_script() -- Esp.LocalScript 
	local script = Instance.new('LocalScript', Esp)

	local defaultHighlightColor = Color3.fromRGB(155, 255, 130)
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer
	local highlights = {}
	
	local function createHighlight(character)
		local highlight = Instance.new("Highlight")
		highlight.Name = "ESP_Highlight"
		highlight.FillColor = Color3.fromRGB(155, 255, 130)
		highlight.FillTransparency = 0.8
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Enabled = script.Parent.Checked.Value
		highlight.Parent = character
		return highlight
	end
	
	
	-- Функция настройки ESP для игрока
	local function setupPlayerESP(player)
		if player == LocalPlayer then return end
	
		local function characterAdded(character)
			wait(0.5)
	
			if not highlights[player] and character:FindFirstChild("Humanoid") then
				highlights[player] = createHighlight(character)
			end
		end
	
		if player.Character then
			characterAdded(player.Character)
		end
	
		player.CharacterAdded:Connect(characterAdded)
		player.CharacterRemoving:Connect(function()
			if highlights[player] then
				highlights[player]:Destroy()
				highlights[player] = nil
			end
		end)
	end
	
	-- Инициализация
	for _, player in ipairs(Players:GetPlayers()) do
		setupPlayerESP(player)
	end
	
	Players.PlayerAdded:Connect(setupPlayerESP)
	Players.PlayerRemoving:Connect(function(player)
		if highlights[player] then
			highlights[player]:Destroy()
			highlights[player] = nil
		end
	end)
	
	script.Parent.Checked.Changed:Connect(function()
		for player, highlight in pairs(highlights) do
			if highlight then
				highlight.Enabled = script.Parent.Checked.Value
			end
		end
	end)
end
coroutine.wrap(DVSAHXG_fake_script)()
local function YPNE_fake_script() -- ScreenGui.Script 
	local script = Instance.new('LocalScript', ScreenGui)

	local frame = script.Parent.Gui
	local Button = script.Parent.Watermark.OpenMenu
	local userInputService = game:GetService("UserInputService")
	local dragging = false
	local dragStart = nil
	local startPos = nil
	local plr = game.Players.LocalPlayer
	local players = game.Players
	local Tabs = frame.TabsFrame.Tabs
	local Childs = frame.ChildFrame
	local RS = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")
	local frames = 0
	
	frame.Position = UDim2.new(0.5, 0, -0.5, 0) -- Сдвигаем за верхний край экрана
	frame.Visible = true -- Сначала скрываем
	
	
	local function closeMenu()
		-- Аналогично открытию, но анимируем в конечную точку за экраном
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local goals = {}
		goals.Position = UDim2.new(0.5, 0, -0.5, 0) -- Цель: за верхним краем
	
		local closeTween = TweenService:Create(frame, tweenInfo, goals)
		closeTween:Play()
	
	end
	
	local function openMenu()
		local tweenInfo = TweenInfo.new(
			0.5, -- Длительность анимации в секундах
			Enum.EasingStyle.Exponential, -- Стиль плавности (Quad, Elastic, Bounce и т.д.)
			Enum.EasingDirection.Out -- Направление (Out - анимация "затухает" в конце)
		)
	
		-- Создаем цели анимации: куда и как должен прийти наш Frame
		local goals = {}
		goals.Position = UDim2.new(0.5, 0, 0.5, 0) -- Цель: центр экрана
	
		-- Создаем сам Tween
		local openTween = TweenService:Create(frame, tweenInfo, goals)
	
		-- Запускаем анимацию
		openTween:Play()
	end
	 
	RS.RenderStepped:Connect(function()
		frames = frames + 1
	end)
	
	local CheckTrue = 11772695039
	local CheckFalse = 11772672161
	
	local menu = true
	
	spawn(function()
		while wait(1) do
			Button.Text = "Nevertrip ┃ ".. plr.Name.." ┃ Steal a Brainrot ┃ FPS: " ..frames
			frames = 0
		end
	end)
	
	Button.MouseButton1Click:Connect(function()
		menu = not menu
	
		if menu == true then
			openMenu()
		else
			closeMenu()
		end
		
	end)
	
	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale, 
			startPos.X.Offset + delta.X, 
			startPos.Y.Scale, 
			startPos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragging then
				update(input)
			end
		end
	end)
	
	Tabs.Main.MouseButton1Click:Connect(function()
		Childs.Main.Visible = true
		Childs.Visuals.Visible = false
	end)
	
	Tabs.Visuals.MouseButton1Click:Connect(function()
		Childs.Main.Visible = false
		Childs.Visuals.Visible = true
	end)
	
	for _, vbutton in Childs.Visuals.Buttons:GetChildren() do
		vbutton.MouseButton1Click:Connect(function()
			vbutton.Checked.Value = not vbutton.Checked.Value
	
			if vbutton.Checked.Value == true then
				vbutton.Image = "http://www.roblox.com/asset/?id=" ..CheckTrue
			else
				vbutton.Image = "http://www.roblox.com/asset/?id=" ..CheckFalse
			end
		end)
	end
	
	
	
end
coroutine.wrap(YPNE_fake_script)()
