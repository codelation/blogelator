//= require codemirror
//= require marked

(function() {
  "use strict";

  App.MarkdownEditorComponent = Ember.Component.extend({
    classNames: ['blogelator-markdown-editor'],
    markdown: '',
    
    didInsertElement: function() {
      var textArea = this.$('textarea')[0];
      
      this.set('editor', CodeMirror.fromTextArea(textArea, {
        mode: 'markdown'
      }));
    },
    
    editorDidChange: function() {
      var editor = this.get('editor'),
          self = this;
      console.log("WAT1");
      this.set('markdown', editor.getValue());
      editor.on('change', function(instance) {
        console.log("WAT");
        self.set('markdown', instance.getValue());
      });
    }.observes('editor'),
    
    html: function() {
      var markdown = this.get('markdown');
      if (Ember.isNone(markdown)) {
        markdown = '';
      }
      return marked(markdown);
    }.property('markdown')
	});
  
})();
