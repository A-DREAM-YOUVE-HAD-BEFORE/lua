local KEYCODE = getgenv().KEY_NAME

local UserInputService = cloneref(game:GetService([[UserInputService]]))
local LcPlayer = cloneref(game:FindService([[Players]]).LocalPlayer)

local p_BoxingShuffle = (function()
    for _, v in next, getgc(true) do
        if type(v) == "table" and type(rawget(v, "Boxing Shuffle")) == "function" then
            return v["Boxing Shuffle"]
        end
    end
    return nil
end)()
assert(p_BoxingShuffle, "UNKNOWN_FUNCTION")

UserInputService.InputBegan:Connect(function(Input, _p)
    if not _p and Input.KeyCode.Name == KEYCODE and LcPlayer.Character then
        p_BoxingShuffle({
            Windup_Speed = 0.8,
            Windup_Duration = 0.4,
            ExtraDashPower = 1,
            Origin = LcPlayer.Character.HumanoidRootPart
        })
    end
end)
