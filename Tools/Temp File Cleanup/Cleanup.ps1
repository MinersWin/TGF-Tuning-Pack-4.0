$TempFileLocation = "$env:windir\Temp","$env:TEMP"
$SoftwareDistributionLocation = "$env:windir\SoftwareDistribution\Download"

$TempFile = Get-ChildItem $TempFileLocation -Recurse
$TempFileCount = ($TempFile).count

if($TempFileCount -eq "0") { 
Write-Host "There are no files in the folder $TempFileLocation" -ForegroundColor Green
}
Else {
$TempFile | Remove-Item -Confirm:$false -Recurse -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
Write-Host "Cleared $TempFileCount files in the folder $TempFileLocation" -ForegroundColor Green
}

$SoftwareDistribution = Get-ChildItem $SoftwareDistributionLocation -Recurse
$SoftwareDistributionCount = ($SoftwareDistribution).Count
if($SoftwareDistributionCount -eq "0"){
Write-Host " There are no files in the folder $SoftwareDistributionLocation" -ForegroundColor Green
}
Else
{
$SoftwareDistribution | Remove-Item -Confirm:$false -Recurse -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
Write-Host "Cleared $SoftwareDistributionCount files in the folder $SoftwareDistributionLocation" -ForegroundColor Green
}