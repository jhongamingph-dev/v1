--[[
           𝚃𝙷𝙸𝚂 𝚆𝙰𝚂 𝙼𝙰𝙳𝙴 𝚃𝙾 𝚁𝙴𝙼𝙾𝚅𝙴 𝚃𝙴𝚇𝚃𝚄𝚁𝙴 • 𝙲𝙻𝙴𝙰𝚁 𝙵𝙾𝙶 • 𝙼𝙰𝚇𝙸𝙼𝚄𝙼 𝙵𝙿𝚂 ( discord.gg/NyvndxAadV )
           𝚂𝙴𝚁𝚅𝙸𝙲𝙴 𝙱𝚈: 𝙶𝙸𝚃𝙷𝚄𝙱.𝙲𝙾𝙼
           𝙲𝚁𝙴𝙰𝚃𝙴𝙳 𝙱𝚈: 𝚂𝚈𝙽𝙲 - 𝙹𝙾𝙷𝙽
           𝙲𝙾𝙿𝚈𝚁𝙸𝙶𝙷𝚃 © 2026-2027  𝚃𝙴𝙰𝙼 𝙴𝚇𝙿𝙻𝙾𝙸𝚃𝚂 - 𝙰𝙻𝙻 𝚁𝙸𝙶𝙷𝚃𝚂 𝚁𝙴𝚂𝙴𝚁𝚅𝙴𝙳.
]]--

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

Lighting.FogStart = math.huge
Lighting.FogEnd = math.huge
Lighting.GlobalShadows = false

if setfpscap then
    setfpscap(math.huge)
end

if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
end

local function optimizeInstance(instance)
    if instance:IsA("Texture") or instance:IsA("Decal") then
        instance:Destroy()
    elseif instance:IsA("ParticleEmitter") or instance:IsA("Trail") or instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Sparkles") then
        instance:Destroy()
    elseif instance:IsA("BasePart") and not instance:IsDescendantOf(game.Players.LocalPlayer.Character or workspace) then
        instance.Material = Enum.Material.SmoothPlastic
        instance.Reflectance = 0
    elseif instance:IsA("SurfaceAppearance") or instance:IsA("MeshPart") then
        if instance:IsA("MeshPart") then
            instance.Material = Enum.Material.SmoothPlastic
        end
    end
end

for _, obj in ipairs(workspace:GetDescendants()) do
    optimizeInstance(obj)
end

for _, obj in ipairs(Lighting:GetDescendants()) do
    if obj:IsA("Atmosphere") or obj:IsA("Sky") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
        obj:Destroy()
    end
end

workspace.DescendantAdded:Connect(function(newObj)
    task.wait()
    if newObj and newObj.Parent then
        optimizeInstance(newObj)
    end
end)

setclipboard("discord.gg/NyvndxAadV")
