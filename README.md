# Scripts-Respaldo
Comando en powershell que respaldará tu base de datos, para Mysql.

Ademas este mismo archivo lo puedes usar para ejecutar tarea programada y que se haga una copia de seguridad de tu base de datos cada cierto tiempo, eso dependera de tí.

Este enlace te pude ayudar a crear una tarea programada [Youtube](https://www.youtube.com/watch?v=CJw_JEt_L6I)



# Configuración archivo

Colocar las credenciales de tu base de datos, verificar muy bien el puerto ya que si no es correcto te podria dar error de acceso.

```sh
$user = "root"
$password = "mi_contra"
#en ps1 no se puede usar la palabra $host
$hoster = "localhost"
$port = 3306 #especificar el puerto
$base_datos = "nombre_base_datos"

```

## Ubicación del archivo respaldado

Colocar toda la ruta de donde se guardará tu archivo de respaldo

```sh
$ruta_carpeta = "E:\Respaldo\MiBaseDatos"
```
En caso no hayas creado la carpeta, existe una funcion `AsegurarExistenciaArchivo` que verifica si no existe, entonces creara tu carpeta.

```sh
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
```

## Iniciando el programa
Powershell no te dejara correr este script sin antes darle los permisos, si ejecutaste el script y no te dio ningun problema, no pasa nada, sino copia esta linea de comando en powershell.
Abrir en modo administrador

```sh 
Set-ExecutionPolicy Unrestricted
```

Una vez ejecutado dar S (si)

Dado los permisos acceder al archivo en el mismo powershell

Puedes mantener `shift + click derecho` en la carpeta y saldra una opcion `Abrir la ventana de Powershell aqui`
```sh 
..\Script-Respaldo> .\backup_bd_mysql.ps1
```