(function() {
  "use strict";
  
  App.AdminPostsRoute = Ember.Route.extend({
    model: function() {
      return App.Post.find();
    }
  });
  
})();
