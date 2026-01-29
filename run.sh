#!/bin/bash

# Cores
GREEN_BOLD="\033[1;32m"
RESET="\033[0m"

clear

echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}  BATOCERA NAOMI - KOF XI (REICAST)${RESET}"
echo -e "${GREEN_BOLD}  by @JCGAMESCLASSICOS${RESET}"
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo

# Diretórios
mkdir -p /userdata/system/configs/retroarch/cores \
         /userdata/system/configs/emulationstation \
         /userdata/roms/naomi  >/dev/null 2>&1

echo -e "${GREEN_BOLD}[1/5] Instalando core Reicast...${RESET}"
wget -q -O /userdata/system/configs/retroarch/cores/reicast_libretro.so \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/reicast_libretro.so

rm -f /usr/lib/libretro/zc210_libretro.so >/dev/null 2>&1
ln -s /userdata/system/configs/retroarch/cores/reicast_libretro.so \
      /usr/lib/libretro/zc210_libretro.so  >/dev/null 2>&1
echo -e "${GREEN_BOLD}      ✔ Reicast ativo (zc210)${RESET}"

echo
echo -e "${GREEN_BOLD}[2/5] Configurando EmulationStation (Naomi)...${RESET}"
wget -q -O /userdata/system/configs/emulationstation/es_systems_naomi.cfg \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/es_systems_naomi.cfg
echo -e "${GREEN_BOLD}      ✔ Sistema Naomi configurado${RESET}"

echo
echo -e "${GREEN_BOLD}[3/5] Baixando ROM...${RESET}"
wget -q -O "/userdata/roms/naomi/The King of Fighters XI.bin" \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/gdrom_KOFXI_v5_AllFighters.bin
echo -e "${GREEN_BOLD}      ✔ The King of Fighters XI${RESET}"

echo
echo -e "${GREEN_BOLD}[4/5] Ajustando batocera.conf...${RESET}"
cat << 'EOF' >> /userdata/system/batocera.conf

# KOF XI - Naomi (Reicast)
naomi["The King of Fighters XI.bin"].core=zc210
naomi["The King of Fighters XI.bin"].emulator=libretro
naomi["The King of Fighters XI.bin"].tdp=100.000000
EOF
echo -e "${GREEN_BOLD}      ✔ Configuração aplicada${RESET}"

echo
echo -e "${GREEN_BOLD}[5/5] Finalizando...${RESET}"
sync

echo
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}  INSTALAÇÃO CONCLUÍDA COM SUCESSO!${RESET}"
echo -e "${GREEN_BOLD}  Reinicie o Batocera para aplicar tudo.${RESET}"
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}          by @JCGAMESCLASSICOS${RESET}"
echo
