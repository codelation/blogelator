(function() {
  "use strict";
  
  App.ApplicationRoute = Ember.Route.extend({
    setupController: function() {
      console.log("APP");
    }
  });

  App.PostsRoute = Ember.Route.extend({
    setupController: function() {
      console.log("PostsRoute");
    }
	});
  
  App.PostsIndexRoute = Ember.Route.extend({
    setupController: function() {
      console.log("PostsIndexRoute");
    }
	});
  
})();
