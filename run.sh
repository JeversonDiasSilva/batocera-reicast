#!/bin/bash

# Cores
GREEN_BOLD="\033[1;32m"
BLUE_BOLD="\033[1;34m"
RESET="\033[0m"

clear

echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}  BATOCERA NAOMI - KOF XI (REICAST)${RESET}"
echo -e "${GREEN_BOLD}  by @JCGAMESCLASSICOS & Tartaruga${RESET}"
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo

# Diretórios
mkdir -p /userdata/system/configs/retroarch/cores \
         /userdata/system/configs/emulationstation \
         /userdata/roms/naomi >/dev/null 2>&1

# 1. Instalando core Reicast
echo -e "${GREEN_BOLD}[1/5] Instalando core Reicast...${RESET}"
wget -q -O /userdata/system/configs/retroarch/cores/reicast_libretro.so \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/reicast_libretro.so

rm -f /usr/lib/libretro/zc210_libretro.so >/dev/null 2>&1
ln -s /userdata/system/configs/retroarch/cores/reicast_libretro.so \
      /usr/lib/libretro/zc210_libretro.so >/dev/null 2>&1
echo -e "${BLUE_BOLD}      ✔ Reicast ativo (REICAST)${RESET}"

# 1.1 Baixando arquivo .info
echo -e "${GREEN_BOLD}[1.1/5] Baixando arquivo .info do core...${RESET}"
wget -q -O /usr/share/libretro/info/reicast_libretro.info \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/reicast_libretro.info
echo -e "${BLUE_BOLD}      ✔ Arquivo .info baixado${RESET}"

# 2. Configurando EmulationStation
echo
echo -e "${GREEN_BOLD}[2/5] Configurando EmulationStation (Naomi)...${RESET}"
wget -q -O /userdata/system/configs/emulationstation/es_systems_naomi.cfg \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/es_systems_naomi.cfg
echo -e "${BLUE_BOLD}      ✔ Sistema Naomi configurado${RESET}"

# 3. Baixando ROM
echo
echo -e "${GREEN_BOLD}[3/5] Baixando ROM...${RESET}"
wget -q -O "/userdata/roms/naomi/The King of Fighters XI.bin" \
https://github.com/JeversonDiasSilva/batocera-reicast/releases/download/v1.0/gdrom_KOFXI_v5_AllFighters.bin
echo -e "${BLUE_BOLD}      ✔ The King of Fighters XI${RESET}"

# 4. Finalizando
echo
echo -e "${GREEN_BOLD}[4/5] Finalizando...${RESET}"
sync
batocera-save-overlay 250 > /dev/null 2>&1

echo
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}  INSTALAÇÃO CONCLUÍDA COM SUCESSO!${RESET}"
echo -e "${GREEN_BOLD}  Reinicie o Batocera para aplicar tudo.${RESET}"
echo -e "${GREEN_BOLD}==============================================${RESET}"
echo -e "${GREEN_BOLD}          by @JCGAMESCLASSICOS & Tartaruga${RESET}"
