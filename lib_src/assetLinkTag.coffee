renderAsset = require('./renderAsset')

assetLinkRender = (args, content) ->
  url = args.shift()
  text = args.join(' ')

  renderAsset 'a', 'href', url, text

hexo.extend.tag.register 'asset_link', assetLinkRender
