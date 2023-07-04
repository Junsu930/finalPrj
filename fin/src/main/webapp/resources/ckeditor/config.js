CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'clipboard', groups: [ 'undo', 'clipboard' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'document', groups: [ 'document', 'mode', 'doctools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Save,NewPage,Print,Scayt,SelectAll,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CreateDiv,Language,Flash,PageBreak,Iframe,Templates,Anchor,Link,Unlink,Preview,Source,About,Undo,Redo,Copy,Cut,Paste,PasteText,PasteFromWord,Superscript,Subscript,Strike,CopyFormatting,RemoveFormat,NumberedList,BulletedList,Outdent,Indent,Blockquote,JustifyCenter,BidiRtl,BidiLtr,Format,Styles,BGColor,Table,HorizontalRule,Smiley,SpecialChar,Maximize,ShowBlocks,Find,Replace,JustifyLeft,JustifyRight,JustifyBlock';
};