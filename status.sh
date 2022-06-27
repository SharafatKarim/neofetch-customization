#!/bin/bash

config-validity()
{
wget -O conf-original.conf "https://raw.githubusercontent.com/SharafatKarim/neofetch-customization/master/config/config.conf%20(default)"

if cmp -s -- "$HOME/.config/neofetch/conf.conf" "conf-original.conf"
then
  echo ""
  echo "you're using the default neofetch"
  echo ""
else
  echo ""
  echo "you're not using the default neofetch"
  echo ""
fi
rm conf-original.conf
}

config-script-validity()
{
wget -O conf-original-2.conf "https://raw.githubusercontent.com/SharafatKarim/neofetch-customization/master/config/config.conf"

if cmp -s -- "$HOME/.config/neofetch/conf.conf" "conf-original-2.conf"
then
  echo ""
  echo "you've used this GitHub repo to install theme and didn't customize further"
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
  echo "arch logo from this script is installed and you didn't customize further"
  echo ""
fi
rm logo-original.png
}

neofetch-exists()
{
if which neofetch >/dev/null
then
    echo ""
    echo Neofetch is installed. 
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
        echo "neofetch config is installed"
        echo ""
    else
        echo ""
        echo "neofetch config not found,"
        echo ""
    fi
}

config-backup-exists()
{
    if test -f "$HOME/.config/neofetch/config-backup.conf"
    then
        echo ""
        echo "config-backup is installed"
        echo ""
    else
        echo ""
        echo "neofetch config-backup not found"
        echo ""
    fi
}

logo-backup-exists()
{
    if test -f "$HOME/.config/neofetch/logo-backup.png"
    then
        echo ""
        echo "logo-backup is installed"
        echo ""
    fi
}

logo-exists()
{
    if test -f "$HOME/.config/neofetch/logo.png"
    then
        echo ""
        echo "logo is installed"
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

