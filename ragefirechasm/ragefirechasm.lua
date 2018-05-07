RageFireModule = SuuBossMods.dungeonModuleLoader:newModule("Ragefire Chasm", 389)

function RageFireModule:init() 
    self.combatLogEventDispatcher:addEventCallback("SPELL_CAST_START", 119420, RageFireModule.startCast)
    self.combatLogEventDispatcher:addEventCallback("SPELL_CAST_START", 119420, RageFireModule.stopCast)
end

function RageFireModule:unload()
   
end

function RageFireModule:startCast(combatLogEvent) 
    print("Casting " .. combatLogEvent.spellName .. "...")
end

function RageFireModule:stopCast(combatLogEvent) 
    print("Cast " .. combatLogEvent.spellName .. " ended")
end