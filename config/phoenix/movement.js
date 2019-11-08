/* eslint-disable */
// Left half of the screen
Key.on("1", prefix, () => {
  Window.focused().setFrame(locations.leftHalf);
});
// Right half of the screen
Key.on("2", prefix, () => {
  Window.focused().setFrame(locations.rightHalf);
});
// Quarter: Top left
Key.on("w", prefix, () => {
  Window.focused().setFrame(locations.quarter.topLeft);
});
// Quarter: Bottom left
Key.on("a", prefix, () => {
  Window.focused().setFrame(locations.quarter.bottomLeft);
});
// Quarter: Top right
Key.on("s", prefix, () => {
  Window.focused().setFrame(locations.quarter.topRight);
});
// Quarter: Bottom right
Key.on("d", prefix, () => {
  Window.focused().setFrame(locations.quarter.bottomRight);
});
// Left: Two thirds of the screen
Key.on("[", prefix, () => {
  Window.focused().setFrame(locations.leftTwoThirds);
});
// Right: One third of the screen
Key.on("]", prefix, () => {
  Window.focused().setFrame(locations.rightOneThird);
});
// Full screen
Key.on("f", prefix, () => {
  Window.focused().setFrame(locations.fullScreen);
});
// Centered
Key.on("z", prefix, function() {
  centerWindow(Window.focused());
});
// Resized centered
Key.on("c", prefix, () => {
  Window.focused().setFrame(locations.centeredResized);
  centerWindow(Window.focused());
});
// Reload Phoenix
Key.on("r", prefix, () => {
  reloadPhoenix();
});
