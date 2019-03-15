/* eslint-disable */
let movementModal = (message, override = false) => {
  window = Window.focused();
  screen = Screen.main().flippedVisibleFrame();

  Modal.build({
    origin(modal) {
      return {
        x: screen.width / 2 - modal.width / 2,
        y: screen.height / 2
      };
    },
    weight: 20,
    duration: 1,
    appearance: "dark",
    icon: window.app().icon(),
    text: override
      ? message + " " + window.app().name()
      : "Moving " + window.app().name() + " to the " + message
  }).show();
};

// Left half of the screen
Key.on("1", prefix, () => {
  movementModal("left half");
  Window.focused().setFrame(windowLocations.left);
});

// Left: Two thirds of the screen
Key.on("[", prefix, () => {
  movementModal("left two thirds");
  Window.focused().setFrame(windowLocations.leftTwoThirds);
});

// Right half of the screen
Key.on("2", prefix, () => {
  movementModal("right half");
  Window.focused().setFrame(windowLocations.right);
});

// Right: One third of the screen
Key.on("]", prefix, () => {
  movementModal("right one third");
  Window.focused().setFrame(windowLocations.rightOneThird);
});

// Full screen
Key.on("f", prefix, () => {
  movementModal("full screen");
  Window.focused().setFrame(windowLocations.full);
});

// Centered
Key.on("z", prefix, function() {
  movementModal("center");
  Window.focused().setTopLeft({
    x: scr.x + scr.width / 2 - Window.focused().frame().width / 2,
    y: scr.y + scr.height / 2 - Window.focused().frame().height / 2
  });
});

// Resized centered
Key.on("c", prefix, () => {
  movementModal("center & resize");
  Window.focused().setFrame(windowLocations.center);

  Window.focused().setTopLeft({
    x: scr.x + scr.width / 2 - Window.focused().frame().width / 2,
    y: scr.y + scr.height / 2 - Window.focused().frame().height / 2
  });
});
