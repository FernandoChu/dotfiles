final: prev: {
  # with sway/wayland support
  polybar = prev.polybar.overrideAttrs (_:
    {
      i3Support = true;
    });
}
