/* eslint-disable */
Phoenix.set({ openAtLogin: true });

var prefix = ["ctrl", "alt"];
var scr = Screen.main().visibleFrameInRectangle();
var win = Window.focused();

var windowLocations = {
  left: {
    x: 0,
    y: 0,
    width: scr.width / 2,
    height: scr.height
  },
  right: {
    x: scr.width / 2,
    y: 0,
    width: scr.width / 2,
    height: scr.height
  },
  full: {
    x: 0,
    y: 0,
    width: scr.width,
    height: scr.height
  },
  center: {
    x: scr.x + scr.width / 2 - win.frame().width / 2,
    y: scr.y + scr.height / 2 - win.frame().height / 2,
  }
};

// Left half of the screen
Key.on("1", prefix, () => {
  Window.focused().setFrame(windowLocations.left);
});

// Right half of the screen
Key.on("2", prefix, () => {
  Window.focused().setFrame(windowLocations.right);
});

// Full screen
Key.on("f", prefix, () => {
  Window.focused().setFrame(windowLocations.full);
});

// Centered
Key.on("z", prefix, function() {
  Window.focused().setTopLeft({
    x: scr.x + (scr.width / 2) - (Window.focused().frame().width / 2),
    y: scr.y + (scr.height / 2) - (Window.focused().frame().height / 2)
  });
});

// One-third centered
Key.on("c", prefix, () => {
  Window.focused().setFrame(windowLocations.left);

  Window.focused().setTopLeft({
    x: scr.x + (scr.width / 2) - (Window.focused().frame().width / 2),
    y: scr.y + (scr.height / 2) - (Window.focused().frame().height / 2)
  });
});
