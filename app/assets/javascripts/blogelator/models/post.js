(function() {
  "use strict";
  
  App.Post = DS.Model.extend({
    bodyHtml: DS.attr('string'),
    bodyMarkdown: DS.attr('string'),
    title: DS.attr('string')
  });

})();
