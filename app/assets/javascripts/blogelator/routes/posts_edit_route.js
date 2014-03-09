(function() {
  "use strict";
  
  App.PostsEditRoute = Ember.Route.extend({
    actions: {
      willTransition: function(transition) {
        var record = this.get('controller.content');
        
        // Confirm transition if there are unsaved changes
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
    
    model: function(params) {
      var post = this.store.find('post', params.post_id);
      console.log(params, post);
      return this.store.find('post', params.post_id);
    },
    
    renderTemplate: function() {
      this.render(); 
      this.render('posts/_form_action_bar', {
        into: 'application',
        outlet: 'footer'
      });
    }
  });
  
})();
