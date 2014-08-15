hexo-tag-asset-res  [![NPM version][npm-image]][npm-url] [![Dependency Status][depstat-image]][depstat-url]
==================

> [Hexo][hexo-url] tags that enable you to reference files in post asset with relative path

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

In the markdown file `2014-08-15-a-simple-self-introduction.md`, you can

### Image

Create `<img>` tag with

```
  {% asset_img my_portrait.jpg %}
```
and with get
```
  <img src="/2014/08/15/a-simple-self-introduction/my_portrait.jpg">
```
### Download

Create `<a>` tag with

```
  {% asset_link my_resume.pdf My Resume %}
```
and with get
```
  <a href="/2014/08/15/a-simple-self-introduction/my_resume.pdf">My Resume</a>
```

## Roadmap

* [ ] Custom classes
* [ ] Width, height for `Asset Image`
* [ ] Title and alt for `Asset Image`
* [ ] `AssetImage` cascaded in `Asset Link`

## License
MIT

[![NPM downloads][npm-downloads]][npm-url]

[homepage]: https://github.com/timnew/hexo-tag-asset-res

[npm-url]: https://npmjs.org/package/hexo-tag-asset-res
[npm-image]: http://img.shields.io/npm/v/hexo-tag-asset-res.svg?style=flat
[npm-downloads]: http://img.shields.io/npm/dm/hexo-tag-asset-res.svg?style=flat

[depstat-url]: https://gemnasium.com/timnew/hexo-tag-asset-res
[depstat-image]: http://img.shields.io/gemnasium/timnew/hexo-tag-asset-res

[hexo-url]: http://hexo.io/
