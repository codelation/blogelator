//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require marked
//= require_self
//= require_tree ./admin/components
//= require_tree ./admin/controllers
//= require_tree ./admin/models
//= require_tree ./admin/routes
//= require_tree ./admin/templates
//= require_tree ./admin/views

App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

App.Store = DS.Store.extend();

App.Router.map(function() {
  this.resource('blogelator.admin.posts', { path: '/' }, function() {
    this.route('edit', { path: '/:post_id/edit' });
    this.route('new');
    this.route('show', { path: '/:post_id' });
  });
});