#!/bin/bash

# source: https://github.com/MoOx/setup/blob/master/preferences/Spectacle.backprefs
# Will create ./Spectacle.prefs
# Run that file to restore settings
# Run this file to create the backup

SPECTACLE_PREFS="$(dirname \$0)/Spectacle.prefs"

echo -e "#!/bin/bash\n" > "$SPECTACLE_PREFS"
echo -e "defaults write com.divisiblebyzero.Spectacle SUEnableAutomaticChecks -bool true\n" >> "$SPECTACLE_PREFS"
# https://github.com/mathiasbynens/dotfiles/issues/507#issuecomment-93173783
for key in \
  MoveToCenter \
  MoveToFullscreen \
  \
  MoveToLeftHalf \
  MoveToRightHalf \
  MoveToTopHalf \
  MoveToBottomHalf \
  \
  MoveToUpperLeft \
  MoveToLowerLeft \
  MoveToUpperRight \
  MoveToLowerRight \
  \
  MoveToPreviousDisplay \
  MoveToNextDisplay \
  \
  MoveToPreviousThird \
  MoveToNextThird \
  \
  MakeLarger \
  MakeSmaller \
  \
  RedoLastMove \
  UndoLastMove
do
  echo "defaults write com.divisiblebyzero.Spectacle $key -data " >> "$SPECTACLE_PREFS"
  defaults read com.divisiblebyzero.Spectacle $key | sed 's/[^0-9a-f]//g' >> "$SPECTACLE_PREFS"
done

chmod +x "$SPECTACLE_PREFS"
