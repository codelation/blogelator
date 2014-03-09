//= require codemirror/codemirror
//= require codemirror/closebrackets
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
//= require inline-attach
//= require marked

(function() {
  "use strict";

  App.MarkdownEditorComponent = Ember.Component.extend({
    classNames: ['blogelator-markdown-editor'],
    parseDelay: 100,
    resizeDelay: 50,
    scrollDelay: 10,
    
    didInsertElement: function() {
      var textArea = this.$('textarea')[0],
          editor = CodeMirror.fromTextArea(textArea, {
            autoCloseBrackets: true,
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
      
      // Capture Command/Ctrl + S
      var self = this;
      $(this.get('element')).on('keydown', function(e) {
        if (e.keyCode === 83 && (e.metaKey || e.ctrlKey)) {
          self.sendAction();
          return false;
        }
      });
    },
    
    editorDidChange: function() {
      var editor = this.get('editor'),
          preview = this.$('.html-preview .post'),
          parseContext = { name: 'parseMarkdown' },
          parseDelay = this.get('parseDelay'),
          scrollContext = { name: 'scrollViewport' },
          scrollDelay = this.get('scrollDelay'),
          viewport = $(this.get('element')),
          self = this;
          
      // Set initial editor value from component content
      editor.setValue(this.get('content'));
      
      // Syncs the preview scroll top from editor scroll top
      var syncEditorScrolling = function() {
        var viewportHeight = viewport.height(),
            editorScrollInfo = editor.getScrollInfo(),
            codeHeight = editorScrollInfo.height - viewportHeight,
            codeTop = editorScrollInfo.top,
            previewHeight = preview[0].scrollHeight - viewportHeight,
            ratio = previewHeight / codeHeight;
            
        preview.scrollTop(codeTop * ratio);
      };
      
      // Syncs the component content w/ the new editor value
      // And syncs scrolling after a change occurs
      var updateContent = function() {
        self.set('content', editor.getValue());
        Ember.run.debounce(scrollContext, syncEditorScrolling, scrollDelay);
      };
      
      // Update preview on change
      editor.on('change', function() {
        Ember.run.debounce(parseContext, updateContent, parseDelay);
      });
      
      // Scroll preview when markdown is scrolled
      editor.on('scroll', function() {
        Ember.run.debounce(scrollContext, syncEditorScrolling, scrollDelay);
      });
      
      // Handle image drag and drop uploading
      this._addInlineAttach(editor);
    }.observes('editor'),
    
    html: function() {
      var content = this.get('content');
      if (Ember.isNone(content)) {
        content = '';
      }
      return marked(content);
    }.property('content'),
    
    willDestroyElement: function() {
      // Remove scrolling observers
      var editor = this.get('editor');
      editor.off('change');
      editor.off('scroll');
      // Remove Command/Ctrl + S observer
      $(this.get('element')).off('keydown');
    },
    
    _addInlineAttach: function(editor) {
      function CodeMirrorEditor(instance) {
        var codeMirror = instance;
        
        return {
          getValue: function() {
            return codeMirror.getValue();
          },
          setValue: function(val) {
            var cursor = codeMirror.getCursor();
            codeMirror.setValue(val);
            codeMirror.setCursor(cursor);
          }
        };
      }
      CodeMirrorEditor.prototype = new inlineAttach.Editor();
      
      var inlineAttachInstance,
          inlineAttachEditor = new CodeMirrorEditor(editor);
          
      inlineAttachInstance = new inlineAttach({
        customUploadHandler: function(file) {
          var formData = new FormData(),
              filename = 'image-',
              extension = 'png',
              uploadUrl = (App.get('blogelatorPath') === '/' ? '/' : App.get('blogelatorPath') + '/') + 'api/images';

          // Attach the file. If coming from clipboard, add a default filename (only works in Chrome for now)
          // http://stackoverflow.com/questions/6664967/how-to-give-a-blob-uploaded-as-formdata-a-file-name
          if (file.name) {
            var fileNameMatches = file.name.match(/\.(.+)$/);
            if (fileNameMatches) {
              extension = fileNameMatches[1];
              filename = file.name.replace('.' + extension, '-');
            }
          }
          formData.append('file', file, filename + Date.now() + '.' + extension);
          
          $.ajax({
            url: uploadUrl,
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
              inlineAttachInstance.onUploadedFile(data);
            },
            error: function() {
              inlineAttachInstance.onErrorUploading();
            }
          });
          
          return false;
        },
        urlText: "![image]({filename})"
      }, inlineAttachEditor);
      
      editor.setOption('onDragEvent', function(data, e) {
        if (e.type === "drop") {
          e.stopPropagation();
          e.preventDefault();
          return inlineAttachInstance.onDrop(e);
        }
      });
    }
	});
  
})();
