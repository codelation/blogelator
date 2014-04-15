(function() {
  "use strict";

  App.Store = DS.Store.extend({
    adapter: DS.ActiveModelAdapter.extend({
      namespace: (App.get('appPath') + '/').substring(1) + 'api'
    })
  });

})();
