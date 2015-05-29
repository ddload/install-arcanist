#!/bin/bash
set -e

# Downloads arcanist, libphutil, etc and configures your system

INSTALL_DIR="/usr/local"
BIN_DIR="$INSTALL_DIR/bin"
PHP_DIR="$INSTALL_DIR/php"

if [ ! -e "$PHP_DIR" ]; then
    mkdir -p $PHP_DIR
fi;

# Install or update libphutil
echo "Updating arcanist repos.."
if [ -e "$PHP_DIR/libphutil" ]; then
    arc upgrade
else
    git clone git://github.com/phacility/libphutil.git "$PHP_DIR/libphutil"
    git clone git://github.com/phacility/arcanist.git "$PHP_DIR/arcanist"
fi

# Register arc commands
echo "Registering arc command.."

# arc
ln -s "$PHP_DIR/arcanist/bin/arc" "$BIN_DIR/arc"

echo "Done!"
echo "If use zsh,add the following line to your ~/.zshrc，then run command source ~/.zshrc to active auto-complete."
echo "autoload bashcompinit"
echo "bashcompinit"
echo "source $PHP_DIR/arcanist/resources/shell/bash-completion"

