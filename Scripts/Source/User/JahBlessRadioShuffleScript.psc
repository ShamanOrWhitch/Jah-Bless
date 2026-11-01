Scriptname JahBlessRadioShuffleScript extends Quest Conditional

; Jah Bless: 50 дорожек, индексы 0..49.
; Частоту станции не трогать.
Int Property iCurrentTrack = 0 Auto Conditional
Int Property iPrevTrack = -1 Auto Conditional
Int Property iPrevPrevTrack = -1 Auto Conditional

Function Randomize()
    int n = iCurrentTrack
    int guard = 0
    while guard < 8
        n = Utility.RandomInt(0, 49)
        if (n != iPrevTrack && n != iPrevPrevTrack)
            iPrevPrevTrack = iPrevTrack
            iPrevTrack = iCurrentTrack
            iCurrentTrack = n
            return
        endif
        guard += 1
    endwhile
    iPrevPrevTrack = iPrevTrack
    iPrevTrack = iCurrentTrack
    iCurrentTrack = n
EndFunction
