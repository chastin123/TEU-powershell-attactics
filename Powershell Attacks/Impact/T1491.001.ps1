# By Threats Experts University

$url = "https://redcanary.com/wp-content/uploads/Atomic-Red-Team-Logo.png"
$imgLocation = "C:\Users\studentadmin\Desktop\new.png"
$orgWallpaper = (Get-ItemProperty -Path Registry::'HKEY_CURRENT_USER\Control Panel\Desktop\' -Name WallPaper).WallPaper
$orgWallpaper | Out-File -FilePath "C:\Users\studentadmin\Desktop\old.png"
$updateWallpapercode = @'
using System.Runtime.InteropServices;
namespace Win32{

     public class Wallpaper{
         [DllImport("user32.dll", CharSet=CharSet.Auto)]
          static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ;

          public static void SetWallpaper(string thePath){
             SystemParametersInfo(20,0,thePath,3);
         }
     }
 }
'@
 $wc = New-Object System.Net.WebClient
 try{
     $wc.DownloadFile($url, $imgLocation)
     add-type $updateWallpapercode
     [Win32.Wallpaper]::SetWallpaper($imgLocation)
 }
 catch [System.Net.WebException]{
     Write-Host("Cannot download $url"+ [System.Net.WebException])
     add-type $updateWallpapercode
     [Win32.Wallpaper]::SetWallpaper($imgLocation)
 }
 finally{
     $wc.Dispose()
}