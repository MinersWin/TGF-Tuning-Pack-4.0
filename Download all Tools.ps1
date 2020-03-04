if ($Internet){
    curl -o Tools.zip root3.minerswin.de/TGF/Tools.zip -UseBasicParsing
    Expand-Archive .\Tools.zip -DestinationPath .\
} else {
    Write-Host "Keine Internetverbindung möglich. Bitte zu einem späteren Zeitpunkt erneut versuchen."
}
