htmlTag = hexo.util.html_tag

module.exports = renderAsset = (tag, attr, url, text = '', attrs = {}) ->
  if typeof(text) is 'object'
    attrs = text
    text = ''

  htmlTag 'asset', {}, JSON.stringify({tag, attr, url, text, attrs})
