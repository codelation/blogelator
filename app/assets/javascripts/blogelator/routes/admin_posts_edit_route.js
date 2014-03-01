(function() {
  "use strict";
  
  App.AdminPostsEditRoute = Ember.Route.extend({
    actions: {
      willTransition: function(transition) {
        var record = this.get('controller.content');
        
        if (record.get('isDirty')) {
          if (confirm("Are you sure you want to lose unsaved changes?")) {
            record.rollback();
            return true;
          } else {
            transition.abort();
          }
        } else {
          return true;
        }
      }
    },
    
    renderTemplate: function() {
      this.render(); 
      this.render('admin/posts/_form_action_bar', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
