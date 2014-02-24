(function() {
  "use strict";
  
  App.Post = DS.Model.extend({
    bodyHtml: DS.attr('string', { defaultValue: '' }),
    bodyMarkdown: DS.attr('string', { defaultValue: '' }),
    title: DS.attr('string', { defaultValue: '' })
  });

})();
