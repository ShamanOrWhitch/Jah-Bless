Scriptname WisdomShafle extends Quest Conditional

Int Property Ct = 0 Auto Conditional

Int Property pt = 0 Auto Conditional

Int Property PPt Auto Conditional

Int Property PPPt Auto Conditional


Function Randomize()

Ct = Utility.RandomInt(0, 10)

if (Ct == pt)
self.Randomize()

elseif (PPt ==  Ct)
self.Randomize()
elseif (PPPt == Ct)
self.Randomize()

else

PPPt = PPt
PPt = Pt
Pt = Ct

EndIf
EndFunction







