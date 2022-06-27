#!/bin/bash

neofetch-exists()
{
if which neofetch >/dev/null
then
    echo Neofetch exists. Here\s your neofetch:
    neofetch
else
    echo ""
    echo It seems neofetch isn\'t installed!
    echo Well, you can still make it\s config file and install it later!
    echo note: neofetch installation guide : 
    echo https://github.com/dylanaraps/neofetch/wiki/Installation
    echo
    echo "1-> No, I want to install neofetch first (default) "
    echo "2-> Ok, I'll install later, let me customize"
    echo " -> Please choose 1/2 and hit enter"
    read NEO
    echo "Your choise is $NEO"
    if [ "$NEO" = "2" ]
    then
        echo kool, let\'s continue,
    else
        echo nothing changed!
        exit
    fi
fi
}

config-down()
{
    wget -O $HOME/.config/neofetch/config.conf https://raw.githubusercontent.com/SharafatKarim/neofetch-customization/master/config/config.conf
}

logo-down()
{
    wget -O $HOME/.config/neofetch/photo.png https://github.com/SharafatKarim/neofetch-customization/raw/master/logo/icon.png
}

config-time()
{
    echo ""
    echo "let's change it, if you don't mind!"
    if test -f "$HOME/.config/neofetch/config.conf"
    then 
        echo "config file found!"
        echo "Do you want to take backup or just replace it?"
        echo "1-> Yeah, I wanna take backup"
        echo "2-> Nope, no need, just install the theme (default)"
        echo " -> Please choose 1/2 and hit enter"
        read CONFIG
        echo "Your choise is $CONFIG"
        if [ "$CONFIG" = "1" ]
        then
            mv $HOME/.config/neofetch/config.conf $HOME/.config/neofetch/config-backup.conf
            echo "now your config file is located in"
            echo "$HOME/.config/neofetch/config-backup.conf"
            echo "tip: you don't need to worry about it, just read our wiki for info!"
            config-down
        else
            rm -rf $HOME/.config/neofetch/config.conf
            config-down
        fi
    else
        config-down
    fi
}

logo-time()
{
    echo ""
    echo "Now time for a logo!"
    if test -f "$HOME/.config/neofetch/logo.png"
    then 
        echo "logo file found!"
        echo "Do you want to take backup or keep it?"
        echo "1-> Yeah, I'll use my own logo (default)"
        echo "2-> Take backup and use the arch logo"
        echo "3-> Remove old logo, and install the arch one"
        echo " -> Please choose 1/2/3 and hit enter"
        read CONFIGL
        echo "Your choise is $CONFIGL"
        if [ "$CONFIGL" = "2" ]
        then
            mv $HOME/.config/neofetch/logo.png $HOME/.config/neofetch/logo-backup.png
            echo "now your logo file is located in"
            echo "$HOME/.config/neofetch/logo-backup.png"
            echo "tip: you don't need to worry about it, just read our wiki for info!"
            logo-down
        elif [ "$CONFIGL" = "3" ]
        then
            rm -rf $HOME/.config/neofetch/logo.png
            logo-down
        else
            echo "Now using your own logo..."
        fi
    else
        logo-down
    fi    
}

echo "Welcome to the Neofetch customizer,"
echo "Let's see wheather it's installed or not!"
echo ""
neofetch-exists
config-time
logo-time

echo ""
echo "Congrats!"
echo "Theme installed, and oviously you can edit the config file"
echo "It's located in"
echo "$HOME/.config/neofetch/config.conf"
echo ""
echo "And the arch logo is loacated in"
echo "$HOME/.config/neofetch/logo.png"
echo "you can change it anytime with your own logo or avatar"
echo ""

echo "Do you wanna open that config file right now inside your text editor?"
echo "1-> Nope, later (default)"
echo "2-> Yeah, why not?"
echo " -> Please choose 1/2 and hit enter"
read FINAL
echo "Your choice is $FINAL"
if [ "$FINAL" = "2" ]
then
    xdg-open $HOME/.config/neofetch/config.conf
fi
echo "Ok, thanks a lot for using this script!"
echo "Here's you new neofetch,"
echo ""
neofetch