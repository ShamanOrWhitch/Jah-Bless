Scriptname JahBlessRadioShuffleScript extends Quest Conditional

Int Property iCurrentTrack = 0 Auto Conditional
Int Property iPrevTrack = 0 Auto Conditional
Int Property iPrevPrevTrack = 0 Auto Conditional

Function Randomize()

iCurrentTrack = utility.RandomInt(0,49)

if(iCurrentTrack == iPrevTrack)
Self.Randomize()

;Will check to see if the song has been played before.

Elseif(iCurrentTrack == iPrevPrevTrack)
iPrevPrevTrack = iCurrentTrack
Self.Randomize()

;Will double check to see if the track before that track was played to avoid repeating itself

Else

iPrevPrevTrack = iPrevTrack
iPrevTrack = iCurrentTrack

Endif
EndFunction