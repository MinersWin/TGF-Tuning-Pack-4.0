Add-Type -AssemblyName System.Windows.Forms
$GUIFileExists = Test-Path ./GUI.ps1
Write-Host "Wurde das TuningPack ordnungsgemäß entpackt? '$($GUIFileExists)"
if ($GUIFileExists){
    .\GUI.ps1
} else {
    Write-Host "FEHLER"
    [System.Windows.Forms.MessageBox]::Show("Du musst das TuningPack vor dem Ausführen entpacken. Am besten einen neuen Ordner auf dem Desktop erstellen und den Inhalt der .Zip datei hineinziehen.")
}