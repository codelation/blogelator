(function() {
  "use strict";
  
  App.PostsEditController = Ember.ObjectController.extend({
    actions: {
      save: function() {
        var post = this.get('content');
        post.save();
      }
    }
  });

})();
