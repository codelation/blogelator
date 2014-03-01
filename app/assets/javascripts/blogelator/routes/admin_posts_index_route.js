(function() {
  "use strict";
  
  App.AdminPostsIndexRoute = Ember.Route.extend({
    renderTemplate: function() {
      this.render();
      this.render('admin/posts/_footer', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
