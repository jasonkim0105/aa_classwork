const FollowToggle = require("./follow_toggle");

$( () => {
  const $followToggle = $('.follow-toggle');
  $followToggle.each((i, ele) => {
    const obj = new FollowToggle(ele);
    console.log(obj);
  });
})