(function() {
  "use strict";
  
  App.PostsIndexRoute = Ember.Route.extend({
    renderTemplate: function() {
      this.render();
      this.render('posts/_footer', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
