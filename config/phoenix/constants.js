/* eslint-disable */
var prefix = ["ctrl", "alt"];
var padding = 20;
var screen = Window.focused()
  .screen()
  .flippedVisibleFrame();
var frame = Window.focused().frame();

var locations = {
  leftHalf: {
    x: getZeroPoint() + padding,
    y: screen.y + padding,
    width: screen.width / 2 - padding * 2,
    height: screen.height - padding * 2
  },
  rightHalf: {
    x: getZeroPoint() + screen.width / 2,
    y: screen.y + padding,
    width: screen.width / 2 - padding,
    height: screen.height - padding * 2
  },
  quarter: {
    topLeft: {
      x: getZeroPoint() + padding,
      y: screen.y + padding,
      width: screen.width / 2 - padding * 2,
      height: screen.height / 2 - padding * 2
    },
    bottomLeft: {
      x: getZeroPoint() + padding,
      y: screen.height / 2 + padding,
      width: screen.width / 2 - padding * 2,
      height: screen.height / 2 - padding
    },
    topRight: {
      x: screen.width / 2,
      y: screen.y + padding,
      width: screen.width / 2 - padding,
      height: screen.height / 2 - padding * 2
    },
    bottomRight: {
      x: screen.width / 2,
      y: screen.height / 2 + padding,
      width: screen.width / 2 - padding,
      height: screen.height / 2 - padding
    }
  },
  leftTwoThirds: {
    x: getZeroPoint() + padding,
    y: screen.y + padding,
    width: (screen.width / 5) * 3 - padding * 2,
    height: screen.height - padding * 2
  },
  rightOneThird: {
    x: getZeroPoint() + (screen.width / 5) * 3,
    y: screen.y + padding,
    width: (screen.width / 5) * 2 - padding,
    height: screen.height - padding * 2
  },
  fullScreen: {
    x: getZeroPoint() + padding,
    y: screen.y + padding,
    width: screen.width - padding * 2,
    height: screen.height - padding * 2
  },
  centeredResized: {
    x: screen.x + screen.width / 2 - frame.width / 2,
    y: screen.y + screen.height / 2 - frame.height / 2,
    width: (screen.width / 8) * 6,
    height: (screen.height / 5) * 4
  }
};
