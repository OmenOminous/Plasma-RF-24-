local uiAccentColors = {
    ["Blue"] = Color3.fromRGB(44, 115, 216),
    ["Purple"] = Color3.fromRGB(173, 17, 216),
    ["Pink"] = Color3.fromRGB(255, 37, 186),
    ["Red"] = Color3.fromRGB(255, 0, 4),
    ["Orange"] = Color3.fromRGB(255, 102, 0),
    ["Yellow"] = Color3.fromRGB(217, 210, 0),
    ["Lime"] = Color3.fromRGB(0, 255, 81),
    ["Cyan"] = Color3.fromRGB(0, 230, 255),
}


local notify = {}

function notify:made_by_rizz_god_5961()
	local notificationholder = {}

	local notificationui = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	notificationui.Name = "notificationui"
	notificationui.Parent = game.CoreGui
	notificationui.ZIndexBehavior = Enum.ZIndexBehavior.Global


	main.Name = "main"
	main.Parent = notificationui
	main.AnchorPoint = Vector2.new(0.5, 0.800000012)
	main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main.BackgroundTransparency = 1.000
	main.ClipsDescendants = true
	main.BorderColor3 = Color3.fromRGB(27, 42, 53)
	main.Position = UDim2.new(0.5, 0, 0.628318608, 0)
	main.Size = UDim2.new(0, 250, 0.785398245, 0)

	UIListLayout.Parent = main
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0, 10)
	function notificationholder:notify(title1,description1,cd, type)
        local type = type or "Blue"
        for i, v in pairs(uiAccentColors) do
            if type == i then
                type = v
            end
        end
		local cd = cd or 5
		local notification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local title = Instance.new("TextLabel")
		local description = Instance.new("TextLabel")
		local cooldownbackground = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local DropShadowHolder = Instance.new("Frame")
		local DropShadow = Instance.new("ImageLabel")

		notification.Name = "notification"
		notification.Parent = game.CoreGui:FindFirstChild("notificationui"):FindFirstChild("main")
		notification.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		notification.Size = UDim2.new(0, 0, 0, 0)
		notification.ClipsDescendants = true

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = notification

		title.Name = "title"
		title.Parent = notification
		title.AnchorPoint = Vector2.new(1,1)
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundTransparency = 1.000
		title.Position = UDim2.new(1, 0, 0.54, 0)
		title.Size = UDim2.new(1, 0, 0, 16)
		title.ZIndex = 2
		title.Font = Enum.Font.Ubuntu
		title.Text = title1 or "Notification Title"
		title.TextColor3 = Color3.fromRGB(240, 240, 240)
		title.TextScaled = true
		title.TextSize = 16.000
		title.TextWrapped = true

		description.Name = "description"
		description.Parent = notification
		description.AnchorPoint = Vector2.new(1,1)
		description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		description.BackgroundTransparency = 1.000
		description.Position = UDim2.new(1, 0, 0.88, -5)
		description.Size = UDim2.new(1, 0, 0, 12)
		description.ZIndex = 2
		description.Font = Enum.Font.Ubuntu
		description.Text = description1 or "Notification Description"
		description.TextColor3 = Color3.fromRGB(200, 200, 200)
		description.TextScaled = true
		description.TextSize = 14.000
		description.TextWrapped = true

		DropShadowHolder.Name = "DropShadowHolder"
		DropShadowHolder.Parent = notification
		DropShadowHolder.BackgroundTransparency = 1.000
		DropShadowHolder.BorderSizePixel = 0
		DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder.ZIndex = 0

		DropShadow.Name = "DropShadow"
		DropShadow.Parent = DropShadowHolder
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 47, 1, 47)
		DropShadow.ZIndex = 0
		DropShadow.Image = "rbxassetid://6014261993"
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.500
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

		cooldownbackground.Name = "cooldownbackground"
		cooldownbackground.Parent = notification
		cooldownbackground.AnchorPoint = Vector2.new(0,1)
		cooldownbackground.BackgroundColor3 = type
		cooldownbackground.Position = UDim2.new(0, 0,1, 0)
		cooldownbackground.Size = UDim2.new(0, 0, 0, 3)

		notification:TweenSize(
			UDim2.new(0, 170, 0, 50),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Linear,
			0.3,
			false,
			function()
				cooldownbackground:TweenSize(
					UDim2.new(0, 170, 0, 3),
					Enum.EasingDirection.InOut,
					Enum.EasingStyle.Linear,
					cd,
					false,
					function()
						notification:TweenSize(
							UDim2.new(0, 0, 0, 0),
							Enum.EasingDirection.InOut,
							Enum.EasingStyle.Linear,
							0.3,
							false,
							function()
								notification:Destroy()
							end
						)
					end
				)
			end
		)
        
		UICorner_2.CornerRadius = UDim.new(0, 6)
		UICorner_2.Parent = cooldownbackground
	end
	return notificationholder
end

return notify
