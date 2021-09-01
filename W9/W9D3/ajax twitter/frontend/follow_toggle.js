const APIUtil = require("./api_util.js")
class FollowToggle {
  constructor (el){
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();

    this.$el.on("click", (e) => {
      e.preventDefault()
      this.handleClick()
      this.render()
    })
  }

  render(){
    if (this.followState === true) {
      this.$el.attr('value', 'Unfollow!');
      this.$el.prop("disabled", false)
    } else if (this.followState === false) {
      this.$el.attr('value', 'Follow!');
      this.$el.prop("disabled", false)
    } else {
      this.$el.prop("disabled", true)
    }
  }

  handleClick(){
    if (!this.followState) {
      this.followState = "following";
      this.render()
      return APIUtil.followUser(this.userId, this);
    } else {
      this.followState = "unfollowing";
      this.render()
      return APIUtil.unfollowUser(this.userId, this);
    }
  }


}

module.exports = FollowToggle;