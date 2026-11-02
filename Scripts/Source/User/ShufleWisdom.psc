Scriptname ShufleWisdom extends Quest Conditional

; Copy of the working Jah Bless randomizer.
; Same property the scene already checks: ::iCurrentTrack_var.
; Wisdom has 11 tracks, so the roll is 0..10, not 0..49.
Int Property iCurrentTrack = 0 Auto Conditional
Int Property iPrevTrack = 0 Auto Conditional
Int Property iPrevPrevTrack = 0 Auto Conditional

Function Randomize()
    iCurrentTrack = Utility.RandomInt(0, 10)
    if (iCurrentTrack == iPrevTrack)
        Self.Randomize()
    ElseIf (iCurrentTrack == iPrevPrevTrack)
        iPrevPrevTrack = iCurrentTrack
        Self.Randomize()
    Else
        iPrevPrevTrack = iPrevTrack
        iPrevTrack = iCurrentTrack
    EndIf
EndFunction
