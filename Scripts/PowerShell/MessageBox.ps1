function SimpleMessageBox{
    Param
    (
        $MessageBoxInfo
    )

    $wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup("$MessageBoxInfo",0,"Done",0x1)
}