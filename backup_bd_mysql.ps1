#antedes de ejecutar este script, debemos de habilitar los permisos 
#en powershell, colocando la siguiente linea 
# Set-ExecutionPolicy Unrestricted, abrir power shell en modo administrador y dar S (si)


function AsegurarExistenciaArchivo {
    param (
        [string]$folderPath
    )
    if (-not (Test-Path -Path $folderPath -PathType Container)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
        Write-Output "La carpeta '$folderPath' ha sido creada"
    } else {
        Write-Output "La carpeta '$folderPath' ya existe"
    }
}

#Colocar las credenciales de tu base de datos
$user = "root"
$password = "mi_contra"
#en ps1 no se puede usar la palabra $host
$hoster = "localhost"
$port = 3307 #especificar el puerto
$base_datos = "nombre_base_datos"

#coloca donde se guardara tu archivo
$ruta_carpeta = "E:\Respaldo\MiBaseDatos"

#si quieres otro nombde de archivo, cambialo
$hora_inicio = Get-Date -Format "HHmmss"
$fecha_inicio = Get-Date -Format "dd-MM-yyyy"

$nombre_archivo = "backup_" + $base_datos + "_$fecha_inicio"+"_"+"$hora_inicio.sql"


#verificamos si la carpeta no existe para crearla
AsegurarExistenciaArchivo -folderPath $ruta_carpeta

$command = "mysqldump --user=$user --password=$password --host=$hoster --port=$port $base_datos > $ruta_carpeta\$nombre_archivo"

#POR SI QUIERES VER EL COMANDO


#echo $command

Invoke-Expression $command


