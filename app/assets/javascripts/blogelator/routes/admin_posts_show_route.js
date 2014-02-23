(function() {
  "use strict";
  
  App.AdminPostsShowRoute = Ember.Route.extend({
    model: function(params) {
      return App.Post.find(params.post_id);
    }
  });
  
})();
