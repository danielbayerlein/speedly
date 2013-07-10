# Speedly

[![Gem Version](https://badge.fury.io/rb/speedly.png)](http://badge.fury.io/rb/speedly)
[![Dependency Status](https://gemnasium.com/danielbayerlein/speedly.png)](https://gemnasium.com/danielbayerlein/speedly)

Speedly is a simple CLI tool to test your page speed performance. It works with
[YSlow](https://github.com/marcelduran/yslow).

## Dependency

Speedly use [PhantomJS](https://github.com/ariya/phantomjs).

If you're on OS X, [Homebrew](https://github.com/mxcl/homebrew) is the simplest way to install
[PhantomJS](https://github.com/ariya/phantomjs):

``` bash
$ brew update && brew install phantomjs
```

For other operating systems, please check the
[download page](http://phantomjs.org/download.html).

## Installation

Install it yourself as:

``` bash
$ gem install speedly
```

And then execute:

``` bash
$ bundle
```

## Usage

Run Speedly in Basic mode:

```
$ speedly -u http://www.zwoio.de

URL:          http://www.zwoio.de/
Loading time: 2.3 s (2289 ms)
```

You can run Speedly with multiple URLs:

```
$ speedly -u http://www.zwoio.de,http://www.github.com

URL:          http://www.zwoio.de/
Loading time: 2.1 s (2111 ms)

URL:          https://github.com/
Loading time: 6.3 s (6327 ms)
```

`-a, --advanced` run Speedly in Advanced mode:

```
$ speedly -a -u http://www.zwoio.de

URL:          http://www.zwoio.de/
Loading time: 2.2 s (2173 ms)
Requests:     14
Score:        84/100
Size:         419 kB (429499 B)
```

`-v, --version` display the version:

```
$ speedly -v

Speedly version 0.1.2
```

`-h, --help` display the help message:

```
$ speedly --help

Usage: speedly [--url[=<url>,=<url>]] [--advanced] [--version]
    -u, --urls          Your URL(s)
    -a, --advanced      Use advanced mode.
    -v, --version       Display the version.
    -h, --help          Display this help message.
```

## Special Thanks

* [Sven Winkler (@svenwin)](https://github.com/svenwin) - For the name and suggestions for
improvement.
* [Ariya Hidayat (@ariya)](https://github.com/ariya) - [PhantomJS](https://github.com/ariya/phantomjs)
* [Marcel Duran (@marcelduran)](https://github.com/marcelduran) - [YSlow](https://github.com/marcelduran/yslow)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2013 Daniel Bayerlein. See [LICENSE](./LICENSE.md) for details.
