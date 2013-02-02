require 'json'
require 'uri'

require 'speedly/phantomjs'
require 'speedly/version'

module Speedly
  extend self

  include Speedly::Phantomjs

  %w(advanced basic).each do |method_name|
    define_method(method_name) do |url|
      if URI.parse(url).kind_of?(URI::HTTP)
        yslow_js = File.join(File.dirname(__FILE__), 'speedly', 'vendor',
                             'assets', 'javascripts', 'yslow.js')
        Speedly::Phantomjs.run(yslow_js, ['--info basic', url])
      else
        raise URI::InvalidURIError
      end
    end
  end

end
