while ($true)
{
    try
    {
        $global:ie=new-object -com "internetexplorer.application"
        $ie.visible=$false
        $ie.navigate("https://uuapp.plus4u.net/uu-plus4ugo-maing01/f34b62a867db4bd89490534bb26451ad/component/render?_component=UuMall.Bricks.ProductDetail&productCode=mam000105581")
        wait4IE
    
        $names=$ie.Document.getElementsByClassName("uu5-common-div uu-mall-core-product-buttons-row-button-order")
        while($names[0].innerHTML -eq $null)
        {Start-Sleep -s 1
        }
   
         if (!($names[0].innerHTML.ToString() -like "*disabled*"))
         {
              Write-Host ("FOUND [{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date))
             (New-Object -com SAPI.SpVoice).speak("I found PlayStation with single controler for you")
             (New-Object -com SAPI.SpVoice).speak("I found PlayStation with single controler for you")
             (New-Object -com SAPI.SpVoice).speak("I found PlayStation with single controler for you")
            
             break
         }
         Write-Host ("[{0:MM/dd/yy} {0:HH:mm:ss}] NOTHING" -f (Get-Date))
         $ie.quit()
         Start-Sleep -s 30
        
    }
    catch{
    $ie.quit()
    break
    }
}
function wait4IE($ie=$global:ie){
    while ($ie.busy -or $ie.readystate -lt 4){start-sleep -milliseconds 200}
}


