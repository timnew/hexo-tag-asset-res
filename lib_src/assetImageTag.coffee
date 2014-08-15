renderAsset = require('./renderAsset')

assetImgRender = (args, content) ->
  renderAsset 'img', 'src', args.shift()

hexo.extend.tag.register 'asset_img', assetImgRender
