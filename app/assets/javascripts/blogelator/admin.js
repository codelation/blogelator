//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require_tree ./config
//= require_tree ./components
//= require_tree ./controllers
//= require_tree ./models
//= require_tree ./routes
//= require_tree ./templates

App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

App.Store = DS.Store.extend({
  adapter: DS.RESTAdapter.extend({})
});

App.Router.map(function() {
  this.resource('admin.posts', { path: '/' }, function() {
    this.route('edit', { path: '/:post_id/edit' });
    this.route('new');
    this.route('show', { path: '/:post_id' });
  });
});