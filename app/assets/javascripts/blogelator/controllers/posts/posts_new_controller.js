(function() {
  "use strict";
  
  App.PostsNewController = Ember.ObjectController.extend({
    actions: {
      save: function() {
        var post = this.get('content'),
            self = this;
            
        post.save().then(function(post) {
          // self.transitionToRoute('posts.show', post.get('id'));
          self.transitionToRoute('posts.index');
        }, function(post) {
          console.log('POST ERRORS', post.get('errors'));
        });
        
        return post;
      }
    }
  });

})();
