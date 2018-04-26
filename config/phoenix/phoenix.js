Phoenix.set({ openAtLogin: true });

var prefix = ['ctrl', 'alt'];

Key.on('1', prefix, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: 0,
      y: 0
    });

    window.setSize({
      width: screen.width / 2,
      height: screen.height
    });
  }
});

Key.on('2', prefix, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: screen.width / 2,
      y: 0
    });

    window.setSize({
      width: screen.width / 2,
      height: screen.height
    });
  }
});

Key.on('c', prefix, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: screen.x + (screen.width / 2) - (window.frame().width / 2),
      y: 0
    });

    window.setSize({
      width: screen.width / 2,
      height: screen.height
    });

    window.setTopLeft({
      x: screen.x + (screen.width / 2) - (window.frame().width / 2),
      y: 0
    });
  }
});
