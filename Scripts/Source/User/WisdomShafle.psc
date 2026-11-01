Scriptname WisdomShafle extends Quest Conditional

; Запасной шаффл, если фазы сцены смотрят на Ct, а не на Ictrack.
; На квест вешается только один из двух: ShufleWisdom или WisdomShafle.
Int Property Ct = 0 Auto Conditional
Int Property pt = -1 Auto Conditional
Int Property PPt = -1 Auto Conditional

Function Randomize()
    int n = Ct
    int guard = 0
    while guard < 8
        n = Utility.RandomInt(0, 10)
        if (n != pt && n != PPt)
            PPt = pt
            pt = Ct
            Ct = n
            return
        endif
        guard += 1
    endwhile
    PPt = pt
    pt = Ct
    Ct = n
EndFunction
