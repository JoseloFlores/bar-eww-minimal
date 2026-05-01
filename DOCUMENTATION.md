# Documentación de Eww Bar para Hyprland

Esta documentación detalla la estructura y configuración de la barra Eww optimizada para Hyprland en Debian 13.

## Estructura de Directorios
- `/home/jose/.config/eww/`: Contiene los archivos principales de Eww (`eww.yuck`, `eww.scss`) y scripts auxiliares.
- `/home/jose/.config/hypr/`: Contiene scripts de soporte (`check_updates_count.sh`, `workspaces.sh`, `bluetooth.sh`).

## Archivos Principales
- `eww.yuck`: Define la estructura, widgets y lógica de la barra.
- `eww.scss`: Define el estilo visual, incluyendo colores, fuentes y estados de interacción (hover).

## Scripts Auxiliares
- `check_updates_count.sh`: Retorna el conteo de actualizaciones pendientes desde `apt`.
- `workspaces.sh`: Escucha eventos de Hyprland vía socket para actualizar los escritorios en tiempo real.
- `bluetooth.sh`: Detecta y retorna el nombre del dispositivo Bluetooth conectado.
- `volume_get.sh`: Obtiene el volumen actual y detecta dinámicamente el dispositivo activo para mostrar el icono de audífonos o altavoces.

## Notas de Mantenimiento
- Para recargar la barra después de cualquier cambio:
  `eww kill && eww open bar`
- Los estilos visuales se encuentran en `eww.scss`. La familia tipográfica prioriza "MesloLGS Nerd Font".
