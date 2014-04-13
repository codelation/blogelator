(function() {
  "use strict";

  App.Router.reopen({
    rootURL: (App.get('appPath') === '/' ? '' : App.get('appPath')) + '/admin',
    location: 'history'
  });

})();
