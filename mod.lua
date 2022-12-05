local _old_change_health = PlayerDamage.change_health
local _old_regen_timer_max = PlayerDamage.set_regenerate_timer_to_max

local got_hit = false


function PlayerDamage:change_health(...)
    got_hit = true
    return _old_change_health(self, ...)
end


function PlayerDamage:set_regenerate_timer_to_max(...)
    if got_hit then
        got_hit = false
        _old_regen_timer_max(self, ...)
        return
    end
end