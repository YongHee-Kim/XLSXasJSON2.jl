# XLSXasJSON
![LICENSE MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
[![Run tests](https://github.com/YongHee-Kim/XLSXasJSON.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/YongHee-Kim/XLSXasJSON.jl/actions/workflows/CI.yml)
[![Converage](https://github.com/YongHee-Kim/XLSXasJSON.jl/blob/gh-pages/dev/coverage/badge_linecoverage.svg)](https://YongHee-Kim.github.io/XLSXasJSON.jl/dev/coverage/index.html)

**Documentation**: [Docs](https://yonghee-kim.github.io/XLSXasJSON.jl/dev/)
<!-- [![][docs-latest-img]][docs-latest-url] -->


## Acknowledgement
As it is stated in the [license](./LICENSE), this package is developed with resources from [Devsisters Corp.](https://github.com/Devsisters) and inspired by the design of [excel-as-json](https://github.com/stevetarver/excel-as-json)


## Usage
Parse Excel xlsx files into a Julia data structure to write them as a JSON encoded file. 

Designated row or colum must be standardized [JSONPointer](https://tools.ietf.org/html/rfc6901) token, remaining rows will passed to json encoded file.

## Installation

```julia
pkg> add XLSXasJSON
```

# Acknowledgement
As it is stated in the [license](./LICENSE), this package is developed with resources from [Devsisters Corp.](https://github.com/Devsisters)