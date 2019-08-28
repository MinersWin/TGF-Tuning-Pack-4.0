clear
$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Write-Host "$(Get-Date) Skript wird vom Pfad $($MyDir) ausgeführt"
Write-Host "$(Get-Date) Die Installation des The Geek Freaks Tuning Packs 4.0 wird gestartet."
$Speicherort = Read-Host "$(Get-Date) Installationspfad des Tuningpacks: (Standart: C:\Programme\ enter drücken um es dorthin zu installieren"
switch($Speicherort){
    "" {$Speicherort = 'C:\Program Files\'}
    default {}
}
Write-Host "$(Get-Date) Der Installationspfad lautet $($Speicherort)\TuningPack4.0\"
Set-Location $Speicherort
$IneineVariablePackendamitesnichtangezeitwird = New-Item -Path $Speicherort -Name "TuningPack4.0" -ItemType "directory"
Write-Host "$(Get-Date) Der Ordner Namens TuningPack4.0 wird erstellt"
Set-Location "$($MyDir)\..\"
Write-Host "$(Get-Date) Kopiere alle Daten von $($MyDir) zu $($Speicherort)\TuningPack4.0\"
$Files = Get-ChildItem
foreach($File in $Files){
    Copy-Item $File -Destination "$($Speicherort)\TuningPack4.0\"
    Write-Host "$(Get-Date) Die Datei $($File) wird nach $($Speicherort)\TuningPack4.0\ Kopiert." -ForegroundColor Green
}
Copy-Item '.\The Geek Fraks Tuning Pack 4.0.exe' -Destination "$($env:USERPROFILE)\Desktop\"
Write-Host "$(Get-Date) Ein Shortcut auf dem Desktop wurde erstellt." -ForegroundColor Green
Write-Host "$(Get-Date) Die Installation ist abgeschlossen. Denk bitte daran, es ist noch eine unfertige Alpha Version ohne alle Funktionen und Garantie, dass alles Funktioniert und nichts kaputt geht!" -BackgroundColor Red -ForegroundColor White
Read-Host  "ENTER zum beenden"