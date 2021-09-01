/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js")

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

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js")
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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$( () => {
  const $followToggle = $('.follow-toggle');
  $followToggle.each((i, ele) => {
    const obj = new FollowToggle(ele);
    console.log(obj);
  });
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map