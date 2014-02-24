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
    updateDelay: 200,
    
    didInsertElement: function() {
      var textArea = this.$('textarea')[0],
          editor = CodeMirror.fromTextArea(textArea, {
            indentWithTabs: false,
            lineWrapping: true,
            mode: 'gfm',
            smartIndent: false,
            tabSize: 2
          });
      
      // Replace tab with spaces
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
          context = { name: 'parseMarkdown' },
          updateDelay = this.get('updateDelay'),
          self = this;
      
      var updateContent = function() {
        self.set('content', editor.getValue());
      };
      
      editor.setValue(this.get('content'));
      editor.on('change', function() {
        Ember.run.debounce(context, updateContent, updateDelay);
      });
    }.observes('editor'),
    
    html: function() {
      var content = this.get('content');
      if (Ember.isNone(content)) {
        content = '';
      }
      return marked(content);
    }.property('content')
	});
  
})();
