(function() {
  "use strict";
  
   App.BlogelatorAdminPostsNewRoute = Ember.Route.extend({
    model: function() {
      return App.Post.createRecord();
    }
	});
  
})();
