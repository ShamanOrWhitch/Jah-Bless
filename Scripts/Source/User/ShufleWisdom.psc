Scriptname ShufleWisdom extends Quest Conditional

; Wisdom: 11 файлов, индексы 0..10.
; Сцена должна смотреть на Ictrack. Частоту не менять.
Int Property Ictrack = 0 Auto Conditional
Int Property iPtrack = -1 Auto Conditional
Int Property iPPrev = -1 Auto Conditional

Function Randomize()
    int n = Ictrack
    int guard = 0
    while guard < 8
        n = Utility.RandomInt(0, 10)
        if (n != iPtrack && n != iPPrev)
            iPPrev = iPtrack
            iPtrack = Ictrack
            Ictrack = n
            return
        endif
        guard += 1
    endwhile
    iPPrev = iPtrack
    iPtrack = Ictrack
    Ictrack = n
EndFunction
