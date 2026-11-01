Scriptname JahRadioOn extends ReferenceAlias

Group Radio_Properties
    float Property radioFreq = 101.55 Auto Const
    {Radio frequency to play, default to 101.55}
    
    float Property radioVol = 1.0 Auto Const
    {Radio volume, default to full volume}
    
    bool Property bRadioOff = false Auto
    {Set to turn the radio off}
    
    OutputModel Property radioOutputModel Auto Const
    {The OutputModel to use. Default: None / Default Object.}
EndGroup

Event OnActivate(ObjectReference akActionRef)
    If (!bRadioOff)
        ; Включаем радио, если не установлен флаг выключения радио
        MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    EndIf
EndEvent

Function MakeRadioReceiver(float freq, float vol, OutputModel model, bool on)
    ; Эта функция должна быть реализована в другом месте.
EndFunction