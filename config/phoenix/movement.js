/* eslint-disable */
// Left half of the screen
Key.on("1", prefix, () => {
  Window.focused().setFrame({
    x: getZeroPoint() + padding,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y + padding,
    width:
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2 -
      padding * 2,
    height:
      Window.focused()
        .screen()
        .flippedVisibleFrame().height -
      padding * 2
  });
});

// Right half of the screen
Key.on("2", prefix, () => {
  Window.focused().setFrame({
    x:
      getZeroPoint() +
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y + padding,
    width:
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2 -
      padding,
    height:
      Window.focused()
        .screen()
        .flippedVisibleFrame().height -
      padding * 2
  });
});

// Left: Two thirds of the screen
Key.on("[", prefix, () => {
  Window.focused().setFrame({
    x: getZeroPoint() + padding,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y + padding,
    width:
      (Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        5) *
        3 -
      padding * 2,
    height:
      Window.focused()
        .screen()
        .flippedVisibleFrame().height -
      padding * 2
  });
});

// Right: One third of the screen
Key.on("]", prefix, () => {
  Window.focused().setFrame({
    x:
      getZeroPoint() +
      (Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        5) *
        3,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y + padding,
    width:
      (Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        5) *
        2 -
      padding,
    height:
      Window.focused()
        .screen()
        .flippedVisibleFrame().height -
      padding * 2
  });
});

// Full screen
Key.on(".", prefix, () => {
  Window.focused().setFrame({
    x: getZeroPoint() + padding,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y + padding,
    width:
      Window.focused()
        .screen()
        .flippedVisibleFrame().width -
      padding * 2,
    height:
      Window.focused()
        .screen()
        .flippedVisibleFrame().height -
      padding * 2
  });
});

// Centered
Key.on("z", prefix, function() {
  Window.focused().setTopLeft({
    x:
      Window.focused()
        .screen()
        .flippedVisibleFrame().x +
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2 -
      Window.focused().frame().width / 2,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y +
      Window.focused()
        .screen()
        .flippedVisibleFrame().height /
        2 -
      Window.focused().frame().height / 2
  });
});

// Resized centered
Key.on("c", prefix, () => {
  Window.focused().setFrame({
    x:
      Window.focused()
        .screen()
        .flippedVisibleFrame().x +
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2 -
      Window.focused().frame().width / 2,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y +
      Window.focused()
        .screen()
        .flippedVisibleFrame().height /
        2 -
      Window.focused().frame().height / 2,
    width:
      (Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        8) *
      6,
    height:
      (Window.focused()
        .screen()
        .flippedVisibleFrame().height /
        5) *
      4
  });

  Window.focused().setTopLeft({
    x:
      Window.focused()
        .screen()
        .flippedVisibleFrame().x +
      Window.focused()
        .screen()
        .flippedVisibleFrame().width /
        2 -
      Window.focused().frame().width / 2,
    y:
      Window.focused()
        .screen()
        .flippedVisibleFrame().y +
      Window.focused()
        .screen()
        .flippedVisibleFrame().height /
        2 -
      Window.focused().frame().height / 2
  });
});
