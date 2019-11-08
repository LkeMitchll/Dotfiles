/* eslint-disable */
function getZeroPoint() {
  if (
    Window.focused()
      .screen()
      .flippedVisibleFrame().x < 0
  ) {
    return Window.focused()
      .screen()
      .flippedVisibleFrame().x;
  } else {
    return 0;
  }
}

function centerWindow(win) {
  var screen = win.screen().flippedVisibleFrame();
  var frame = win.frame();

  win.setTopLeft({
    x: screen.x + screen.width / 2 - frame.width / 2,
    y: screen.y + screen.height / 2 - frame.height / 2
  });
}

function reloadPhoenix() {
  Phoenix.reload();
  Phoenix.notify("Phoenix reloaded...");
}

function log(desc, content) {
  Phoenix.log(desc.toUpperCase() + ": " + content);
}
