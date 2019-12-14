$MyDir = Split-Path $script:MyInvocation.MyCommand.Path
Set-Location $MyDir
$tooltip = New-Object System.Windows.Forms.ToolTip
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'GUI.designer.ps1')
$Config = Import-LocalizedData -BaseDirectory .\Config\ -FileName Config.psd1
Write-Output "
___________ __                                    __     ___________                      __            
\__    ___/|  |__   ____      ____   ____   ____ |  | __ \_   _____/______   ____ _____  |  | __  ______
  |    |   |  |  \_/ __ \    / ___\_/ __ \_/ __ \|  |/ /  |    __) \_  __ \_/ __ \\__  \ |  |/ / /  ___/
  |    |   |   Y  \  ___/   / /_/  >  ___/\  ___/|    <   |     \   |  | \/\  ___/ / __ \|    <  \___ \ 
  |____|   |___|  /\___  >  \___  / \___  >\___  >__|_ \  \___  /   |__|    \___  >____  /__|_ \/____  >
                \/     \/  /_____/      \/     \/     \/      \/                \/     \/     \/     \/
                ___________           .__                                      __        _____    _______   
                \__    ___/_ __  ____ |__| ____    ____   ___________    ____ |  | __   /  |  |   \   _  \  
                  |    | |  |  \/    \|  |/    \  / ___\  \____ \__  \ _/ ___\|  |/ /  /   |  |_  /  /_\  \ 
                  |    | |  |  /   |  \  |   |  \/ /_/  > |  |_> > __ \\  \___|    <  /    ^   /  \  \_/   \
                  |____| |____/|___|  /__|___|  /\___  /  |   __(____  /\___  >__|_ \ \____   | /\ \_____  /
                                    \/        \//_____/   |__|       \/     \/     \/      |__| \/       \/                                                                                
 _             __  __ _                  __          ___       
| |           |  \/  (_)                 \ \        / (_)      
| |__  _   _  | \  / |_ _ __   ___ _ __ __\ \  /\  / / _ _ __  
| '_ \| | | | | |\/| | | '_ \ / _ \ '__/ __\ \/  \/ / | | '_ \ 
| |_) | |_| | | |  | | | | | |  __/ |  \__ \\  /\  /  | | | | |
|_.__/ \__, | |_|  |_|_|_| |_|\___|_|  |___/ \/  \/   |_|_| |_|
        __/ |                                                  
       |___/     
The Geek Freaks Tuning Pack 4.0 Update 13.12.2019
Download the newest Version: https://Github.com/MinersWin/TGF-Tuning-Pack-4.0
WE ASSUME NO RESPONSIBILITY FOR PROBLEMS WHICH COME WITH THE EXECUTION OF OUR PROGRAM!
This is a hobby project! Everything can create errors and problems! Use at your own risk!
WIR ÜBERNEHMEN KEINE VERANTWORTUNG FÜR PROBLEME DIE MIT DER AUSFÜHRUNG UNSERES PROGRAMMS EINHERGEHEN!
Das hier ist ein Hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr!
"
##################################################################################################################################################################################
[System.Windows.Forms.MessageBox]::Show("Dies ist noch eine sehr frühe Alpha Version. Die Tweaks sind zum Teil noch nicht funktionsfähig.","The Geek Freaks Tuning Pack 4.0 by MinersWin",1)
$TabPage7.Enabled = $false
.\Settings.ps1

$Form1.Text = $Config.Application.Name
$TextBox6.Text = $Config.Directory.Logs
$TextBox7.Text = $Config.Directory.Tools
$TextBox8.Text = $Config.Directory.Backup
$TextBox9.Text = $Config.Directory.Updates
$TextBox10.Text = $Config.Directory.Scripts

#Icon
$bitmap = [System.Drawing.Bitmap]::FromFile($Config.Application.Icon)
$bitmap.MakeTransparent()
$hicon = $bitmap.GetHicon()
$Form1.Icon = [system.drawing.icon]::FromHandle($hicon)


#Alles Ausgrauen
$Panel1.Enabled = $false
$Panel3.Enabled = $false
$TabPage1.Enabled = $false
$TabPage2.Enabled = $false
$TabPage4.Enabled = $false
$Button15.Enabled = $false
$CheckBox62.Enabled = $false
$CheckBox61.Enabled = $false
$Button16.Enabled = $false
$TabPage1.visible = $false
$TabPage2.visible = $false
$TabPage4.Visible = $false
$TabPage5.Enabled = $false
$TabPage5.Visible = $false
$TabPage6.Enabled = $false
$TabPage6.Visible = $false
$TabPage8.Enabled = $false
$TabPage8.Visible = $false
$TabPage7.Enabled = $false
$TabPage7.Enabled = $false

#Geek Freaks Logo
$Picture = $Config.Application.Logo
$img = [System.Drawing.Image]::Fromfile($Picture)
$PictureBox1.Image = $img
$PictureBox1.Add_Click({About})

#German Language Image
$Picture2 = ".\Images\German.jpg"
$img2 = [System.Drawing.Image]::Fromfile($Picture2)
$Button14.BackgroundImage = $img2
$Button14.Text = ""


#English Language Image
$Picture3 = ".\Images\English.jpg"
$img3 = [System.Drawing.Image]::Fromfile($Picture3)
$Button13.BackgroundImage = $img3
$Button13.Text = ""

#Internet Explorer Icon
$IEIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-Internet-Explorer.ico"
$Button4.Image = ([System.Drawing.Image]::FromFile($IEIcon))
$ToolTip_IE = New-Object System.Windows.Forms.ToolTip
$ToolTip_IE.SetToolTip($Button4,"Executes only on Internet Explorer V7 and up. Runs the built-in Windows tool to clean and reset Internet Explorer")
#CCleaner Icon
$CCIcon = ".\Images\tron_icon\Cornmanthe3rd-Plex-Other-CCleaner.ico"
$Button20.Image = ([System.Drawing.Image]::FromFile($CCIcon))
$ToolTip_CCleaner = New-Object System.Windows.Forms.ToolTip
$ToolTip_CCleaner.SetToolTip($Button20,"CCleaner utility by Pitiform. Used to clean temp files before running AV scanners. Note that CCleaner wipes %AppData% Local Storage.")
#BleachBit Icon
$BBIcon = ".\Images\tron_icon\favicon (1).ico"
$Button21.Image = ([System.Drawing.Image]::FromFile($BBIcon))
$ToolTip_Bleachbit = New-Object System.Windows.Forms.ToolTip
$ToolTip_Bleachbit.SetToolTip($Button21,"Bleachbit utility. Used to clean temp files before running AV scanners.")
#Temp File Cleanup Icon
$TFCIcon = ".\Images\tron_icon\Hopstarter-Soft-Scraps-File-Delete.ico"
$Button22.Image = ([System.Drawing.Image]::FromFile($TFCIcon))

#USB Device Cleanup Icon
$USBIcon = ".\Images\tron_icon\Icons-Land-Vista-Hardware-Devices-USB-Flash-Card-With-Card-Reader.ico"
$Button23.Image = ([System.Drawing.Image]::FromFile($USBIcon))

#Cleanup Download
$DownloadIcon = ".\Images\tron_icon\Dakirby309-Windows-8-Metro-Folders-OS-Downloads-Folder-Metro.ico"
$Button24.Image = ([System.Drawing.Image]::FromFile($DownloadIcon))

#Event Log Cleanup Icon
$EventsIcon = ".\Images\tron_icon\Pelfusion-Flat-File-Type-Log.ico"
$Button25.Image = ([System.Drawing.Image]::FromFile($EventsIcon))

#Clear Windows Update Cache Icon
$UpdateIcon = ".\Images\tron_icon\Oxygen-Icons.org-Oxygen-Actions-edit-clear-history.ico"
$Button26.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Clear CryptNet SSL Cache Icon
$UpdateIcon = ".\Images\tron_icon\Roundicons-100-Free-Solid-Ssl-screen.ico"
$Button7.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Malwarebytes Icon
$UpdateIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-MalwareBytes.ico"
$Button8.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Kaspersky Icon
$UpdateIcon = ".\Images\tron_icon\Hopstarter-3d-Cartoon-Vol3-Kaspersky.ico"
$Button9.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Sophos Icon
$UpdateIcon = ".\Images\tron_icon\Blackvariant-Button-Ui-Requests-2-Sophos.ico"
$Button10.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Page File Reset Icon
$UpdateIcon = ".\Images\tron_icon\Treetog-Junior-Folder-documents.ico"
$Button32.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Defraggler Icon
$UpdateIcon = ".\Images\tron_icon\Dakirby309-Simply-Styled-Defraggler.ico"
$Button33.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#MSI installer cleanup Icon
$UpdateIcon = ".\Images\tron_icon\Celldrifter-Muku-Style-Sys-Installer.ico"
$Button11.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#System File Checker Icon
$UpdateIcon = ".\Images\tron_icon\Tpdkdesign.net-Refresh-Cl-System-Files-Download.ico"
$Button12.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#DISM image check and repair Icon
$UpdateIcon = ".\Images\tron_icon\Vexels-Office-Disc.ico"
$Button27.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#chkdsk Icon
$UpdateIcon = ".\Images\tron_icon\Treetog-Junior-Document-console.ico"
$Button28.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Network Repair Icon
$UpdateIcon = ".\Images\tron_icon\Iconshock-Vista-General-Network.ico"
$Button30.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#File extension repair Icon
$UpdateIcon = ".\Images\tron_icon\Royalflushxx-Systematrix-Document.ico"
$Button31.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#ADSSpy Icon
$UpdateIcon = ".\Images\tron_icon\Hopstarter-Malware-Delete.ico"
$Button34.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#AdwCleaner Icon
$UpdateIcon = ".\Images\tron_icon\Igh0zt-Ios7-Style-Metro-Ui-MetroUI-Apps-Avast-Antivirus.ico"
$Button35.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#aswMBR Icon
$UpdateIcon = ".\Images\tron_icon\Chrisbanks2-Cold-Fusion-Hd-Cpu-spy.ico"
$Button36.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#autorun Icon
$UpdateIcon = ".\Images\tron_icon\Franksouza183-Fs-Places-folder-windows.ico"
$Button37.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#PChunter Icon
$UpdateIcon = ".\Images\tron_icon\favicon.ico"
$Button38.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Net Adapter Repair Icon
$UpdateIcon = ".\Images\tron_icon\Oxygen-Icons.org-Oxygen-Actions-network-connect.ico"
$Button40.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Kill Process Icon
$UpdateIcon = ".\Images\tron_icon\Icons8-Ios7-Logos-System-Task.ico"
$Button3.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#ParkControl Icon
$UpdateIcon = ".\Images\tron_icon\parkcontrol.ico"
$Button29.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Systemwiederherstellung Icon
$UpdateIcon = ".\Images\tron_icon\Icons8-Windows-8-Database-Recovery.ico"
$Button39.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))

#Reboot to Recovery Icon
$UpdateIcon = ".\Images\tron_icon\shutdown-icon (1).png"
$Button42.Image = ([System.Drawing.Image]::FromFile($UpdateIcon))


#All The Tools CHECK
$Tools = Test-Path .\Tools
if ($Tools){
    $Label18.ForeColor = "GREEN"
    $Label18.Text = "Tools found"
    $Panel8.Enabled = $true
    $Panel9.Enabled = $true
    $Panel10.Enabled = $true
    $Panel11.Enabled = $true
    $Panel12.Enabled = $true
} else {
    $Label18.ForeColor = "RED"
    $Label18.Text = "Could not find the tools, please download first."
    $Panel8.Enabled = $false
    $Panel9.Enabled = $false
    $Panel10.Enabled = $false
    $Panel11.Enabled = $false
    $Panel12.Enabled = $false
}



#Download Tools
$Button5.Add_Click({Start-Process PowerShell.exe "Write-Output 'Der Download Startet, dies kann je nach Internetgeschwindigkeit ca. 5-10 Minuten dauern. (500MB)'; Write-Output 'The download starts, this may take about 5-10 minutes, depending on the internet speed. (500MB)'; & '.\Download all Tools.ps1'"})

#Accept the Risk
$Button18.Add_Click{(Accept-Everything)}
function Accept-Everything{
    if ($CheckBox63.Checked){
        $TabPage3.Enabled = $false
        $Panel1.Enabled = $true
        $Panel3.Enabled = $true
        $TabPage1.Enabled = $true  
        $TabPage2.Enabled = $true
        $TabPage4.Enabled = $true
        $Button15.Enabled = $true
        $CheckBox62.Enabled = $true
        $CheckBox61.Enabled = $true
        $Button16.Enabled = $true  
        $TabPage1.visible = $true
        $TabPage2.visible = $true
        $TabPage4.Visible = $true
        $TabPage3.Visible = $true
        $TabPage5.Enabled = $true
        $TabPage5.Visible = $true
        $TabPage6.Enabled = $true
        $TabPage6.Visible = $true
        $TabPage8.Enabled = $true
        $TabPage8.Visible = $true
        $TabPage7.Enabled = $true
        $TabPage7.Enabled = $true
        $TabControl1.SelectedTab = $TabPage1
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please Accept | Bitte Akzeptieren","TGF Tuning Pack 4.0",1)
    }
}

#Write Risk Labels
$Label6.Text = "English:    "
$Label7.Text = "We do not take responsibility for problems that accompany the execution of our program! This is a hobby project! Everything can create errors and problems! Use at your own risk! Problems and bugs are welcome in the Discord: https://discordapp.com/invite/k5kMSa    "
$Label8.Text = "German: "
$Label9.Text = "Wir übernehmen keine Verantwortung für Probleme, die mit der Ausführung unseres Programms einhergehen! Dies ist ein hobbyprojekt! Alles kann Fehler und Probleme erzeugen! Benutzung auf eigene Gefahr! Probleme und Bugs können gerne im Discord gemeldet werden: https://discordapp.com/invite/k5kMSa "
$CheckBox61.Text = "Create System Recovery Point"

#Close when Click Close
$button17.Add_Click{($Form1.Close())}

#Open Tool Folder
$Button6.Add_Click{(Start "$($MyDir)\")}

#Make Everything German
$Button14.Add_Click{(Make-German)}
.\Update-Englisch.ps1
function Make-German{
    .\Update-German.ps1
}

#Translate to English
$Button13.Add_Click{(Make-English)}
function Make-English{
    .\Update-Englisch.ps1
}

#Add Ninite
$Button19.Add_Click{(.\Ninite\Ninite.ps1)}

#ComboBox Templates
$ComboBox1.Items.Add("Best Performance")
$ComboBox1.Items.Add("Maximum Battery Life")
$ComboBox1.Items.Add("Maximum Privacy")
$ComboBox1.Items.Add("Recommended")
$ComboBox1.Items.Add("Clear")
$ComboBox1.Items.Add("ULTIMATE PERFORMANCE")
$ComboBox1.SelectedItem = "Recommended"
$ComboBox2.Items.Add("Best Performance")
$ComboBox2.Items.Add("Maximum Battery Life")
$ComboBox2.Items.Add("Maximum Privacy")
$ComboBox2.Items.Add("Recommended")
$ComboBox2.Items.Add("ULTIMATE PERFORMANCE")
$ComboBox2.SelectedItem = $Config.Application.Standart_Template

#Progressbar Reset
$ProgressBar1.Value = 0
$Label11.Text = "0%"
$Label12.Text = "The Tweaks havent started yet. Click on 'Make FPS Rain!' to Start the Process!"

###################################################################################################################################################################################
#Main Tweak Function
###################################################################################################################################################################################
$Button16.Add_Click{(Make-Tweaks)}
function Make-Tweaks{
    #Create RecoveryPoint
    if ($CheckBox61.Checked){
        wmic /namespace:\\root\default path SystemRestore call Enable C:\
        Write-Output "Die erstellung von Wiederherstellungspunkten wurde aktiviert"
        Checkpoint-Computer -Description 'TGF_Tuning_Pack_4' -RestorePointType MODIFY_SETTINGS
        $Date = Get-Date
        Write-Output "Der Wiederherstellungspunkt wurde erstellt. Er trägt den Namen: $($Date) TGF Tuning Pack"
    }


    #Show Desktop Icon on Desktop
    if ($CheckBox1.Checked){
        reg import .\Scripts\Registry\Add_This-PC_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
        Write-Output "The registry entry is added. The icon of 'This Computer' is now visible on the desktop."
    }
    #Show Network Icon on Desktop
    if ($CheckBox2.Checked){
        reg import .\Scripts\Registry\Add_Network_Desktop_Icon.reg
        $ProgressBar1.Value = 1
        $Label11.Text = "1%"
        $Label12.Text = "The registry entry is added. The icon of 'Network' is now visible on the desktop."
        Write-Output "The registry entry is added. The icon of 'Network' is now visible on the desktop."
    }
    #Classic vertical Icon spacing
    if ($CheckBox3.Checked){
        reg import .\Scripts\Registry\Reset_Classic_Vertica_Icon_Spacing.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "The default vertical icon spacing for the desktop is now set."
        Write-Output "The default vertical icon spacing for the desktop is now set."
    }
    #Enable the ability to lock and unlock the taskbar
    if ($CheckBox4.Checked){
        reg import .\Scripts\Registry\Enable_ability_to_lock_and_unlock_taskbar.reg
        $ProgressBar1.Value = 2
        $Label11.Text = "2%"
        $Label12.Text = "Enable the Ability to lock and unlock the Taskbar."
        Write-Output "Enable the Ability to lock and unlock the Taskbar."
    }
    if ($CheckBox5.Checked){
        reg import .\Scripts\Registry\Enable_Always_show_all_notification_area_icons_for_all_users.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Always show all Taskbar Icons and Notifications and restart explorer.exe"
        Write-Output "Always show all Taskbar Icons and Notifications and restart explorer.exe"
    }
    if ($CheckBox6.Checked){
        reg import .\Scripts\Registry\Change-Delay-Time-Show-Taskbar-Thumbnails-to-10-sec.reg
        $ProgressBar1.Value = 3
        $Label11.Text = "3%"
        $Label12.Text = "Change the Time to Show Taskbar Thumbnails to 10 sec."
        Write-Output "Change the Time to Show Taskbar Thumbnails to 10 sec."
    }
    if ($CheckBox7.Checked){
        reg import .\Scripts\Registry\Enable_Control_Panel_and_Settings.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Enable Classic Control Panel View."
        Write-Output "Enable Classic Control Panel View."
    }
    if ($CheckBox8.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 4
        $Label11.Text = "4%"
        $Label12.Text = "Turn of Sticky Keys."
        Write-Output "Turn of Sticky Keys."
    }
    if ($CheckBox9.Checked){
        reg import .\Scripts\Registry\Permanently-disabling-sticky-keys.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Turn of Filter Keys."
        Write-Output "Turn of Filter Keys."
    }
    if ($CheckBox10.Checked){
        reg import .\Scripts\Registry\Disable_Hibernate.reg
        $ProgressBar1.Value = 5
        $Label11.Text = "5%"
        $Label12.Text = "Disable Hibernation."
        Write-Output "Disable Hibernation."
    }
    if ($CheckBox11.Checked){
        reg import .\Scripts\Registry\Turn_ON_underline_keyboard_shortcuts_in_menus.reg
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Turned On the Underline of KeyBoard Shortcuts in Menus."
        Write-Output "Turned On the Underline of KeyBoard Shortcuts in Menus."
    }
    if ($CheckBox12.Checked){
        .\Scripts\Registry\Show_Known_Extensions_for_File_Types.vbs
        $ProgressBar1.Value = 6
        $Label11.Text = "6%"
        $Label12.Text = "Show Known File Extensions for File Types."
        Write-Output "Show Known File Extensions for File Types"
    }
    if ($CheckBox13.Checked){
        reg import .\Scripts\Registry\hide-ntfs-compression-blue-double-arrow-icon-overlay.reg
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Hide indication for compressed NTFS Files"
        Write-Output "Hide indication for compressed NTFS Files"
    }
    if ($CheckBox14.Checked){
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 7
        $Label11.Text = "7%"
        $Label12.Text = "Show every Hidden File in Windows Explorer"
        Write-Output = "Show every Hidden File in Windows Explorer"
    }
    if ($CheckBox15.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Show Super Hidden Files in Windows Explorer"
        Write-Output = "Show Super Hidden Files in Windows Explorer"
    }
    if ($CheckBox17.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe" /v "Debugger" /t REG_SZ /d "cmd.exe" /f
        $ProgressBar1.Value = 8
        $Label11.Text = "8%"
        $Label12.Text = "Replace Utilman with CMD"
        Write-Output = "Replace Utilman with CMD"
    }
    if ($CheckBox18.Checked){
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Add the option Processor performance core parking min core."
        Write-Output = "Add the option Processor performance core parking min core."
    }
    if ($CheckBox19.Checked){
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 9
        $Label11.Text = "9%"
        $Label12.Text = "Disable CPU Core Parking"
        Write-Output = "Disable CPU Core Parking"
    }
    if ($CheckBox20.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
        Write-Output = "Remove Logon screen wallpaper/background. Will use solid color instead (Accent color)"
    }
    if ($CheckBox21.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 10
        $Label11.Text = "10%"
        $Label12.Text = "Disable Lockscreen"
        Write-Output = "Disable Lockscreen"
    }
    if ($CheckBox22.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v NoPreviousVersionsPage /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Remove versioning tab from properties"
        Write-Output = "Remove versioning tab from properties"
    }
    if ($CheckBox23.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 11
        $Label11.Text = "11%"
        $Label12.Text = "Disable jump lists"
        Write-Output = "Disable jump lists"
    }
    if ($CheckBox24.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disable Windows Error Reporting"
        Write-Output = "Disable Windows Error Reporting"
    }
    if ($CheckBox25.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 12
        $Label11.Text = "12%"
        $Label12.Text = "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
        Write-Output = "Disable Cortana (Speech Search Assistant, which also sends information to Microsoft"
    }
    if ($CheckBox26.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for."
        Write-Output = "Hide the search box from taskbar. You can still search by pressing the win key and start typing what you are looking for"
    }
    if ($CheckBox27.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 13
        $Label11.Text = "13%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Output = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox29.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
        Write-Output = "Disable MRU lists (jump lists) of XAML apps in Start Menu"
    }
    if ($CheckBox30.Checked){
        reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 14
        $Label11.Text = "14%"
        $Label12.Text = "Disable creation of an Advertising ID"
        Write-Output = "Disable creation of an Advertising ID"
    }
    if ($CheckBox31.Checked){
        reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
        reg delete "HKEY_CLASSES_ROOT\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /f
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Remove Pin to start"
        Write-Output = "Remove Pin to start"
    }
    if ($CheckBox32.Checked){
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 15
        $Label11.Text = "15%"
        $Label12.Text = "Disable Cortana, Bing Search and Searchbar"
        Write-Output = "Disable Cortana, Bing Search and Searchbar"
    }
    if ($CheckBox33.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Turn off the Error Dialog"
        Write-Output = "Turn off the Error Dialog"
    }
    if ($CheckBox34.Checked){
        reg add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f
        reg add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 16
        $Label11.Text = "16%"
        $Label12.Text = "Disable Administrative shares"
        Write-Output = "Disable Administrative shares"
    }
    if ($CheckBox35.Checked){
    #    %SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" -ot reg -actn setowner -ownr "n:Administrators" -rec yes
    #    %SystemRoot%\System32\setaclx64 -on "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" -ot reg -actn ace -ace "n:Administrators;p:full" -rec yes
    #    reg add "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Reboot to Recovery" /v "Icon" /t REG_SZ /d "%SystemRoot%\System32\imageres.dll,-110" /f
    #    reg add "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Reboot to Recovery\command" /ve /d "shutdown.exe -r -o -f -t 00" /f
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Add Reboot to Recovery to right-click menu of This PC"
        Write-Output = "Add Reboot to Recovery to right-click menu of This PC"
    }
    if ($CheckBox36.Checked){
        reg add "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "0" /f
        reg add "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "1" /f
        reg add "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
        reg add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "yyyy/MM/dd" /f
        reg add "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "HH:mm" /f
        reg add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "H:mm:ss" /f
        $ProgressBar1.Value = 17
        $Label11.Text = "17%"
        $Label12.Text = "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
        Write-Output = "Change Clock and Date formats of current user to 24H, metric (Sign out required to see changes)"
    }
    if ($CheckBox37.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Enable Developer Mode (enables you to run XAML apps you develop in visual Studio which havent been certified yet)"
        Write-Output = "Enable Developer Mode (enables you to run XAML apps you develop in Visual Studio which havent been certified yet)"
    }
    if ($CheckBox38.Checked){
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!dss-winrt-telemetry.js" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry.js" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-event_8ac43a41e5030538" /t REG_DWORD /d 0 /f
        reg add "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-inter_58073761d33f144b" /t REG_DWORD /d 0 /f

        reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
        $ProgressBar1.Value = 18
        $Label11.Text = "18%"
        $Label12.Text = "Remove telemetry and data collection"
        Write-Output = "Remove telemetry and data collection"
    }
    if ($CheckBox28.Checked){
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Set Windows Explorer to start on This PC instead of Quick Access"
        Write-Output = "Set Windows Explorer to start on This PC instead of Quick Access"
    }
    if ($CheckBox16.Checked){
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d 1 /f
        $ProgressBar1.Value = 19
        $Label11.Text = "19%"
        $Label12.Text = "Prevent both Windows and Office from creating LNK files in the Recents folder"
        Write-Output = "Prevent both Windows and Office from creating LNK files in the Recent folder"
    }
    #
    # Removing Services tab
    #
    if ($CheckBox39.Checked){
        & '.\Scripts\Removing Services\DisableConnectedUserExperiencesandTelemetry.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
        Write-Output = "Disable Connected User Experiences and Telemetry (To turn off Telemetry and Data collection)"
    }
    if ($CheckBox40.Checked){
        & '.\Scripts\Removing Services\DisableDiagnosticPolicyService.bat'
        $ProgressBar1.Value = 20
        $Label11.Text = "20%"
        $Label12.Text = "Disable Diagnostic Policy Service"
        Write-Output = "Disable Diagnostic Policy Service"
    }
    if ($CheckBox41.Checked){
        & '.\Scripts\Removing Services\DisableDistributedLinkTrackingClient.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
        Write-Output = "Disable Distributed Link Tracking Client (If your computer is not connected to any network)"
    }
    if ($CheckBox42.Checked){
        & '.\Scripts\Removing Services\DisableWAPPushMessageRoutingService.bat'
        $ProgressBar1.Value = 21
        $Label11.Text = "21%"
        $Label12.Text = "Disable WAP Push Message Routing Service (To turn off Telemetry and Data Collection)"
        Write-Output = "Disable WAP Push Message Routing Service (To Turn off Telemetry and Data Collection)"
    }
    if ($CheckBox43.Checked){
        & '.\Scripts\Removing Services\DisableDownloadedMapsManager.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disable Downloaded Maps Manager (If you dont user Maps app)"
        Write-Output = "Disable Downloaded Maps Manager (If you dont use Maps app)"
    }
    if ($CheckBox44.Checked){
        & '.\Scripts\Removing Services\DisableIPHelper.bat'
        $ProgressBar1.Value = 22
        $Label11.Text = "22%"
        $Label12.Text = "Disable IP Helper (If you dont use IPv6 connection)"
        Write-Output = "Disable IP Helper (If you dont use IPv6 connection)"
    }
    if ($CheckBox45.Checked){
        & '.\Scripts\Removing Services\DisableProgramCompatibilityAssistantService.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disable Program Compatibility Assistant Service"
        Write-Output = "Disable Program Compatibility Assistant Service"
    }
    if ($CheckBox46.Checked){
        & '.\Scripts\Removing Services\DisablePrintSpooler.bat'
        $ProgressBar1.Value = 23
        $Label11.Text = "23%"
        $Label12.Text = "Disable Print Spooler (If you dont have a printer)"
        Write-Output = "Disable Print Spooler (If you dont have a printer)"
    }
    if ($CheckBox47.Checked){
        & '.\Scripts\Removing Services\DisableRemoteRegistry.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disable Remote Registry"
        Write-Output = "Disable Remote Registry"
    }
    if ($CheckBox48.Checked){
        & '.\Scripts\Removing Services\DisableSecondaryLogon.bat'
        $ProgressBar1.Value = 24
        $Label11.Text = "24%"
        $Label12.Text = "Disable Secondary Logon"
        Write-Output = "Disable Secondary Logon"
    }
    if ($CheckBox49.Checked){
        & '.\Scripts\Removing Services\DisableSecurityCenter.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disable Security Center"
        Write-Output = "Disable Security Center"
    }
    if ($CheckBox50.Checked){
        & '.\Scripts\Removing Services\IPNetBIOSHelper.bat'
        $ProgressBar1.Value = 25
        $Label11.Text = "25%"
        $Label12.Text = "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
        Write-Output = "Disable TCP/IP NetBIOS Helper (If you are not in a workgroup network)"
    }
    if ($CheckBox51.Checked){
        & '.\Scripts\Removing Services\DisableTochKeyboardandHandwritingPanelService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
        Write-Output = "Disable Touch Keyboard and Handwriting Panel Service (If you want to use touch keyboard and handwriting features)"
    }
    if ($CheckBox52.Checked){
        & '.\Scripts\Removing Services\DisableWindowsErrorReportingService.bat'
        $ProgressBar1.Value = 26
        $Label11.Text = "26%"
        $Label12.Text = "Disable Windows Error Reporting Service"
        Write-Output = "Disable Windows Error Reporting Service"
    }
    if ($CheckBox53.Checked){
        & '.\Scripts\Removing Services\DisableWindowsImageAcquisition.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disable Windows Image Acquisition (WIA) (If you dont have a scannner)"
        Write-Output = "Disable Windows Image Acquisition (WIA) (If you dont have a scanner)"
    }
    if ($CheckBox54.Checked){
        & '.\Scripts\Removing Services\DisableWindowsSearch.bat'
        $ProgressBar1.Value = 27
        $Label11.Text = "27%"
        $Label12.Text = "Disable Windows Search"
        Write-Output = "Disable Windows Search"
    }
    if ($CheckBox55.Checked){
        & '.\Scripts\Removing Services\DisableTrackingServices.bat'
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disable Tracking Services"
        Write-Output = "Disable Tracking Services"
    }

    #Scheduled Tasks

    #Disable SmartScreenSpecific
    if ($CheckBox86.Checked){
        .\Scripts\Batch\ScheduledTasks\SmartScreenSpecific.bat
        $ProgressBar1.Value = 28
        $Label11.Text = "28%"
        $Label12.Text = "Disable Smart Screen Specific"
        Write-Output = "Disable SmartScreenSpecific"
    }
    #Disable Microsoft Compatibility Appraiser
    if ($CheckBox87.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft_Compatibility_Appraiser.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disable Microsoft Compatibility Appraiser"
        Write-Output = "Disable Microsoft Compatibility Appraiser"
    }
    #Disable Programm Data Updater
    if ($CheckBox88.Checked){
        .\Scripts\Batch\ScheduledTasks\ProgramDataUpdater.bat
        $ProgressBar1.Value = 29
        $Label11.Text = "29%"
        $Label12.Text = "Disable Program Data Updater"
        Write-Output = "Disable Program Data Updater"
    }
    #Disable Startup App Task
    if ($CheckBox89.Checked){
        .\Scripts\Batch\ScheduledTasks\StartupAppTask.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disable Startup App Task"
        Write-Output = "Disable Startup App Task"
    }
    #Disable Proxy
    if ($CheckBox90.Checked){
        .\Scripts\Batch\ScheduledTasks\Proxy.bat
        $ProgressBar1.Value = 30
        $Label11.Text = "30%"
        $Label12.Text = "Disable Proxy"
        Write-Output = "Disable Proxy"
    }
    #Disable Consolidator
    if ($CheckBox91.Checked){
        .\Scripts\Batch\ScheduledTasks\Consolidator.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disable Consolidator"
        Write-Output = "Disable Consolidator"
    }
    #Disable Kernel Ceip Task
    if ($CheckBox92.Checked){
        .\Scripts\Batch\ScheduledTasks\KernelCeipTask.bat
        $ProgressBar1.Value = 31
        $Label11.Text = "31%"
        $Label12.Text = "Disable Kernel Ceip Task"
        Write-Output = "Disable Kernel Ceip Task"
    }
    #Disable USB Ceip
    if ($CheckBox93.Checked){
        .\Scripts\Batch\ScheduledTasks\UsbCeip.bat
        $ProgressBar1.Value = 32
        $Label11.Text = "32%"
        $Label12.Text = "Disable USBCeip"
        Write-Output = "Disable USBCeip"
    }
    #Disable Mirosoft Windows DiskDiagnosticDataCollector
    if ($CheckBox94.Checked){
        .\Scripts\Batch\ScheduledTasks\Microsoft-Windows-DiskDiagnosticDataCollector.bat
        $ProgressBar1.Value = 33
        $Label11.Text = "33%"
        $Label12.Text = "Disable Microsoft-Windows-DiskDiagnosticDataCollector"
        Write-Output = "Disable Microsoft-Windows-DiskDiagnostikDataCollector"
    }
    #Disable File History (mainanance mode)
    if ($CheckBox95.Checked){
        .\Scripts\Batch\ScheduledTasks\File_History.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disable File History (maintanace mode)"
        Write-Output = "Disable File History (maintanace mode)"
    }
    #Disable WinSAT
    if ($CheckBox96.Checked){
        .\Scripts\Batch\ScheduledTasks\WinSAT.bat
        $ProgressBar1.Value = 34
        $Label11.Text = "34%"
        $Label12.Text = "Disable WinSAT"
        Write-Output = "Disable WinSAT"
    }
    #Disable Gather Network Info
    if ($CheckBox97.Checked){
        .\Scripts\Batch\ScheduledTasks\GatherNetworkInfo.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disable Gather Network Info"
        Write-Output = "Disable Gather Network Info"
    }
    #Disable Sqm-Tasks
    if ($CheckBox98.Checked){
        .\Scripts\Batch\ScheduledTasks\Sqm-Tasks.bat
        $ProgressBar1.Value = 35
        $Label11.Text = "35%"
        $Label12.Text = "Disable Sqm-Tasks"
        Write-Output = "Disable Sqm-Tasks"
    }
    #Disable Force Syncronize Time
    if ($CheckBox99.Checked){
        .\Scripts\Batch\ScheduledTasks\ForceSynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disable Force Syncronize Time"
        Write-Output = "Disable Force Syncronize Time"
    }
    #Disable Syncronize Time
    if ($CheckBox100.Checked){
        .\Scripts\Batch\ScheduledTasks\SynchronizeTime.bat
        $ProgressBar1.Value = 36
        $Label11.Text = "36%"
        $Label12.Text = "Disable Syncronize Time"
        Write-Output = "Disable Syncronize Time"
    }
    #Disable Queue Reporting
    if ($CheckBox101.Checked){
        .\Scripts\Batch\ScheduledTasks\QueueReporting.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disable Queue Reporting"
        Write-Output = "Disable Queue Reporting"
    }
    #Disable Automatic App Update
    if ($CheckBox102.Checked){
        .\Scripts\Batch\ScheduledTasks\Automatic_App_Update.bat
        $ProgressBar1.Value = 37
        $Label11.Text = "37%"
        $Label12.Text = "Disable Automatic App Update"
        Write-Output = "Disable Automatic App Update"
    }

    #Windows Default Apps

    #Remove 3D-Viewer
    if ($CheckBox80.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\3d.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Remove 3D-Viewer"
        Write-Output = "Remove 3D-Viewer"
    }
    #Remove Bing
    if ($CheckBox103.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\bing.ps1'
        $ProgressBar1.Value = 38
        $Label11.Text = "38%"
        $Label12.Text = "Remove Bing"
        Write-Output = "Remove Bing"
    }
    #Remove Zune
    if ($CheckBox104.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\zune.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Remove Zune (Groove Music)"
        Write-Output = "Remove Zune (Groove Music)"
    }
    #Remove Photo Viewer
    if ($CheckBox105.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\photo.ps1'
        $ProgressBar1.Value = 39
        $Label11.Text = "39%"
        $Label12.Text = "Remove Photo Viewer"
        Write-Output = "Remove Photo Viewer"
    }
    #Remove Windows Insider
    if ($CheckBox106.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\communi.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Remove Windows Community"
        Write-Output = "Remove Windows Community"
    }
    #Remove Solitare
    if ($CheckBox107.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\solit.ps1'
        $ProgressBar1.Value = 40
        $Label11.Text = "40%"
        $Label12.Text = "Remove Solitare"
        Write-Output = "Remove Solitare"
    }
    #Remove Phone
    if ($CheckBox108.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\phone.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Remove Phone"
        Write-Output = "Remove Phone"
    }
    #Remove Soundrecorder
    if ($CheckBox109.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\soundrec.ps1'
        $ProgressBar1.Value = 41
        $Label11.Text = "41%"
        $Label12.Text = "Remove Soundrecorder"
        Write-Output = "Remove Soundrecorder"
    }
    #Remove Camera
    if ($CheckBox110.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\camera.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Remove Camera"
        Write-Output = "Remove Camera"
    }
    #Remove Microsoft People
    if ($CheckBox111.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\people.ps1'
        $ProgressBar1.Value = 42
        $Label11.Text = "42%"
        $Label12.Text = "Remove Microsoft People"
        Write-Output = "Remove Microsoft People"
    }
    #Remove Office Live
    if ($CheckBox112.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\office.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Remove Office Live"
        Write-Output = "Remove Ofiice Live"
    }
    #Remove XBox
    if ($CheckBox113.Checked){
        & '.\Scripts\PowerShell\RemoveWindowsDefaultApps\xbox.ps1'
        $ProgressBar1.Value = 43
        $Label11.Text = "43%"
        $Label12.Text = "Remove XBox"
        Write-Output = "Remove XBox"
    }
    #Remove Remove OneDrive
    if ($CheckBox79.Checked){
        & '.\Scripts\Batch\Remove OneDrive\RemoveOneDrive.bat'
        $ProgressBar1.Value = 44
        $Label11.Text = "44%"
        $Label12.Text = "Remove OneDrive"
        Write-Output = "Remove OneDrive"
    }

    #Misc

    #Disable Windows Error Recovery in Startup
    if ($CheckBox81.Checked){
        & '.\Scripts\Batch\DisableWindowsErrorRecoveryonStartup.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Disable Windows Error Recovery on Startup"
        Write-Output = "Disable Windows Error Recovery on Startup"
    }
    #Internet Explorer 11 Tweaks
    if ($CheckBox82.Checked){
        & '.\Scripts\Batch\InternetExplorerTweaks.bat'
        $ProgressBar1.Value = 45
        $Label11.Text = "45%"
        $Label12.Text = "Internet Explorer 11 Tweaks"
        Write-Output = "Internet Explorer 11 Tweaks"
    }
    #Libary Tweaks
    if ($CheckBox83.Checked){
        & '.\Scripts\Batch\LibaryTweaks.bat'
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Libary Tweaks"
        Write-Output = "Libary Tweaks"
    }
    #Windows Update Tweaks
    if ($CheckBox84.Checked){
        & '.\Scripts\Batch\UpdateTweaks.bat'
        $ProgressBar1.Value = 46
        $Label11.Text = "46%"
        $Label12.Text = "Windows Update Tweaks"
        Write-Output = "Windows Update Tweaks"
    }
    #Windows Defender Tweaks
    if ($CheckBox85.Checked){
        & '.\Scripts\Batch\WindowsDefenderTweaks.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Windows Defender Tweaks"
        Write-Output = "Windows Defender Tweaks"
    }
    #Blocking Telemetry Servers
    if ($CheckBox56.Checked){
        & '.\Scripts\Batch\Blocking\Telemetry.bat'
        $ProgressBar1.Value = 47
        $Label11.Text = "47%"
        $Label12.Text = "Blocking Telemetry Servers"
        Write-Output = "Blocking Telemetry Servers"
    }
    #Blocking More Windows Servers
    if ($CheckBox78.Checked){
        & '.\Scripts\Batch\Blocking\BlockingMoreWindowsServers.bat'
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Blocking more Windows Servers"
        Write-Output = "Blocking more Windows Servers"
    }
    #Mouse Accelleration Fix
    if ($CheckBox114.Checked){
        .\Scripts\Registry\MouseFix\MouseAccelerationFix.ps1
        $ProgressBar1.Value = 48
        $Label11.Text = "48%"
        $Label12.Text = "Mouse Accelleration Fix"
        Write-Output = "Mouse Accelleration Fix"
    }
    
    $ProgressBar1.Value = 100
    $Label11.Text = "YAY"
    $Label12.Text = "DONE"

}

#Templates 
$Button1.Add_Click{([System.Windows.Forms.MessageBox]::Show("Work in Progress!","TGF Tuning Pack 4.0",1))}
$Button2.Add_Click{(Apply-Template)}

function Apply-Template{
    if ($ComboBox1.SelectedItem -eq "Recommended"){
        .\Templates\Recommended.ps1
    }
    if ($ComboBox1.SelectedItem -eq "Best Performance"){
        .\Templates\BestPerformance.ps1
    }
    if ($ComboBox1.SelectedItem -eq "Maximum Battery Life"){
        .\Templates\SaveEnergy.ps1
    }
    if ($ComboBox1.SelectedItem -eq "Maximum Privacy"){
        .\Templates\Privacy.ps1
    }
    if ($ComboBox1.SelectedItem -eq "ULTIMATE PERFORMACE"){
        .\Templates\UltimatePerformance.ps1
    }
    if ($ComboBox1.SelectedItem -eq "Clear"){
        .\Templates\Clear.ps1
    }
}



######################################################################################################################################################################################
### All the Tools ###
######################################################################################################################################################################################
#Process Killer
function Test_Kill_Process{
$Kill_Process = Test-Path .\Scripts\ProcessKiller-Tuning-Pack.bat
if ($Kill_Process){
    $Button3.Add_Click{(Kill-Process)}
    $Button3.ForeColor = 'Green'
} else {
    $Button3.Add_Click{(Download_Kill-Process)}
    $Button3.ForeColor = 'RED'
}
}
function Kill-Process{
    [System.Windows.Forms.MessageBox]::Show("Prozesse werden beendet","TGF Tuning Pack 4.0",1)
    Write-Output "Prozesse werden beendet."
    & '.\Scripts\ProcessKiller-Tuning-Pack.bat'
    Write-Output "Die Prozesse wurden beendet"
    Test_Kill_Process
}
function Download_Kill-Process{
    Set-Location .\Scripts\
    wget 'http://download.tuning-pack.de/TGF/Scripts/ProcessKiller-Tuning-Pack.bat' -OutFile 'ProcessKiller-Tuning-Pack.bat'
    Set-Location .\..\
    Test_Kill_Process
}
#Internet Explorer Cleanup
function Test_IE_Clean{
    $IE_Clean = Test-Path '.\Tools\IE Cleanup\Clear-IECachedData.ps1'
    if ($IE_Clean){
        $Button4.Add_Click{(IE_Clean)}
        $Button4.ForeColor = 'Green'
    } else {
        $Button4.Add_Click{(Download_IE_Clean)}
        $Button4.ForeColor = 'RED'
    }
    }
    function IE_Clean{
        & '.\Tools\IE Cleanup\Clear-IECachedData.ps1'
    }
    function Download_IE_Clean{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/IE%20Cleanup.zip' -OutFile 'IE_Cleanup.zip'
        Expand-Archive .\IE_Cleanup.zip -DestinationPath .\
        Set-Location .\..\
        Test_IE_Clean
    }
#CCleaner
function Test_CCleaner{
    $IE_Clean = Test-Path '.\Tools\CCleaner\CCleaner.exe'
    if ($IE_Clean){
        $Button20.Add_Click{(CCleaner)}
        $Button20.ForeColor = 'Green'
    } else {
        $Button20.Add_Click{(Download_CCleaner)}
        $Button20.ForeColor = 'RED'
    }
    }
    function CCleaner{
        .\Tools\CCleaner\CCleaner.exe
    }
    function Download_CCleaner{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/CCleaner.zip' -OutFile 'CCleaner.zip'
        Expand-Archive .\CCleaner.zip -DestinationPath .\
        Set-Location .\..\
        Test_CCleaner
    }
#BleachBit
function Test_BleachBit{
    $IE_Clean = Test-Path '.\Tools\BleachBit\bleachbit.exe'
    if ($IE_Clean){
        $Button21.Add_Click{(BleachBit)}
        $Button21.ForeColor = 'Green'
    } else {
        $Button21.Add_Click{(Download_BleachBit)}
        $Button21.ForeColor = 'RED'
    }
    }
    function BleachBit{
        .\Tools\BleachBit\bleachbit.exe
    }
    function Download_BleachBit{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/BleachBit.zip' -OutFile 'BleachBit.zip'
        Expand-Archive .\BleachBit.zip -DestinationPath .\
        Set-Location .\..\
        Test_BleachBit
    }
#Temp File Cleanup
function Test_TFC{
    $IE_Clean = Test-Path '.\Tools\Temp File Cleanup\Cleanup.ps1'
    if ($IE_Clean){
        $Button22.Add_Click{(TFC)}
        $Button22.ForeColor = 'Green'
    } else {
        $Button22.Add_Click{(Download_TFC)}
        $Button22.ForeColor = 'RED'
    }
    }
    function TFC{
        & '.\Tools\Temp File Cleanup\Cleanup.ps1'
    }
    function Download_TFC{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/Temp%20File%20Cleanup.zip' -OutFile 'TempFileCleanup.zip'
        Expand-Archive .\TempFileCleanup.zip -DestinationPath .\
        rm TempFileCleanup.zip
        Set-Location .\..\
        Test_TFC
    }
#USB Device Cleanup
function Test_USBDeviceCleanup{
    $IE_Clean = Test-Path '.\Tools\Drive Cleanup\DriveCleanup.exe'
    if ($IE_Clean){
        $Button23.Add_Click{(USBDeviceCleanup)}
        $Button23.ForeColor = 'Green'
    } else {
        $Button23.Add_Click{(Download_USBDeviceCleanup)}
        $Button23.ForeColor = 'RED'
    }
    }
    function USBDeviceCleanup{
        & '.\Tools\Drive Cleanup\DriveCleanup.exe'
    }
    function Download_USBDeviceCleanup{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/Drive%20Cleanup.zip' -OutFile 'DriveCleanup.zip'
        Expand-Archive .\DriveCleanup.zip -DestinationPath .\
        rm DriveCleanup.zip
        Set-Location .\..\
        Test_USBDeviceCleanup
    }
#Cleanup Duplicate Downloads
###FIXME###

#$Button24.Add_Click{([System.Windows.Forms.MessageBox]::Show("WIP","TGF Tuning Pack 4.0"1))}

#Clear Windows event logs
$Button25.ForeColor = 'GREEN'
$Button25.Add_Click{(Clear-EventLog Application,Security,System)}
#Clear Windows Update Cache
function Test_Clear-UpdateCache{
    $IE_Clean = Test-Path '.\Tools\Clear Update Cache\Erase_Cache.bat'
    if ($IE_Clean){
        $Button26.Add_Click{(Clear-UpdateCache)}
        $Button26.ForeColor = 'Green'
    } else {
        $Button26.Add_Click{(Download_Clear-UpdateCache)}
        $Button26.ForeColor = 'RED'
    }
    }
    function Clear-UpdateCache{
        & '.\Tools\Clear Update Cache\Erase_Cache.bat'
    }
    function Download_Clear-UpdateCache{
        Set-Location .\Tools\
        wget 'http://download.tuning-pack.de/TGF/Tools/Clear%20Update%20Cache.zip' -OutFile 'ClearUpdateCache.zip'
        Expand-Archive .\ClearUpdateCache.zip -DestinationPath .\
        rm ClearUpdateCache.zip
        Set-Location .\..\
        Test_Clear-UpdateCache
    }
#Clear CryptNet SSL Cache
$Button7.Add_Click{(Clear-SSL)}
function Clear-SSL{
    certutil -URLcache * delete
}
#Malwarebytes
$Button8.Add_Click{(Malwarebytes)}
function Malwarebytes{
    .\Tools\Malwarebytes\mb3-setup-consumer-3.8.3.2965-1.0.613-1.0.11878.exe
}
#Kaspersky Virus Removal Tool
$Button9.Add_Click{(KVRT)}
function KVRT{
    .\Tools\KVRT\KVRT.exe
}
#Sophos Virus Removal Tool
$Button10.Add_Click{(Sophos)}
function Sophos{
    & '.\tools\Sophos Virus Removal Tool\Sophos Virus Removal Tool.exe'
}
#MSI installer Cleanup
$Button11.Add_Click{(Installer-Cleanup)}
function Installer-Cleanup{
    [System.Windows.Forms.MessageBox]::Show("Diese funktion ist momentan nicht verfügbar, Microsoft hat dieses Feature eingestellt. Ich arbeite momentan an einer Alternative","TGF Tuning Pack 4.0 by MinersWin",1)
}
#System File Checker
$Button12.Add_Click{(System-File-Checker)}
function System-File-Checker{
    [System.Windows.Forms.MessageBox]::Show("Es wird sich gleich ein Konsolenfenster öffnen, in welchem ein Windows Image heruntergeladen wird, mit welchem das System auf Fehler geprüft wird. Das Image wird nach Abschluss des Vorgangs wieder gelöscht. Zum Bestätigen OK drücken","TGF Tuning Pack 4.0 by MinersWin",1)
    & '.\Tools\System File Checker\Check.bat'
}
#DISM image check and repair
$Button27.Add_Click{(System-File-Checker)}
#CheckDisk
$button28.Add_Click{(start cmd.exe 'chkdsk C: /f /r')}
#Network Repair
$Button30.Add_Click{(Network-Repair)}
function Network-Repair{
    ipconfig /flushdns
    netsh interface ip delete arpcache
    netsh winsock reset catalog
}
#Page File Reset
$Button32.Add_Click{(Page-File-Reset)}
function Page-File-Reset{
    C: computersystem where name="%computername%" set AutomaticManagedPagefile=True
}
#Defraggler
$Button33.Add_Click{(Defraggler-Start)}
function Defraggler-Start{
    .\Tools\Defraggler\Defraggler64.exe
}
$Button34.Add_Click{(ADSSPy)}
function ADSSPy{
    .\Tools\ADSSpy\ADSSpy.exe
}
#Adwcleaner
$Button35.Add_Click{(ADWCleaner)}
function ADWCleaner{
    .\Tools\AdwCleaner\adwcleaner_7.4.1.exe
}
#aswMBR
$Button36.Add_Click{(aswMBR)}
function aswMBR{
    .\Tools\aswMBR\aswmbr.exe
}
#autorun
$button37.Add_Click{(autorun)}
function autorun{
    .\Tools\autorun\Autoruns64.exe
}
#PCHunter
$Button38.Add_Click{(PCHunter)}
function PCHunter{
    .\Tools\PCHunter\PCHunter64.exe
}
#Net Adapter Repair
$Button40.Add_Click{(Net-Adapter-Repair)}
function Net-Adapter-Repair{
    .\tools\NetAdapterRepair\NetAdapterRepair1.2.exe
}
#ParkControl
$Button29.Add_Click{(Park-Control)}
function Park-Control{
    .\Tools\ParkControl\ParkControl.exe
}
#System Recovery
$Button39.Add_Click{(System-Recovery)}
function System-Recovery{
    rstrui.exe
}
#Reboot to Recovery
$Button42.Add_Click{(Reboot-Recovery)}
function Reboot-Recovery{
    shutdown /r /o /f /t 00
}



function Refresh_Tools{
Test_Kill_Process
Test_IE_Clean
Test_CCleaner
Test_BleachBit
Test_TFC
Test_USBDeviceCleanup
Test_Clear-UpdateCache
}
Refresh_Tools



#About Button
function About {
    # About Form Objects
    $aboutForm          = New-Object System.Windows.Forms.Form
    $aboutFormExit      = New-Object System.Windows.Forms.Button
    $aboutFormImage     = New-Object System.Windows.Forms.PictureBox
    $aboutFormNameLabel = New-Object System.Windows.Forms.Label
    $aboutFormText      = New-Object System.Windows.Forms.Label
    # About Form
    $aboutForm.AcceptButton  = $aboutFormExit
    $aboutForm.CancelButton  = $aboutFormExit
    $aboutForm.ClientSize    = "350, 110"
    $aboutForm.ControlBox    = $false
    $aboutForm.ShowInTaskBar = $false
    $aboutForm.StartPosition = "CenterParent"
    $aboutForm.Text          = "The Geek Freaks Tuning Pack 4.0"
    $aboutForm.Add_Load($aboutForm_Load)
    # About PictureBox
    $icon = [System.Drawing.Bitmap]::FromFile('.\Images\favicon.ico')
    $aboutFormImage.Image    = $icon
    $aboutFormImage.Location = "35, 15"
    $aboutFormImage.Size     = "64, 64"
    $aboutFormImage.SizeMode = "StretchImage"
    $aboutForm.Controls.Add($aboutFormImage)
    # About Name Label
    $aboutFormNameLabel.Font     = New-Object Drawing.Font("Microsoft Sans Serif", 9, [System.Drawing.FontStyle]::Bold)
    $aboutFormNameLabel.Location = "110, 20"
    $aboutFormNameLabel.Size     = "200, 18"
    $aboutFormNameLabel.Text     = "The Geek Freaks Tuning Pack 4.0"
    $aboutForm.Controls.Add($aboutFormNameLabel)
    # About Text Label
    $aboutFormText.Location = "100, 40"
    $aboutFormText.Size     = "300, 30"
    $aboutFormText.Text     = "          Created by MinersWin `n`r https://www.thegeekfreaks.de"
    $aboutFormText.Add_Click{(explorer https://thegeekfreaks.de)}
    $aboutForm.Controls.Add($aboutFormText)
    # About Exit Button
    $aboutFormExit.Location = "135, 70"
    $aboutFormExit.Text     = "OK"
    $aboutForm.Controls.Add($aboutFormExit)
    [void]$aboutForm.ShowDialog()
} # End About


Apply-Template
$Form1.ShowDialog()