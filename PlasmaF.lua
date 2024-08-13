-- Settings
_G.distance = 5  -- Initialize distance

-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local AssetService = game:GetService("AssetService")

-- Infinite stamina setup
local staminaValue = AssetService.controllers.movementController.stamina

-- Function to find "ball" parts in a given parent
local function findBalls(parent)
    local balls = {}
    
    local function scanForBalls(folder)
        for _, obj in ipairs(folder:GetChildren()) do
            if obj:IsA("Folder") then
                scanForBalls(obj)  -- Recursively scan folders
            elseif obj:IsA("Part") and obj:FindFirstChild("network") then
                table.insert(balls, obj)  -- Add ball to the list if it has a "network" child
            end
        end
    end
    
    scanForBalls(parent)  -- Start scanning from the provided parent
    return balls
end

-- Main script that runs every heartbeat
game:GetService('RunService').Heartbeat:Connect(function()
    _G.Limbs = {}
    _G.RootPart = nil
    local Character = LocalPlayer.Character

    if Character then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        
        -- Ensure the character has an R15 rig
        if Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R15 then
            _G.RootPart = Character:FindFirstChild("HumanoidRootPart")  -- Get the RootPart

            -- Populate _G.Limbs with limb parts
            for _, limbName in ipairs({"LeftUpperLeg", "LeftLowerLeg", "RightUpperLeg", "RightLowerLeg", "LeftUpperArm", "LeftLowerArm", "RightUpperArm", "RightLowerArm"}) do
                local limb = Character:FindFirstChild(limbName)
                if limb then
                    _G.Limbs[limbName] = limb
                end
            end
        end
    end

    local balls = findBalls(Workspace.game)  -- Find all balls in the workspace

    for _, ball in ipairs(balls) do
        if _G.RootPart then
            local rootDistance = (ball.Position - _G.RootPart.Position).Magnitude
            
            -- Check if within distance to the RootPart
            if rootDistance <= _G.distance then
                firetouchinterest(ball, _G.RootPart, 0)  -- Trigger touch
                firetouchinterest(ball, _G.RootPart, 1)  -- End touch
            end
        end

        -- Check distance for each limb
        for limbName, limb in pairs(_G.Limbs) do
            local limbDistance = (ball.Position - limb.Position).Magnitude
            
            -- If within distance to limb, trigger touch
            if limbDistance <= _G.distance then
                firetouchinterest(ball, limb, 0)
                firetouchinterest(ball, limb, 1)
            end
        end
    end
end)

-- Mouse input handling
local mouse = LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
    if key == '8' then
        StarterGui:SetCore('SendNotification', {
            Title = 'autocatch',
            Text = 'Current distance: ' .. _G.distance .. ' studs'
        })
    end
end)

-- Infinite stamina loop
while true do
    staminaValue.Value = 100 -- Set stamina to maximum
    wait(0.1) -- Wait a bit to avoid performance issues
end