#!/bin/bash

clear

echo "=============================================="
echo "  BATOCERA NAOMI - KOF XI (REICAST)"
echo "  by @JCGAMESCLASSICOS"
echo "=============================================="
echo

mkdir -p /userdata/system/configs/retroarch/cores \
         /userdata/system/configs/emulationstation \
         /userdata/roms/naomi  >/dev/null 2>&1

echo "[1/5] Instalando core Reicast..."
wget -q -O /userdata/system/configs/retroarch/cores/reicast_libretro.so \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/reicast_libretro.so

rm -f /usr/lib/libretro/zc210_libretro.so >/dev/null 2>&1
ln -s /userdata/system/configs/retroarch/cores/reicast_libretro.so \
      /usr/lib/libretro/zc210_libretro.so  >/dev/null 2>&1
echo "      ✔ Reicast ativo (zc210)"

echo
echo "[2/5] Configurando EmulationStation (Naomi)..."
wget -q -O /userdata/system/configs/emulationstation/es_systems_naomi.cfg \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/es_systems_naomi.cfg
echo "      ✔ Naomi registrado"

echo
echo "[3/5] Baixando ROM..."
wget -q -O "/userdata/roms/naomi/The King of Fighters XI.bin" \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/gdrom_KOFXI_v5_AllFighters.bin
echo "      ✔ KOF XI instalado"

echo
echo "[4/5] Ajustando batocera.conf (Reicast)..."
cat << 'EOF' >> /userdata/system/batocera.conf

# KOF XI - Naomi (Reicast)
naomi["The King of Fighters XI.bin"].core=zc210
naomi["The King of Fighters XI.bin"].emulator=libretro
naomi["The King of Fighters XI.bin"].tdp=100.000000
EOF
echo "      ✔ Configuração aplicada"

echo
echo "[5/5] Finalizando..."
sync

echo
echo "=============================================="
echo "  REICAST CONFIGURADO COM SUCESSO!"
echo "  Reinicie o Batocera"
echo "=============================================="
echo "          by @JCGAMESCLASSICOS"
echo
