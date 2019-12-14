#TuningPack 4.0 by MinersWin
#14.12.2019
#https://tuning-pack.de
Add-Type @'
  using System; 
  using System.Runtime.InteropServices;
  using System.Drawing;

  public class DPI {  
    [DllImport("gdi32.dll")]
    static extern int GetDeviceCaps(IntPtr hdc, int nIndex);

    public enum DeviceCap {
      VERTRES = 10,
      DESKTOPVERTRES = 117
    } 

    public static float scaling() {
      Graphics g = Graphics.FromHwnd(IntPtr.Zero);
      IntPtr desktop = g.GetHdc();
      int LogicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.VERTRES);
      int PhysicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.DESKTOPVERTRES);

      return (float)PhysicalScreenHeight / (float)LogicalScreenHeight;
    }
  }
'@ -ReferencedAssemblies 'System.Drawing.dll'
$Scale = [Math]::round([DPI]::scaling(), 2) * 100
Write-Output "Scale: $($Scale)"
switch($Scale){
  100 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 100%.reg'}
  125 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 125%.reg'}
  150 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 150%.reg'}
  175 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 175%.reg'}
  200 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 200%.reg'}
  225 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 225%.reg'}
  250 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 250%.reg'}
  300 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 300%.reg'}
  350 {reg import '.\Windows 10 + 8 TGFMOUSEFIX 350%.reg'}
  default {reg import '.\Windows 10 + 8 Standard.reg'}
}