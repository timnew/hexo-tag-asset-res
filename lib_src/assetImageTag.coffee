renderAsset = require('./renderAsset')

isNumber = (str) ->
  str? and not /\D+/.test(str)

metaRegex = /["']?([^"']+)?["']?\s*["']?([^"']+)?["']?/

###
{% asset_img [.class1.class2] file_name.png [width [height]] ["caption" ["hint"]] %}
###
assetImgRender = (args, content) ->
  attrs = {}

  if args[0][0] == '.'
    attrs['class'] = args.shift().replace(/\./g, ' ')

  url = args.shift()

  if args.length > 0
    if isNumber(args[0])
      attrs.width = args.shift()

    if isNumber(args[0])
      attrs.height = args.shift()

    meta = args.join(' ')

  if meta?
    match = meta.match(metaRegex)
    attrs.alt = match[1]
    attrs.title = match[2]

  renderAsset 'img', 'src', url, attrs

hexo.extend.tag.register 'asset_img', assetImgRender
