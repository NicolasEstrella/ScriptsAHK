#Requires AutoHotkey v2

global envFilePath := A_ScriptDir . "\.env"

global envVars := ReadEnvFile()
global user := envVars["LeagueUser"]
global senha := envVars["LeaguePassword"]

ReadEnvFile()
{
    envVars := Map()
    content := FileRead(envFilePath)
    for line in StrSplit(content, "`n")
    {
        if(line ~= "^\*#") ; ignora linha de comentário
        {
            continue 
        }
        if(line ~= "^\*#") ; ignora linha vazia
        {
            continue
        }
        parts := StrSplit(line, "=")
        if(parts.Length == 2)
        {
            key := Trim(parts[1])
            content := Trim(parts[2])
            envVars[key] := content
        }
    }
    return envVars
}

global suspendido := True

; Liga/Desliga as HotKeys
F1::{
    global suspendido := !suspendido 
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
; Abre o lol, loga nele, abre o discord e entra na call do server do korus
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
                If (colorA == "0x5865F2" || colorA == "0x313338") ; Verifica se o discord abriu
                {
                    Click(35, 65)
                    Sleep(100)
                }
                colorA := PixelGetColor(35, 65)
                If (colorA == "0x5865F2") ; Verifica se o primeiro ícone do discord no canto superior esquerdo já foi clicado e quebra o loop pra dar sequência no código
                {
                    break
                }
            }
            catch as e 
            {
                continue 
            }
        }
        i := 0
        While(i < 14) ; Ctrl + Tab na quantidade de vezes necessárias para chegar no servidor escolhido
        {
            Send("^{Tab}")
            Sleep(400)
            i++
        }
        i := 0
        While(i < 3) ; Tab na quantidade de vezes necessárias para chegar no canal de voz/texto desejado
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
            If (colorA == "0xFCFCFC" && colorB == "0xF5F5F5") ; Verifica se o client do lol já ta aberto e se já da pra logar na conta
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