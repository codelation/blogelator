(function() {
  "use strict";
  
  App.PostsNewRoute = Ember.Route.extend({
    actions: {
      willTransition: function(transition) {
        var record = this.get('controller.content');
        
        // Allow transition if nothing is entered
        if (Ember.isEmpty(record.get('title')) &&
            Ember.isEmpty(record.get('bodyMarkdown'))
        ) {
          record.destroyRecord();
          return true;
        }
        
        // Confirm transition if there are unsaved changes
        if (record.get('isNew')) { 
          if (confirm("Are you sure you want to lose unsaved changes?")) {
            record.destroyRecord();
            return true;
          } else {
            transition.abort();
          }
        } else {
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
      }
    },
    
    model: function() {
      return this.store.createRecord('post');
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
