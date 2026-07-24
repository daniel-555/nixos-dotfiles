{ pkgs }:
pkgs.writeShellScriptBin "sessionizer" ''
  #!/bin/bash

  if [[ $# -eq 1 ]]; then
      selected=$1
  else
      selected=$(find ~/Documents ~/github ~/.config ~/ ~/AndroidStudioProjects -maxdepth 1 -mindepth 1 -type d,l | fzf)
  fi

  if [[ -z selected ]]; then
      exit 0
  fi

  cd $selected
''
