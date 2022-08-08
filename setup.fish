#!/usr/bin/env fish

set DIR (pwd)
set FDIR ~/.local/share/fonts
set PDIR ~/.config/polybar

function install_fonts
  echo "Installing fonts..."
  mkdir -p "$FDIR"
  cp -rf $DIR/fonts/* "$FDIR"
end

function install_themes
  if test -d "$PDIR"
    echo "Backing up old polybar config..."
    mv "$PDIR" "${PDIR}.old"
  end
  
  echo "Installing polybar themes..."
  mkdir -p "$PDIR"
  cp -rf $DIR/$STYLE/* "$PDIR"
end

set STYLES simple bitmap
set STYLE (string collect $STYLES | sk --no-multi --height=3 --no-clear -p "Select style")
  
if test -n "$STYLE"
  install_fonts
  install_themes
else
  echo "No style selected, Exiting..."
  exit 1
end
