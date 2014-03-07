(function() {
  "use strict";
  
  App.PostsShowController = Ember.ObjectController.extend({
    needs: ['posts'],
    
    actions: {      
      togglePublished: function(defer) {
        var post = this.get('content');
        
        if (Ember.isNone(post.get('publishedAt'))) {
          post.set('publishedAt', new Date());
        } else {
          post.set('publishedAt', null);
        }
        
        if (Ember.isNone(defer)) {
          post.save();
          return post;
        }
        
        if (!post.get('isDirty')) {
          defer.resolve();
        } else {
          post.save().then(function() {
            defer.resolve();
          }, function() {
            defer.reject();
          });
        }
        
        return post;
      }
    }
  });

})();
