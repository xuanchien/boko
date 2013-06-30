CKEDITOR.editorConfig = function(config){
  config.toolbar = null;
  config.toolbarGroups = [
    { name: "basicstyles",  groups: ["basicstyles", "cleanup"]},
    { name: "paragraph", groups: ["list", "indent", "align"]},
    { name: "links", groups: ["link"]},
    { name: "clipboard"},
    { name: "insert", groups: ["Image", "Smiley"]}
  ]
  config.enterMode = CKEDITOR.ENTER_BR;
  config.removePlugins = 'elementspath,flash,iframe,anchor';
  config.resize_enabled = false;
  config.language = 'vi';
}
