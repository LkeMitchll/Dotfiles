/* eslint-disable */
var prefix = ["ctrl", "alt"];
var scr = Screen.main().visibleFrameInRectangle();
var win = Window.focused();
var padding = 20;

var windowLocations = {
  left: {
    x: 0 + padding,
    y: 0 + padding * 2,
    width: scr.width / 2 - padding * 2,
    height: scr.height - padding * 2
  },
  right: {
    x: scr.width / 2,
    y: 0 + padding * 2,
    width: scr.width / 2 - padding,
    height: scr.height - padding * 2
  },
  leftTwoThirds: {
    x: 0 + padding,
    y: 0 + padding * 2,
    width: (scr.width / 5) * 3 - padding * 2,
    height: scr.height - padding * 2
  },
  rightOneThird: {
    x: (scr.width / 5) * 3,
    y: 0 + padding * 2,
    width: (scr.width / 5) * 2 - padding,
    height: scr.height - padding * 2
  },
  full: {
    x: 0 + padding,
    y: 0 + padding * 2,
    width: scr.width - padding * 2,
    height: scr.height - padding * 2
  },
  center: {
    x: scr.x + scr.width / 2 - win.frame().width / 2,
    y: scr.y + scr.height / 2 - win.frame().height / 2,
    width: (scr.width / 8) * 6,
    height: (scr.height / 5) * 4
  }
};

