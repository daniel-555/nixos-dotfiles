{ shared, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${shared.mod}, Return, exec, ${shared.terminal}"
      "${shared.mod}, B, exec, ${shared.browser}"
      "${shared.mod} SHIFT, Return, exec, ${shared.programRunner}"
      "${shared.mod} SHIFT, Q, killactive"
      "${shared.mod}, F, fullscreen"
      "${shared.mod} SHIFT, F, togglefloating"
      "${shared.mod} SHIFT, X, exit"

      "${shared.mod} SUPER, H, swapwindow, l"
      "${shared.mod} SUPER, L, swapwindow, r"
      "${shared.mod} SUPER, K, swapwindow, u"
      "${shared.mod} SUPER, J, swapwindow, d"

      "${shared.mod}, H, movefocus, l"
      "${shared.mod}, L, movefocus, r"
      "${shared.mod}, K, movefocus, u"
      "${shared.mod}, J, movefocus, d"

      "${shared.mod}, 1, workspace, 1"
      "${shared.mod}, 2, workspace, 2"
      "${shared.mod}, 3, workspace, 3"
      "${shared.mod}, 4, workspace, 4"
      "${shared.mod}, 5, workspace, 5"
      "${shared.mod}, 6, workspace, 6"
      "${shared.mod}, 7, workspace, 7"
      "${shared.mod}, 8, workspace, 8"
      "${shared.mod}, 9, workspace, 9"
      "${shared.mod}, 0, workspace, 10"
      "${shared.mod}, tab, workspace, previous"
      "${shared.mod}, N, movecurrentworkspacetomonitor, +1"

      "${shared.mod} SHIFT, 1, movetoworkspace, 1"
      "${shared.mod} SHIFT, 2, movetoworkspace, 2"
      "${shared.mod} SHIFT, 3, movetoworkspace, 3"
      "${shared.mod} SHIFT, 4, movetoworkspace, 4"
      "${shared.mod} SHIFT, 5, movetoworkspace, 5"
      "${shared.mod} SHIFT, 6, movetoworkspace, 6"
      "${shared.mod} SHIFT, 7, movetoworkspace, 7"
      "${shared.mod} SHIFT, 8, movetoworkspace, 8"
      "${shared.mod} SHIFT, 9, movetoworkspace, 9"
      "${shared.mod} SHIFT, 0, movetoworkspace, 10"

      "SUPER, L, exec, hyprlock"
    ];

    bindm = [
      "${shared.mod}, mouse:272, movewindow"
      "${shared.mod}, mouse:273, resizewindow"
    ];
  };
}
