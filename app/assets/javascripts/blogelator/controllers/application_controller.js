(function() {
  "use strict";
  
  App.ApplicationController = Ember.ObjectController.extend({
    currentPathDidChange: function() {
      var bodyClass = 'ember-application blogelator ' + this.get('currentPath').split('.').join(' ');
      $('body').attr('class', bodyClass);
    }.observes('currentPath')
  });

})();
