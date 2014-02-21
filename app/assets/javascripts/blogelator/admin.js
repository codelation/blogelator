//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ./markdown
//= require ./marked
//= require_self
//= require_tree ./admin/components
//= require_tree ./admin/templates
//= require_tree ./admin/views

App = Ember.Application.create();

App.Router = Ember.Router.extend({
  location: 'none'
});