for DOTFILE in ./profile/*
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done