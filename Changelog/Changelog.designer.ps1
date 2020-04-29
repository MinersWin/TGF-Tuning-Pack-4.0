$FormChangelog = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Panel]$PanelChangelog = $null
[System.Windows.Forms.Button]$ButtonChangelog = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Label]$LabelChangelog = $null
function InitializeComponent
{
$PanelChangelog = (New-Object -TypeName System.Windows.Forms.Panel)
$ButtonChangelog = (New-Object -TypeName System.Windows.Forms.Button)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$LabelChangelog = (New-Object -TypeName System.Windows.Forms.Label)
$PanelChangelog.SuspendLayout()
$FormChangelog.SuspendLayout()
#
#PanelChangelog
#
$PanelChangelog.AutoScroll = $true
$PanelChangelog.Controls.Add($ButtonChangelog)
$PanelChangelog.Controls.Add($Label1)
$PanelChangelog.Controls.Add($LabelChangelog)
$PanelChangelog.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$PanelChangelog.Name = [System.String]'PanelChangelog'
$PanelChangelog.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]397,[System.Int32]376))
$PanelChangelog.TabIndex = [System.Int32]0
$PanelChangelog.add_Paint($PanelChangelog_Paint)
#
#ButtonChangelog
#
$ButtonChangelog.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]130,[System.Int32]330))
$ButtonChangelog.Name = [System.String]'ButtonChangelog'
$ButtonChangelog.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]131,[System.Int32]34))
$ButtonChangelog.TabIndex = [System.Int32]3
$ButtonChangelog.Text = [System.String]'OK'
$ButtonChangelog.UseCompatibleTextRendering = $true
$ButtonChangelog.UseVisualStyleBackColor = $true
#
#Label1
#
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]49))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]262))
$Label1.TabIndex = [System.Int32]2
$Label1.Text = [System.String]'Label1'
$Label1.UseCompatibleTextRendering = $true
#
#LabelChangelog
#
$LabelChangelog.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]16.2,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LabelChangelog.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]9))
$LabelChangelog.Name = [System.String]'LabelChangelog'
$LabelChangelog.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]363,[System.Int32]40))
$LabelChangelog.TabIndex = [System.Int32]1
$LabelChangelog.Text = [System.String]'Changelog'
$LabelChangelog.UseCompatibleTextRendering = $true
#
#FormChangelog
#
$FormChangelog.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]421,[System.Int32]395))
$FormChangelog.Controls.Add($PanelChangelog)
$FormChangelog.HelpButton = $true
$FormChangelog.Text = [System.String]'Changelog'
$PanelChangelog.ResumeLayout($false)
$FormChangelog.ResumeLayout($false)
Add-Member -InputObject $FormChangelog -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $FormChangelog -Name PanelChangelog -Value $PanelChangelog -MemberType NoteProperty
Add-Member -InputObject $FormChangelog -Name ButtonChangelog -Value $ButtonChangelog -MemberType NoteProperty
Add-Member -InputObject $FormChangelog -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $FormChangelog -Name LabelChangelog -Value $LabelChangelog -MemberType NoteProperty
}
. InitializeComponent
