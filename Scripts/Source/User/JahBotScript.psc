Scriptname JahBotScript extends Actor

bool Property bRadioOn = false Auto
float Property radioFreq = 101.55 Auto Const
float Property radioVol = 1.0 Auto Const
OutputModel Property radioOutputModel Auto Const

GlobalVariable Property MusicVolume Auto
GlobalVariable Property RadioEnabled Auto

Event OnLoad()
    ; Устанавливаем громкость музыки по умолчанию
    MusicVolume.SetValue(0.5)  ; Например, устанавливаем громкость на половину от максимальной

    ; Включаем радио, если bRadioOn = true
    If (bRadioOn && !self.IsDead())
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    Else
        ; Выключаем радио, если bRadioOn = false
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
    ; При активации бота включаем или выключаем звук
    bRadioOn = !bRadioOn
    If (bRadioOn)
        RadioEnabled.SetValue(0)  ; Выключаем радио
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    Else
        RadioEnabled.SetValue(1)  ; Включаем радио
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
    EndIf
EndEvent

Event OnDeath(Actor akKiller)
    ; Выключаем радио при смерти бота
    RadioEnabled.SetValue(1)  ; Включаем радио
EndEvent
Float Property iRadioMusicVolume Auto Const
