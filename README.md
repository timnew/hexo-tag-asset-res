[![Stories in Ready](https://badge.waffle.io/timnew/hexo-tag-asset-res.png?label=ready&title=Ready)](https://waffle.io/timnew/hexo-tag-asset-res)
hexo-tag-asset-res  [![NPM version][npm-image]][npm-url] [![Dependency Status][depstat-image]][depstat-url]
==================

> [Hexo][hexo-url] tags that enable you to reference files in [post asset] with relative path

## Install

Install using [npm][npm-url].

    $ npm install hexo-tag-asset-res --save

## Usage

Suppose you have the following folder structure:
```
source\
  _posts\
    2014-08-15-a-simple-self-introduction.md
    2014-08-15-a-simple-self-introduction\
      my_portrait.jpg
      my_resume.pdf
```

In the markdown file `2014-08-15-a-simple-self-introduction.md`, you can reference files as

```
  {% asset_img my_portrait.jpg %}
  {% asset_link my_resume.pdf My Resume %}
```
It generates

```html
  <img src="/2014/08/15/a-simple-self-introduction/my_portrait.jpg">
  <a href="/2014/08/15/a-simple-self-introduction/my_resume.pdf">My Resume</a>
```

### Syntax Detail

```
  {% asset_img [.class1.class2] file_name.png [width [height]] ["caption" ["hint"]] %}

  {% asset_link [.class1.class2] file_name.png "text" ["hint"] %}
```

**class** (optional): Custom css classes in CSS falvor  
*hint*: `.class1.class2` generates `class="class1 class2"`

**filename** (mandantory): The file name of the image

**width** (optional): width, both `px` or `%` are accepted

**height** (optional): height, both `px` or `%` are accepted  
*hint*: `height` is only acceptable when `width` is avaiable

**caption** (optional): The caption of the image.  
*hint*: To avoid ambiguous value, always quote the text with space, `'` or `"` are both accepted

**text** (mandantory): The text of the `<a>`  
*hint*: To avoid ambiguous value, always quote the text with space, `'` or `"` are both accepted

**hint** (optional): The text displayed when mouse hover  
*hint*: To avoid ambiguous value, always quote the text with space, `'` or `"` are both accepted

## Asset Folder

Asset folder can be created manually, it should have the same name as the post

Or

Asset folder can be created automatically when post is created.  
Adjust the config in `_config.yml`:

```yaml
post_asset_folder: true
```

## Roadmap

* [x] Custom classes
* [x] Width, height for `Asset Image`
* [x] Title and alt for `Asset Image`
* [ ] `AssetImage` cascaded in `Asset Link`

## License
MIT

[![NPM downloads][npm-downloads]][npm-url]

[homepage]: https://github.com/timnew/hexo-tag-asset-res

[npm-url]: https://npmjs.org/package/hexo-tag-asset-res
[npm-image]: http://img.shields.io/npm/v/hexo-tag-asset-res.svg?style=flat
[npm-downloads]: http://img.shields.io/npm/dm/hexo-tag-asset-res.svg?style=flat

[depstat-url]: https://gemnasium.com/timnew/hexo-tag-asset-res
[depstat-image]: http://img.shields.io/gemnasium/timnew/hexo-tag-asset-res.svg?style=flat

[hexo-url]: http://hexo.io/
[post asset]: http://hexo.io/docs/writing.html#Asset_Folder
