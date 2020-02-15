
function SendMail {
	param($Subject, $Body)
    $msg = new-object Net.Mail.MailMessage
    $smtp = new-object Net.Mail.SmtpClient($smtpServer)
    $smtp.EnableSsl = $true
    $msg.From = "$email" 
    $msg.To.Add("$email")
    $msg.IsBodyHTML = $true 
    $msg.Subject = $Subject
    $msg.Body = $Body 
    $SMTP.Credentials = New-Object System.Net.NetworkCredential("$email", "$pass");
    $smtp.Send($msg)
}


