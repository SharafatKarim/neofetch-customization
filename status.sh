#!/bin/bash

#color
Green='\033[0;32m'        # Green
NC='\033[0m'              # No Color

config-validity()
{
wget -O conf-original.conf "https://raw.githubusercontent.com/SharafatKarim/neofetch-customization/master/config/config.conf%20(default)"

if cmp -s -- "$HOME/.config/neofetch/config.conf" "conf-original.conf"
then
  echo ""
  echo -e "${Green}you're using the default neofetch${NC}"
  echo ""
else
  echo ""
  echo -e "${Green}you're not using the default neofetch${NC}"
  echo ""
fi
rm conf-original.conf
}

config-script-validity()
{
wget -O conf-original-2.conf "https://raw.githubusercontent.com/SharafatKarim/neofetch-customization/master/config/config.conf"

if cmp -s -- "$HOME/.config/neofetch/config.conf" "conf-original-2.conf"
then
  echo ""
  echo -e "${Green}you've used this GitHub repo to install theme and didn't customize further${NC}"
  echo ""
fi
rm conf-original-2.conf
}

logo-validity()
{
wget -O logo-original.png "https://github.com/SharafatKarim/neofetch-customization/raw/master/logo/icon.png"

if cmp -s -- "$HOME/.config/neofetch/logo.png" "logo-original.png"
then
  echo ""
  echo -e "${Green}arch logo from this script is installed and you didn't customize further${NC}"
  echo ""
fi
rm logo-original.png
}

neofetch-exists()
{
if which neofetch >/dev/null
then
    echo ""
    echo -e "${Green}Neofetch is installed.${NC}"
    echo ""
else
    echo ""
    echo Neofetch is not installed.
    echo ""
fi
}

config-exists()
{
    if test -f "$HOME/.config/neofetch/config.conf"
    then
        echo ""
        echo -e "${Green}neofetch config is installed${NC}"
        echo ""
    else
        echo ""
        echo -e "${Green}neofetch config not found,${NC}"
        echo ""
    fi
}

config-backup-exists()
{
    if test -f "$HOME/.config/neofetch/config-backup.conf"
    then
        echo ""
        echo -e "${Green}config-backup is installed${NC}"
        echo ""
    else
        echo ""
        echo -e "${Green}neofetch config-backup not found${NC}"
        echo ""
    fi
}

logo-backup-exists()
{
    if test -f "$HOME/.config/neofetch/logo-backup.png"
    then
        echo ""
        echo -e "${Green}logo-backup is installed${NC}"
        echo ""
    fi
}

logo-exists()
{
    if test -f "$HOME/.config/neofetch/logo.png"
    then
        echo ""
        echo -e "${Green}logo is installed${NC}"
        echo ""
    fi
}

neofetch-exists
config-exists
config-validity
config-script-validity
logo-exists
config-backup-exists
logo-backup-exists
logo-validity

