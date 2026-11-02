Scriptname JahBotScript extends Actor

bool Property bRadioOn = false Auto
float Property radioFreq = 101.55 Auto Const
float Property radioVol = 1.0 Auto Const
OutputModel Property radioOutputModel Auto Const

GlobalVariable Property MusicVolume Auto
GlobalVariable Property RadioEnabled Auto

Event OnLoad()
    ; ������������� ��������� ������ �� ���������
    MusicVolume.SetValue(0.5)  ; ��������, ������������� ��������� �� �������� �� ������������

    ; �������� �����, ���� bRadioOn = true
    If (bRadioOn && !self.IsDead())
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    Else
        ; ��������� �����, ���� bRadioOn = false
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
    ; Sneak + activate: companion on the bot that is already here. Does not spawn anyone.
    if akActionRef == Game.GetPlayer() && Game.GetPlayer().IsSneaking()
        self.SetCompanion(!self.IsPlayerTeammate(), true)
        return
    endif
    ; ��� ��������� ���� �������� ��� ��������� ����
    bRadioOn = !bRadioOn
    If (bRadioOn)
        RadioEnabled.SetValue(0)  ; ��������� �����
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    Else
        RadioEnabled.SetValue(1)  ; �������� �����
        self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
    EndIf
EndEvent

Event OnDeath(Actor akKiller)
    ; ��������� ����� ��� ������ ����
    RadioEnabled.SetValue(1)  ; �������� �����
EndEvent
Float Property iRadioMusicVolume Auto Const
