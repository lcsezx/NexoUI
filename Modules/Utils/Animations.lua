-- Modules/Utils/Animations.lua
local Animations = {}

function Animations:FadeIn(obj, duration, callback)
    duration = duration or 0.2
    local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(duration), {BackgroundTransparency = 0, TextTransparency = 0})
    tween:Play()
    if callback then tween.Completed:Connect(callback) end
    return tween
end

function Animations:FadeOut(obj, duration, callback)
    duration = duration or 0.2
    local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(duration), {BackgroundTransparency = 1, TextTransparency = 1})
    tween:Play()
    if callback then tween.Completed:Connect(callback) end
    return tween
end

function Animations:Scale(obj, scale, duration, callback)
    duration = duration or 0.1
    local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(duration), {Size = scale})
    tween:Play()
    if callback then tween.Completed:Connect(callback) end
    return tween
end

function Animations:Slide(obj, position, duration, callback)
    duration = duration or 0.2
    local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = position})
    tween:Play()
    if callback then tween.Completed:Connect(callback) end
    return tween
end

function Animations:Shake(obj, intensity, duration)
    intensity = intensity or 5
    duration = duration or 0.3
    local originalPos = obj.Position
    local steps = 10
    local stepTime = duration / steps
    
    for i = 1, steps do
        task.wait(stepTime)
        local offset = UDim2.new(0, math.random(-intensity, intensity), 0, math.random(-intensity, intensity))
        obj.Position = originalPos + offset
    end
    obj.Position = originalPos
end

return Animations
