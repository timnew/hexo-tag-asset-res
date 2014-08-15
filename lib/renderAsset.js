(function() {
  var htmlTag, renderAsset;

  htmlTag = hexo.util.html_tag;

  module.exports = renderAsset = function(tag, attr, url, text, attrs) {
    if (text == null) {
      text = '';
    }
    if (attrs == null) {
      attrs = {};
    }
    return htmlTag('asset', {}, JSON.stringify({
      tag: tag,
      attr: attr,
      url: url,
      text: text,
      attrs: attrs
    }));
  };

}).call(this);
