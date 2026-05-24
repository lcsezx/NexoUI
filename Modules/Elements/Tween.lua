-- Modules/Utils/Tween.lua
local Tween = {}

function Tween:Create(obj, properties, time, style, direction)
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    local tweenInfo = TweenInfo.new(time, style, direction)
    local tween = game:GetService("TweenService"):Create(obj, tweenInfo, properties)
    return tween
end

function Tween:Play(obj, properties, time, callback)
    local tween = self:Create(obj, properties, time)
    tween:Play()
    if callback then
        tween.Completed:Connect(callback)
    end
    return tween
end

return Tween
