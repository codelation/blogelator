//= require codemirror/codemirror
//= require codemirror/overlay
//= require codemirror/markdown
//= require codemirror/gfm
//= require codemirror/coffeescript
//= require codemirror/css
//= require codemirror/htmlmixed
//= require codemirror/javascript
//= require codemirror/php
//= require codemirror/ruby
//= require codemirror/sass
//= require codemirror/xml
//= require codemirror/yaml
//= require marked

(function() {
  "use strict";

  App.MarkdownEditorComponent = Ember.Component.extend({
    classNames: ['blogelator-markdown-editor'],
    markdown: '',
    
    didInsertElement: function() {
      var textArea = this.$('textarea')[0],
          editor = CodeMirror.fromTextArea(textArea, {
            mode: 'gfm',
            smartIndent: false,
            indentWithTabs: false,
            tabSize: 2
          });
      
      // Spaces instead of tabs
      editor.addKeyMap({
        Tab: function(cm) {
          var spaces = new Array(cm.getOption("indentUnit") + 1).join(" ");
          cm.replaceSelection(spaces, "end", "+input");
        }
      });
      
      this.set('editor', editor);
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
