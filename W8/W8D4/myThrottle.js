Function.prototype.myThrottle = function (interval) {
  let tooSoon = false;
  if (tooSoon === false) {
    tooSoon = true;
    setTimeout(() => tooSoon = false, interval);
  }
}
