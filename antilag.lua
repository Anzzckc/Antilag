-- IY's original code
-- ===== XTIEN42_ANTILAG =====
local xtien42_RunService = game:GetService("RunService")
local xtien42_Lighting = game:GetService("Lighting")

local xtien42_Terrain = workspace:FindFirstChildWhichIsA("Terrain")
if xtien42_Terrain then
    xtien42_Terrain.WaterWaveSize = 0
    xtien42_Terrain.WaterWaveSpeed = 0
    xtien42_Terrain.WaterReflectance = 0
    xtien42_Terrain.WaterTransparency = 1
end

xtien42_Lighting.GlobalShadows = false
xtien42_Lighting.FogEnd = 9e9
xtien42_Lighting.FogStart = 9e9

settings().Rendering.QualityLevel = 1

for _, xtien42_v in pairs(game:GetDescendants()) do
    if xtien42_v:IsA("BasePart") then
        xtien42_v.CastShadow = false
        xtien42_v.Material = Enum.Material.Plastic
        xtien42_v.Reflectance = 0
    elseif xtien42_v:IsA("Decal") then
        xtien42_v.Transparency = 1
        xtien42_v.Texture = ""
    elseif xtien42_v:IsA("ParticleEmitter") or xtien42_v:IsA("Trail") then
        xtien42_v.Enabled = false
    end
end

for _, xtien42_v in pairs(xtien42_Lighting:GetDescendants()) do
    if xtien42_v:IsA("PostEffect") then
        xtien42_v.Enabled = false
    end
end

workspace.DescendantAdded:Connect(function(xtien42_child)
    task.spawn(function()
        if xtien42_child:IsA("ForceField") or xtien42_child:IsA("Sparkles") or 
           xtien42_child:IsA("Smoke") or xtien42_child:IsA("Fire") or xtien42_child:IsA("Beam") then
            xtien42_RunService.Heartbeat:Wait()
            xtien42_child:Destroy()
        elseif xtien42_child:IsA("BasePart") then
            xtien42_child.CastShadow = false
        end
    end)
end)

print("=== ANTILAG LOADED ===")
