# Eww Bar para Hyprland (Debian)

Una barra minimalista y funcional construida con [Eww](https://elkowar.github.io/eww/), optimizada para Debian 13 y Hyprland.

![Eww Bar Preview](https://via.placeholder.com/800x30?text=Eww+Bar+Preview)

## ✨ Características
- 🚀 **Workspaces**: Gestión de escritorios en tiempo real con Hyprland.
- 🎵 **Música (Universal)**: Widget central con información del reproductor activo (Spotify, VLC, Navegador) y popup de controles detallado.
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
- **Herramientas**: `jq`, `socat`, `wireplumber`, `brightnessctl`, `network-manager`, `zenity`, `playerctl`.

## 📂 Estructura del Proyecto
- `eww.yuck`: Estructura y widgets.
- `eww.scss`: Estilos visuales dinámicos.
- `themes/`: Colección de esquemas de colores (Catppuccin, Nord, etc.).
- `scripts/`: Lógica para cada componente y cambio de temas.

## 🎨 Temas Dinámicos

La barra soporta cambio de temas en caliente. Tienes varias formas de cambiar el aspecto visual:

### 1. Manualmente (SCSS)
Abre `eww.scss` y cambia la primera línea:
```scss
@import "themes/tokyonight.scss"; // Cambia por nord, dracula, rosepine, etc.
```
Al guardar, la barra se actualizará instantáneamente.

### 2. Mediante Script
Puedes usar el script incluido para cambiar el tema desde la terminal:
```bash
~/.config/eww/scripts/apply_theme.sh catppuccin
```

### 3. Variable de Entorno
Si defines `EWW_THEME` en tu configuración, la barra puede detectarlo automáticamente:
```bash
export EWW_THEME=everforest
~/.config/eww/scripts/apply_theme.sh
```

### Temas Disponibles:
`catppuccin`, `dracula`, `everforest`, `gruvbox-dark`, `gruvbox-light`, `nord`, `rosepine`, `tokyonight`.

## 🎵 Widget de Música
El widget de música es inteligente y universal:
- **Soporte Universal**: Funciona con cualquier reproductor compatible con MPRIS (Spotify, VLC, Navegador, etc.).
- **Prioridad de Foco**: Si tienes múltiples reproductores abiertos, el widget prioriza automáticamente el que tenga el foco de la ventana actual.
- **Diseño Combinado**: Muestra información básica en el centro de la barra y un popup con controles detallados al hacer clic.

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
