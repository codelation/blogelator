(function() {
  "use strict";
  
  App.Router.reopen({
    rootURL: (App.get('blogelatorPath') === '/' ? '' : App.get('blogelatorPath')) + '/admin',
    location: 'history'
  });

  App.Router.map(function() {
    this.route('index', { path: '/' });
    this.resource('posts', { path: '/posts' }, function() {
      this.route('edit', { path: '/:post_id/edit' });
      this.route('new');
      this.route('show', { path: '/:post_id' });
    });
  });

})();
