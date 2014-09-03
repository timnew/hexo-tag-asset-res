(function() {
  var Permalink, assetRegex, htmlTag, moment, pathUtil, permalink, translateTag;

  moment = require('moment');

  pathUtil = require('path');

  htmlTag = hexo.util.html_tag;

  Permalink = hexo.util.permalink;

  permalink = null;

  assetRegex = /<asset>([^<>]+)<\/asset>/g;

  translateTag = function(baseUrl, options) {
    var attr, attrs, tag, text, url;
    tag = options.tag, attr = options.attr, url = options.url, text = options.text, attrs = options.attrs;
    attrs[attr] = hexo.config.root + baseUrl + url;
    return htmlTag(tag, attrs, text);
  };

  hexo.extend.filter.register(function(data, callback) {
    var baseUrl, date;
    if ((permalink == null) || permalink.url !== hexo.config.permalink) {
      permalink = new Permalink(hexo.config.permalink, {
        segments: {
          year: /(\d{4})/,
          month: /(\d{2})/,
          day: /(\d{2})/,
          i_month: /(\d{1,2})/,
          i_day: /(\d{1,2})/
        }
      });
    }
    date = moment(data.date);
    baseUrl = permalink.stringify({
      title: data.slug,
      year: date.format('YYYY'),
      month: date.format('MM'),
      day: date.format('DD'),
      i_month: date.format('M'),
      i_day: date.format('D')
    });
    data.content = data.content.replace(assetRegex, function() {
      return translateTag(baseUrl, JSON.parse(arguments[1]));
    });
    return callback(null, data);
  });

}).call(this);
