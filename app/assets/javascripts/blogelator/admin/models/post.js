(function() {
  "use strict";
  
  App.Post = DS.Model.extend({
    bodyMarkdown: DS.attr('string'),
    title: DS.attr('string')
  });

})();
