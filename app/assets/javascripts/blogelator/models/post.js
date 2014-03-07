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
    
    publishedAtFormatted: function() {
      var publishedAt = this.get('publishedAt');
      
      if (Ember.isNone(publishedAt)) {
        return "Unpublished";
      } else {
        return moment(publishedAt).format('MMMM D, YYYY');
      }
    }.property('publishedAt'),
    
    updatedAtFormatted: function() {
      var updatedAt = this.get('updatedAt');
      
      if (Ember.isNone(updatedAt)) {
        return "Never";
      } else {
        return moment(updatedAt).fromNow();
      }
    }.property('secondsPassed', 'updatedAt')
  });

})();
