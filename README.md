# Eww Bar para Hyprland (Debian)

Una barra minimalista y funcional construida con [Eww](https://elkowar.github.io/eww/), optimizada para Debian 13 y Hyprland.

![Eww Bar Preview](https://via.placeholder.com/800x30?text=Eww+Bar+Preview)

## ✨ Características
- 🚀 **Workspaces**: Gestión de escritorios en tiempo real con Hyprland.
- 📦 **Actualizaciones**: Indicador de paquetes pendientes (`apt`).
- 📶 **Red y Bluetooth**: Estado de conexión y accesos rápidos.
- 🔊 **Audio y Brillo**: Control mediante scroll y detección de dispositivos.
- 🔋 **Batería**: Estado y capacidad con iconos dinámicos.
- 📅 **Calendario**: Ventana emergente interactiva.
- ⏻ **Power Menu**: Reinicio, bloqueo, salida y apagado con confirmación.

## 🚀 Instalación Rápida

Para instalar todas las dependencias y configurar la barra automáticamente, ejecuta el siguiente comando:

```bash
git clone https://github.com/JoseloFlores/bar-eww-minimal /tmp/eww-bar && cd /tmp/eww-bar && chmod +x install.sh && ./install.sh
```

*(Nota: Sustituye la URL por la de tu repositorio)*

## 🛠️ Requisitos Manuales
Si prefieres instalar las piezas por separado, asegúrate de tener:
- **Eww**: El motor de la barra.
- **Fuentes**: `MesloLGS Nerd Font` (incluida en el script).
- **Herramientas**: `jq`, `socat`, `wireplumber`, `brightnessctl`, `network-manager`, `zenity`.

## 📂 Estructura del Proyecto
- `eww.yuck`: Estructura y widgets.
- `eww.scss`: Estilos visuales (Tokio Night theme).
- `scripts/`: Lógica para cada componente.
- `install.sh`: Script de automatización.

## ⌨️ Uso
Para iniciar la barra:
```bash
eww daemon && eww open bar
```

Para recargar cambios:
```bash
eww reload
```

---
*Hecho para Hyprland en Debian.*
