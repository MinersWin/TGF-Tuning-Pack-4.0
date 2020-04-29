@{
        Root = 'c:\Users\TGF_Tuned\Documents\GitHub\TGF-Tuning-Pack-4.0\The Geek Fraks Tuning Pack 4.0.ps1'
        OutputPath = 'c:\Users\TGF_Tuned\Documents\GitHub\TGF-Tuning-Pack-4.0\out'
        Package = @{
            Enabled = $true
            Obfuscate = $false
            HideConsoleWindow = $false
            DotNetVersion = 'v4.6.2'
            FileVersion = '1.0.0'
            FileDescription = ''
            ProductName = ''
            ProductVersion = ''
            Copyright = ''
            RequireElevation = $false
            ApplicationIconPath = ''
            PackageType = 'Console'
        }
        Bundle = @{
            Enabled = $true
            Modules = $true
            # IgnoredModules = @()
        }
    }
    