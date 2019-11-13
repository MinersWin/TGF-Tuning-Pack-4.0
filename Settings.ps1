$Config = Import-LocalizedData -BaseDirectory .\Config\ -FileName Config.psd1

$TextBox1.Text = $Config.Application.Name
$TextBox2.Text = $Config.Application.StartupMessage
$TextBox3.Text = $config.Application.Icon
$TextBox4.Text = $Config.Application.Logo
$TextBox5.Text = $Config.Application.Language
$TextBox6.Text = $Config.Application.DirectoryName
$TextBox7.Text = $Config.Application.DirectoryName
$TextBox8.Text = $Config.Application.DirectoryName
$TextBox9.Text = $Config.Application.DirectoryName
$TextBox10.Text = $Config.Application.DirectoryName