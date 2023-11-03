#Solucion try/catch
#$fichero = Import-Csv -Path C:\Users\smx2\Desktop\empleados.csv -Delimiter ","

[string] $path = Read-Host "introduzca la ruta"
if(Test-Path -Path $path){
    $fichero = Import-Csv $path -Delimiter ","
}else{
    Write-Output "Ruta no existe"
}

foreach($i in $fichero){
    #Crear usuario si no existe
    try{
         New-LocalUser -Name $i.usuario -Password (ConvertTo-SecureString $i.password -AsPlainText -Force) -AccountNeverExpires -PasswordNeverExpires -ErrorAction stop
         Add-LocalGroupMember -Member $i.usuario -Group "Usuarios" 
         Write-Host "El usuario "$($i.usuario) " se creo correctamente" -ForegroundColor Green
     }catch{
         
         Write-host $_.Exception.Message -ForegroundColor Yellow 
     }
     
         
 
     #Crear grupo si no existe
   
    try{
         New-LocalGroup -Name $i.grupo -ErrorAction silentlyContinue
         Add-LocalGroupMember -Member $i.usuario -Group $i.grupo -ErrorAction stop
         Write-host "El grupo " $($i.grupo)" se creo correctamente" -ForegroundColor Green
     }catch{
         Write-host $_.Exception.Message -ForegroundColor Yellow
         
         
     }
 
     
 }