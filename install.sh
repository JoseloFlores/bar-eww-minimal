#!/bin/bash

# Script de instalación para Eww Bar en Debian/Hyprland

set -e

echo "🚀 Iniciando instalación de Eww Bar..."

# 1. Instalar dependencias del sistema
echo "📦 Instalando dependencias..."
sudo apt update
sudo apt install -y \
    eww \
    jq \
    socat \
    wireplumber \
    brightnessctl \
    network-manager \
    blueman \
    pavucontrol \
    zenity \
    python3 \
    foot \
    wget \
    unzip

# 2. Instalar MesloLGS Nerd Font si no existe
if ! fc-list | grep -i "MesloLGS Nerd Font" > /dev/null; then
    echo "📂 Instalando MesloLGS Nerd Font..."
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    cd /tmp
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
    unzip -o Meslo.zip -d "$FONT_DIR"
    fc-cache -fv
    rm Meslo.zip
    cd -
else
    echo "✅ MesloLGS Nerd Font ya está instalada."
fi

# 3. Crear directorios de configuración
echo "📁 Configurando directorios..."
mkdir -p "$HOME/.config/eww"

# 4. Copiar archivos (asumiendo que se ejecuta desde el repo)
echo "📝 Copiando archivos de configuración..."
cp -rv ./* "$HOME/.config/eww/"

# 5. Dar permisos de ejecución a los scripts
echo "🔑 Asignando permisos a los scripts..."
chmod +x "$HOME/.config/eww/scripts/"*

echo "✨ Instalación completada."
echo "Puedes iniciar la barra con: eww daemon && eww open bar"
