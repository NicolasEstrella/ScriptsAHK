#Requires AutoHotkey v2
global suspendido := True
envUserPath := "C:\Users\nicol\Desktop\git AHK\ScriptsAHK\user.env"
envPasswordPath := "C:\Users\nicol\Desktop\git AHK\ScriptsAHK\password.env"

global user := FileRead(envUserPath)
global senha := FileRead(envPasswordPath)

; Liga/Desliga as HotKeys
F1::{
    global suspendido := !suspendido ; The Pause/Break key.
    If (suspendido)
    {
        MsgBox("As HotKeys estão suspensas")
    }
    Else
    {
        MsgBox("As HotKeys não estão suspensas")
    }
}
; Fecha os apps e desliga o pc
F2::
{
    If (!suspendido)
    {
        WinMinimizeAll()
        Sleep(700)
        Click(1337, 675)
        Send("!{F4}")
        Sleep(500)
        Send("{Enter}")
    }
}
;Código para abrir o lol, logar nele, abrir o discord e entrar na call do server do korus
F3::
{
    If (!suspendido)
    {
        Run("C:\Users\nicol\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
        Sleep(100)
        Loop
        { 
            try
            {
                WinMaximize("Discord")
                Sleep(100)
                colorA := PixelGetColor(35, 65)
                ;MsgBox(colorA)
                If (colorA == "0x5865F2" || colorA == "0x313338")
                {
                    ;MsgBox("entrou no if de cor antes do click")
                    Click(35, 65)
                    Sleep(100)
                }
                colorA := PixelGetColor(35, 65)
                ;MsgBox(colorA)
                If (colorA == "0x5865F2")
                {
                    ;MsgBox("entrou no if de cor depois do click")
                    break
                }
            }
            catch as e 
            {
                continue 
            }
        }
        i := 0
        While(i < 14)
        {
            Send("^{Tab}")
            Sleep(400)
            i++
        }
        i := 0
        While(i < 3)
        {
            Sleep(300)
            Send("{Tab}")
            i++
        }
        Sleep(300)
        Send("{Enter}")
        Sleep(100)
        Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\League of Legends.lnk")
        Loop
        { 
            colorA := PixelGetColor(200, 515)
            colorB := PixelGetColor(200, 620)
            If (colorA == "0xFCFCFC" && colorB == "0xF5F5F5")
            {
                break
            }
        }
        Sleep(200)
        Send(user)
        Sleep(250)
        Send("{Tab}")
        Sleep(250)
        Send(senha)
        Sleep(250)
        Send("{Enter}")
    }
}