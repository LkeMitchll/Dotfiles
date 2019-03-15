/* eslint-disable */
let focus = direction => {
  let window;
  if (Window.focused() === undefined) {
    window = Window.recent()[0];
  } else {
    window = Window.focused();
  }

  let neighbors = window.neighbors(direction);

  if (neighbors === undefined || neighbors.length > 0) {
    let index = 0;

    while (index < neighbors.length) {
      if (neighbors[index] === undefined) {
        return;
      }

      if (!neighbors[index].isVisible()) {
        index++;
      } else {
        break;
      }
    }

    if (neighbors[index] === undefined) {
      return;
    }

    neighbors[index].focus();
  }
};

// Focus a window if none are focused
let startFocus = new Key("f", prefix, () => {
  if (Window.focused() === undefined || !Window.focused().isVisible()) {
    if (Window.recent().length > 0) {
      newWindow = Window.recent()[0];
      newWindow.focus();
    } else {
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
        text: "No windows available"
      }).show();
    }
  }
});

Key.on("h", prefix, () => {
  focus("west");
});

Key.on("j", prefix, () => {
  focus("south");
});

Key.on("k", prefix, () => {
  focus("north");
});

Key.on("l", prefix, () => {
  focus("east");
});
