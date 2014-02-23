(function() {
  "use strict";
  
  App.AdminPostsNewRoute = Ember.Route.extend({
    actions: {
      willTransition: function(transition) {
        var record = this.get('controller.content');
        
        if (record.get('isNew')) {
          if (record.get('isDirty')) {
            console.log('Empty??', record.get('isEmpty'));
            if (confirm("Are you sure you want to lose unsaved changes?")) {
              record.deleteRecord();
              return true;
            } else {
              transition.abort();
            }
          } else {
            record.deleteRecord();
            return true;
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
      return App.Post.createRecord();
    }
  });
  
})();
