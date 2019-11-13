@"
@{
    Name = 'explorer.exe'
    Length = 4532304
    DirectoryName = 'C:\Windows'
    VersionInfo = @{
      ProductVersion = '10.0.10240.16384'
    }
}
"@ | Out-File -FilePath .\Config.psd1

# Read the file
$File = Import-LocalizedData -BaseDirectory .\ -FileName Config.psd1

# Drill down.
$File.VersionInfo.ProductVersion