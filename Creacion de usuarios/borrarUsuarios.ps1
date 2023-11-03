$fichero = Import-Csv -Path C:\Users\smx2\Desktop\empleados.csv -Delimiter ","

foreach($i in $fichero){
    try{
        Remove-LocalUser $i.usuario -ErrorAction stop
         Write-host "El usuario"$i.usuario "se borro" -ForegroundColor Green 
     }catch{
        Write-host "El usuario"$i.usuario "ya no existe" -ForegroundColor Yellow
    }
   
  
    try{
        Remove-LocalGroup -Name $i.grupo -ErrorAction stop
        Write-host "El grupo"$i.grupo "se borro" -ForegroundColor Green
    }catch{
         Write-host "El grupo"$i.grupo "ya no existe" -ForegroundColor Yellow
    }
    
}