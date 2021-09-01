const FollowToggle = require("./follow_toggle.js")

const APIUtil = {
  followUser: (id, button) => {
    $.ajax({
      method: "POST",
      url: `/users/${id}}/follow`,
      data: {followee_id: id},
      dataType: 'JSON',
    }).then(button.followState = true)
  },

  unfollowUser: (id, button) => {
    $.ajax({
      method: "DELETE",
      url: `/users/${id}/follow`,
      data: {followee_id: id},
      dataType: 'JSON',
    }).then(button.followState = false)
  }
}

module.exports = APIUtil