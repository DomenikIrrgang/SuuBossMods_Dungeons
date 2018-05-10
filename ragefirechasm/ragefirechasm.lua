RageFireModule = SuuBossMods.dungeonModuleLoader:newModule("Ragefire Chasm", 389)

--[[function RageFireModule:load() 
    self:addEventCallback("SPELL_CAST_START", 116670, RageFireModule.startCast)
    self:addEventCallback("SPELL_CAST_SUCCESS", 116670, RageFireModule.stopCast)
end--]]

function RageFireModule:getAnnounceCastX()
    return self:getSettings().announceCastX
end

function RageFireModule:setAnnounceCastX(announceCastX)
    self:getSettings().announceCastX = announceCastX
end

function RageFireModule:setAnnounceCastXDuration(duration) 
    self:getSettings().announceCastXDuration = duration
end

function RageFireModule:getAnnounceCastXDuration()
    return self:getSettings().announceCastXDuration
end

function RageFireModule:startCast(combatLogEvent)
    if (self:getSettings().announceCastX == true) then
        self.messageId = SuuBossMods.messageDisplay:showMessage("Casting Vivify...", self:getSettings().announceCastXDuration)
    end
end

function RageFireModule:stopCast(combatLogEvent)
    SuuBossMods.messageDisplay:showMessage("Vivify casted!", 2)
end

function SuuBossMods_DungeonModule:getDefaultSettings()
    return {
        announceCastX = true,
        announceCastXDuration = 1.34,
        spellData = {},
    }
end

RageFireModule:addOption("Announce CastX", "Will print a message when cast X is being cast.", "toggle", RageFireModule.getAnnounceCastX, RageFireModule.setAnnounceCastX)
RageFireModule:addOption("Announce CastX Duration", "Duration of the message to be shown", "range", RageFireModule.getAnnounceCastXDuration, RageFireModule.setAnnounceCastXDuration, "full", 1, 3, 0.1)
