(function() {
  "use strict";
  
  App.AdminPostsShowRoute = Ember.Route.extend({
    renderTemplate: function() {
      this.render(); 
      this.render('admin/posts/_show_action_bar', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
