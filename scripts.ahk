; Win+R --> taskschd.msc --> a tarefa de inicialização ta la dentro

#Requires AutoHotkey v2
global suspendido := True
global user := "Nikkolau23"
global senha := "estrella123"

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
F2::
{
    If (!suspendido)
    {
        WinMinimizeAll()
        Sleep(200)
        Click(1337, 675)
        Send("!{F4}")
        Sleep(100)
        Send("{Enter}")
    }
}
F3::
{
    If (!suspendido)
    {
        Send("{LWin}")
        Sleep(250)
        Send("League of Legends")
        Sleep(250)
        Send("{Enter}")
        Sleep(10000)
        Send(user)
        Sleep(250)
        Send("{Tab}")
        Sleep(250)
        Send(senha)
        Sleep(250)
        Send("{Enter}")
    }
}