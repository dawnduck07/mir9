CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'document', groups: [ 'mode', 'doctools', 'document' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'about', groups: [ 'about' ] },
		'/',
		{ name: 'others', groups: [ 'others' ] }
	];

	config.removeButtons = 'Save,NewPage,ExportPdf,Preview,Templates,Find,Replace,Format,Styles,ShowBlocks,Smiley,PageBreak,Iframe,BidiLtr,BidiRtl,Language,Blockquote,CreateDiv,CopyFormatting,Underline,Superscript,Subscript,HiddenField,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,SelectAll';
};