#Solucion original, la autentica que se pedía
[string] $path = Read-Host "introduzca la ruta"
if(Test-Path -Path $path){
    $fichero = Import-Csv $path -Delimiter ","
}else{
    Write-Output "Ruta no existe"
}

foreach($i in $fichero){
      #Crear usuario si no existe
    Get-LocalUser $i.usuario 1>$null 2>&1
    if ($?){
        Write-host "Usuario"$($i.usuario)"ya existe" -ForegroundColor Yellow
    }else{
        New-LocalUser -Name $i.usuario -Password (ConvertTo-SecureString $i.password -AsPlainText -Force) -AccountNeverExpires -PasswordNeverExpires
        Add-LocalGroupMember -Member $i.usuario -Group "Usuarios"
    }
    
        

      #Crear grupo si no existe
    Get-LocalGroup $i.grupo 1>$null 2>&1
    if ($?) {
        Write-host "Grupo"$($i.grupo)"ya existe" -ForegroundColor Yellow
    }else{
        New-LocalGroup -Name $i.grupo
    }
    try{
        Add-LocalGroupMember -Member $i.usuario -Group $i.grupo -ErrorAction stop
    }catch{
        Write-Host $_.Exception.Message -ForegroundColor Green
    }
}
