htmlTag = hexo.util.html_tag

module.exports = renderAsset = (tag, attr, url, text = '', attrs = {}) ->
  htmlTag 'asset', {}, JSON.stringify({tag, attr, url, text, attrs})
