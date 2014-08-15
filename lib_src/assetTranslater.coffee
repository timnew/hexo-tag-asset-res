moment = require('moment')
pathUtil = require('path')

htmlTag = hexo.util.html_tag
Permalink = hexo.util.permalink

permalink = null

assetRegex = /<asset>([^<>]+)<\/asset>/g

translateTag = (baseUrl, options) ->
  {tag, attr, url, text, attrs} = options

  attrs[attr] = baseUrl + url

  htmlTag tag, attrs, text

hexo.extend.filter.register (data, callback) ->
  if !permalink? or permalink.rul != hexo.config.permalink
    permalink = new Permalink hexo.config.permalink,
          segments:
            year: /(\d{4})/
            month: /(\d{2})/
            day: /(\d{2})/
            i_month: /(\d{1,2})/
            i_day: /(\d{1,2})/

  date = moment(data.date)

  baseUrl = permalink.stringify
              title: data.slug
              year: date.format('YYYY')
              month: date.format('MM')
              day: date.format('DD')
              i_month: date.format('M')
              i_day: date.format('D')

  data.content = data.content.replace assetRegex, ->
    translateTag baseUrl, JSON.parse(arguments[1])

  callback(null, data)
