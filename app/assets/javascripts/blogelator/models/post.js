(function() {
  "use strict";
  
  App.Post = DS.Model.extend({
    bodyHtml:     DS.attr('string', { defaultValue: '' }),
    bodyMarkdown: DS.attr('string', { defaultValue: '' }),
    createdAt:    DS.attr('date'),
    publishedAt:  DS.attr('date'),
    summary:      DS.attr('string'),
    title:        DS.attr('string'),
    updatedAt:    DS.attr('date'),
    
    lastUpdatedAt: function() {
      var updatedAt = this.get('updatedAt');
      
      if (!Ember.isNone(updatedAt)) {
        return moment(updatedAt).fromNow();
      }
    }.property('secondsPassed', 'updatedAt')
  });

})();
