#!/bin/bash

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


config-backup-exists()
{
    if test -f "$HOME/.config/neofetch/config-backup.conf"
    then
        echo ""
        echo "config-backup is installed"
        echo ""
        echo "restoring backup,,,"
        mv $HOME/.config/neofetch/config-backup.conf $HOME/.config/neofetch/config.conf
        echo "config backup restored!"
    else
        echo ""
        echo "neofetch config-backup not found"
        rm $HOME/.config/neofetch/config.conf
        echo "neofetched reverted back to default"
    fi
}

logo-backup-exists()
{
    if test -f "$HOME/.config/neofetch/logo-backup.png"
    then
        echo ""
        echo "logo-backup is installed"
        echo "restoring backup,,,"
        mv $HOME/.config/neofetch/logo-backup.png $HOME/.config/neofetch/logo.png
        echo "logo backup restored!"

    else
        echo ""
        echo "neofetch logo-backup not found"
        rm $HOME/.config/neofetch/logo.png
        echo "logo deleted"
    fi
}

config-exists()
{
    if test -f "$HOME/.config/neofetch/config.conf"
    then
        echo ""
        echo "neofetch config is installed"
        echo ""
        config-backup-exists
    else
        echo ""
        echo "neofetch config not found,"
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
        logo-backup-exists
    else
        echo ""
        echo "logo not found,"
        echo "so, nothing to do..."
    fi
}

neofetch-exists
config-exists
logo-exists
echo ""
echo "done!"
echo "here's your previous neofetch,"
neofetch