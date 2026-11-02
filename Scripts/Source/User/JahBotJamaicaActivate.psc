Scriptname JahBotJamaicaActivate extends ObjectReference

; Switch inside Jamaica. Does not touch Piper, Followers quest, or any other NPC.
; The flying bot is the eyebot reference placed in this plugin.
Event OnActivate(ObjectReference akActionRef)
    if akActionRef != Game.GetPlayer()
        return
    endif
    Actor bot = Game.GetFormFromFile(0x0000084F, "JahBlessRadio.esp") as Actor
    if !bot
        return
    endif
    bot.SetCompanion(!bot.IsPlayerTeammate(), true)
EndEvent
