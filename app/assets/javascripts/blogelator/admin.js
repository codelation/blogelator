//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require prettify
//= require marked
//= require_self
//= require_tree ./admin/components
//= require_tree ./admin/controllers
//= require_tree ./admin/models
//= require_tree ./admin/routes
//= require_tree ./admin/templates

App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

App.Store = DS.Store.extend({
  adapter: DS.RESTAdapter.extend({})
});

App.Router.map(function() {
  this.resource('blogelator.admin.posts', { path: '/' }, function() {
    this.route('edit', { path: '/:post_id/edit' });
    this.route('new');
    this.route('show', { path: '/:post_id' });
  });
});

marked.setOptions({
  langPrefix: 'prettyprint lang-',
  highlight: function(code, lang) {
    return prettyPrintOne(code, lang);
  }
});