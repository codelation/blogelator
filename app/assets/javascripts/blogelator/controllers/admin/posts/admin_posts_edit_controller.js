(function() {
  "use strict";
  
  App.AdminPostsEditController = Ember.ObjectController.extend({
    actions: {
      save: function() {
        var post = this.get('content');
        post.save();
      }
    }
  });

})();
