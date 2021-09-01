class FollowToggle {
  constructor (el){
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    this.render();
    this.handleClick();
  }
  render(){
    if (this.followState) {
      this.$el.attr('value', 'unfollow!');
    } else {
      this.$el.attr('value', 'follow!');
    }
  }
  handleClick(){
    if (!this.followState) {
      return $.ajax({
      method: "POST",
      url: "/users/:user_id/follow",
      data: {followee_id: this.userId},
      dataType: 'JSON',
      this.followState = true,
      });
    } else {
      return $.ajax({
        method: "DELETE",
        url: "/users/:user_id/follow",
        data: {followee_id: this.userId},
        dataType: 'JSON',
        this.followState = false,
      )};
    }
  }


}

module.exports = FollowToggle;