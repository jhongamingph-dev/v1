--[[
           𝚃𝙷𝙸𝚂 𝚆𝙰𝚂 𝙼𝙰𝙳𝙴 𝚃𝙾 𝚁𝙴𝙼𝙾𝚅𝙴 𝚃𝙴𝚇𝚃𝚄𝚁𝙴 & 𝙵𝙾𝙶 𝙱𝙾𝙾𝚂𝚃 𝙵𝙿𝚂 𝙲𝙻𝙴𝙰𝙽 𝙴𝚇𝙿𝙴𝚁𝙸𝙴𝙽𝙲𝙴 𝙱𝙴𝚃𝚃𝙴𝚁 𝙶𝙰𝙼𝙴𝙿𝙻𝙰𝚈
           𝚂𝙴𝚁𝚅𝙸𝙲𝙴 𝙱𝚈: 𝙶𝙸𝚃𝙷𝚄𝙱.𝙲𝙾𝙼
           𝙲𝚁𝙴𝙰𝚃𝙴𝙳 𝙱𝚈: 𝚂𝚈𝙽𝙲 - 𝙹𝙾𝙷𝙽
           𝙲𝙾𝙿𝚈𝚁𝙸𝙶𝙷𝚃 © 2026-2027  𝚃𝙴𝙰𝙼 𝙴𝚇𝙿𝙻𝙾𝙸𝚃𝚂 - 𝙰𝙻𝙻 𝚁𝙸𝙶𝙷𝚃𝚂 𝚁𝙴𝚂𝙴𝚁𝚅𝙴𝙳.
]]--

local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace:WaitForChild("Terrain")

Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0

setfpscap(math.huge)

Lighting.Ambient = Color3.fromRGB(255, 255, 255)
Lighting.Brightness = 1
Lighting.ClockTime = 14
Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
Lighting.ExposureCompensation = 0
Lighting.FogColor = Color3.fromRGB(255, 255, 255)
Lighting.FogEnd = 999999999
Lighting.GeographicLatitude = 41.733
Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
Lighting.GlobalShadows = false

for _, v in pairs(game:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 0
        v.BlastRadius = 0
    elseif v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then
        v:Destroy()
    end
end

Workspace.DescendantAdded:Connect(function(child)
    if child:IsA("ForceField") or child:IsA("Sparkles") or child:IsA("Smoke") or child:IsA("Fire") then
        RunService.Heartbeat:Wait()
        child:Destroy()
    end
end)

Lighting.DescendantAdded:Connect(function(obj)
    if obj:IsA("Atmosphere") or obj:IsA("Sky") or obj:IsA("BlurEffect") or obj:IsA("BloomEffect") or obj:IsA("SunRaysEffect") then
        task.defer(function()
            obj:Destroy()
        end)
    end
end)
