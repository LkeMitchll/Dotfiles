/* eslint-disable */
const HANDLERS = [];

function getZeroPoint() {
  Window.focused()
    .screen()
    .flippedVisibleFrame().y;
  if (
    Window.focused()
      .screen()
      .flippedVisibleFrame().y == -680
  ) {
    return 1680;
  } else {
    return 0;
  }
}

function reloadPhoenix() {
  Phoenix.reload();
  Phoenix.notify("Phoenix reloaded...");
}

function log(desc, content) {
  Phoenix.log(desc.toUpperCase() + ": " + content);
}

function setEventHandler(event, handler) {
  HANDLERS.push(Event.on(event, handler));
}

Key.on("r", prefix, () => {
  reloadPhoenix();
});

// Event.on("appDidActivate", () => {
//   log(
//     "screen",
//     Window.focused()
//       .screen()
//       .identifier()
//   );
// });
