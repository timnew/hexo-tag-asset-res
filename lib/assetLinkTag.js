(function() {
  var assetLinkRender, renderAsset;

  renderAsset = require('./renderAsset');

  assetLinkRender = function(args, content) {
    var text, url;
    url = args.shift();
    text = args.join(' ');
    return renderAsset('a', 'href', url, text);
  };

  hexo.extend.tag.register('asset_link', assetLinkRender);

}).call(this);
