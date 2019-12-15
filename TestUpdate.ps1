$RunningVersion = Get-Content Version.txt
#Lädt den Inhalt der Pastebin Seite mit der neusten Version
$Update = Invoke-WebRequest https://raw.githubusercontent.com/MinersWin/TGF-Tuning-Pack-4.0/master/Version.txt
$RunningVersion
$Update.Content
if ($Update.Content -gt $RunningVersion){
    #Wenn Version Älter ist, als die aktuellte Gib Meldung aus
    if ($Language -eq "de-DE"){
    Write-Host "Update Erforderlich: https://tuning-pack.de/"
    $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Update ist Erforderlich, Bitte Update das Programm um die neusten Funktionen und Support zu erhalten. Alte Versionen werden nicht mehr Supportet.","Tuning Pack Updater",'YesNoCancel','Error')
    } else {
        Write-Host "Update available: https://tuning-pack.de/"
    $msgBoxInput = [System.Windows.Forms.MessageBox]::Show("Update is required, Please Update to get new Functions and Support. We won't Supportet Outdatet Versions.","Tuning Pack Updater",'YesNoCancel','Error')
    }
    switch  ($msgBoxInput) {

        'Yes' {
            Write-Output "YES" 
        }
        'No' {
            Write-Output "NO"
        }
        'Cancel' {
            Write-Output "CANCEL"
            $Form1.Close()
        }
    }
} elseif ($Update.Content -lt $RunningVersion) {
    #Wenn Version neuer ist als aktuellste Gib Fehler aus
    if ($Language -eq "de-DE"){
        [System.Windows.Forms.MessageBox]::Show("Fehler, Ausgeführte Version ist aktueller als die Aktuellste Version","Tuning Pack Updater",'OK','Error')
    } else {
        [System.Windows.Forms.MessageBox]::Show("Error, Running Version is newer than latest Version","Tuning Pack Updater",'OK','Error')
    }
    Write-Host "Fehler"
    $Form1.Close()
} else {
    #Wenn Version die Aktuellste ist Gib Hinweis aus und fahre fort
    Write-Host "Everything OK"
    Write-Host "Newest Version is running!"
}