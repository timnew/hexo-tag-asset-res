(function() {
  var assetLinkRender, metaRegex, renderAsset;

  renderAsset = require('./renderAsset');

  metaRegex = /["']?([^"']+)?["']?\s*["']?([^"']+)?["']?/;


  /*
  {% asset_link [.class1.class2] file_name.png "text" ["hint"] %}
   */

  assetLinkRender = function(args, content) {
    var attrs, match, text, url;
    attrs = {};
    if (args[0][0] === '.') {
      attrs['class'] = args.shift().replace(/\./g, ' ');
    }
    url = args.shift();
    if (args.length > 0) {
      match = args.join(' ').match(metaRegex);
      text = match[1];
      attrs.title = match[2];
    }
    return renderAsset('a', 'href', url, text, attrs);
  };

  hexo.extend.tag.register('asset_link', assetLinkRender);

}).call(this);
