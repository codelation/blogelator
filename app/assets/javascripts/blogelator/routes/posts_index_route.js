(function() {
  "use strict";
  
  App.PostsIndexRoute = Ember.Route.extend({
    afterModel: function(posts) {
      if (posts.get('length') > 0) {
        this.transitionTo('posts.show', posts.objectAt(0));
      }
    },
    
    renderTemplate: function() {
      this.render();
      this.render('posts/_footer', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
