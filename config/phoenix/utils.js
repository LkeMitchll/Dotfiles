/* eslint-disable */
const HANDLERS = [];

function getZeroPoint() {
  if (Window.focused().screen().flippedVisibleFrame().x < 0) {
    return Window.focused().screen().flippedVisibleFrame().x
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
