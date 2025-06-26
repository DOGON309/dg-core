DGCore = DGCore or {}
DGCore.Function = DGCore.Function or {}

function DGCore.Function.GenerateUUID()
    local random = math.random
    local template = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'

    return string.gsub(template, '[x]', function(c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end
