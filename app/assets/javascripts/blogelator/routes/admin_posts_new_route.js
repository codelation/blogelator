(function() {
  "use strict";
  
   App.AdminPostsNewRoute = Ember.Route.extend({
    model: function() {
      return App.Post.createRecord();
    }
	});
  
})();
