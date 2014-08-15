(function() {
  var assetImgRender, renderAsset;

  renderAsset = require('./renderAsset');

  assetImgRender = function(args, content) {
    return renderAsset('img', 'src', args.shift());
  };

  hexo.extend.tag.register('asset_img', assetImgRender);

}).call(this);
