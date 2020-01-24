@{
        Root = '.\GUI.ps1'
        OutputPath = '.\out'
        Package = @{
            Enabled = $true
            Obfuscate = $false
            HideConsoleWindow = $false
            DotNetVersion = 'v4.6.2'
            FileVersion = '1.3.4.7'
            FileDescription = 'TGF Tuning Pack 4.1 by MinersWin'
            ProductName = 'TGF Tuning PAck 4.0'
            ProductVersion = '4.1-beta.4'
            Copyright = '™ by MinersWin'
            RequireElevation = $false
            ApplicationIconPath = '.\Images\favicon.ico'	
            PackageType = 'Console'
        }
        Bundle = @{
            Enabled = $true
            Modules = $true
            # IgnoredModules = @()
        }
    }
    