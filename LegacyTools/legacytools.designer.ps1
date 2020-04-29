$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$Button5 = $null
[System.Windows.Forms.Button]$Button6 = $null
[System.Windows.Forms.Button]$Button7 = $null
[System.Windows.Forms.Button]$Button8 = $null
[System.Windows.Forms.Button]$Button9 = $null
[System.Windows.Forms.Button]$Button10 = $null
[System.Windows.Forms.Button]$Button1 = $null
[System.Windows.Forms.Button]$Button3 = $null
[System.Windows.Forms.Button]$Button4 = $null
function InitializeComponent
{
$Button5 = (New-Object -TypeName System.Windows.Forms.Button)
$Button6 = (New-Object -TypeName System.Windows.Forms.Button)
$Button7 = (New-Object -TypeName System.Windows.Forms.Button)
$Button8 = (New-Object -TypeName System.Windows.Forms.Button)
$Button9 = (New-Object -TypeName System.Windows.Forms.Button)
$Button10 = (New-Object -TypeName System.Windows.Forms.Button)
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Button3 = (New-Object -TypeName System.Windows.Forms.Button)
$Button4 = (New-Object -TypeName System.Windows.Forms.Button)
$Form1.SuspendLayout()
#
#Button5
#
$Button5.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]41))
$Button5.Name = [System.String]'Button5'
$Button5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]193,[System.Int32]23))
$Button5.TabIndex = [System.Int32]3
$Button5.Text = [System.String]'BleachBit'
$Button5.UseCompatibleTextRendering = $true
$Button5.UseVisualStyleBackColor = $true
#
#Button6
#
$Button6.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$Button6.Name = [System.String]'Button6'
$Button6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]193,[System.Int32]23))
$Button6.TabIndex = [System.Int32]2
$Button6.Text = [System.String]'CCleaner'
$Button6.UseCompatibleTextRendering = $true
$Button6.UseVisualStyleBackColor = $true
#
#Button7
#
$Button7.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]99))
$Button7.Name = [System.String]'Button7'
$Button7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button7.TabIndex = [System.Int32]13
$Button7.Text = [System.String]'AdwCleaner'
$Button7.UseCompatibleTextRendering = $true
$Button7.UseVisualStyleBackColor = $true
#
#Button8
#
$Button8.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]70))
$Button8.Name = [System.String]'Button8'
$Button8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button8.TabIndex = [System.Int32]12
$Button8.Text = [System.String]'ADSSpy'
$Button8.UseCompatibleTextRendering = $true
$Button8.UseVisualStyleBackColor = $true
#
#Button9
#
$Button9.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button9.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]157))
$Button9.Name = [System.String]'Button9'
$Button9.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button9.TabIndex = [System.Int32]6
$Button9.Text = [System.String]'Kill Process'
$Button9.UseCompatibleTextRendering = $true
$Button9.UseVisualStyleBackColor = $true
#
#Button10
#
$Button10.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button10.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]128))
$Button10.Name = [System.String]'Button10'
$Button10.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button10.TabIndex = [System.Int32]16
$Button10.Text = [System.String]'PCHunter'
$Button10.UseCompatibleTextRendering = $true
$Button10.UseVisualStyleBackColor = $true
#
#Button1
#
$Button1.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]215))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button1.TabIndex = [System.Int32]3
$Button1.Text = [System.String]'Kapersky Virus Removal Tool'
$Button1.UseCompatibleTextRendering = $true
$Button1.UseVisualStyleBackColor = $true
#
#Button3
#
$Button3.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]186))
$Button3.Name = [System.String]'Button3'
$Button3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button3.TabIndex = [System.Int32]2
$Button3.Text = [System.String]'Malwarebytes Anti-Malware'
$Button3.UseCompatibleTextRendering = $true
$Button3.UseVisualStyleBackColor = $true
#
#Button4
#
$Button4.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$Button4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]244))
$Button4.Name = [System.String]'Button4'
$Button4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]192,[System.Int32]23))
$Button4.TabIndex = [System.Int32]4
$Button4.Text = [System.String]'Sophos Virus Removal Tool'
$Button4.UseCompatibleTextRendering = $true
$Button4.UseVisualStyleBackColor = $true
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]710,[System.Int32]449))
$Form1.Controls.Add($Button4)
$Form1.Controls.Add($Button5)
$Form1.Controls.Add($Button1)
$Form1.Controls.Add($Button3)
$Form1.Controls.Add($Button10)
$Form1.Controls.Add($Button6)
$Form1.Controls.Add($Button7)
$Form1.Controls.Add($Button8)
$Form1.Controls.Add($Button9)
$Form1.Text = [System.String]'Form1'
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button5 -Value $Button5 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button6 -Value $Button6 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button7 -Value $Button7 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button8 -Value $Button8 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button9 -Value $Button9 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button10 -Value $Button10 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button3 -Value $Button3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button4 -Value $Button4 -MemberType NoteProperty
}
. InitializeComponent
