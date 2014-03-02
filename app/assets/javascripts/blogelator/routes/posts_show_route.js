(function() {
  "use strict";
  
  App.PostsShowRoute = Ember.Route.extend({
    renderTemplate: function() {
      this.render(); 
      this.render('posts/_show_action_bar', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
