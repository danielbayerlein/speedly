require 'slop'

require 'speedly'
require 'speedly/core_ext/string'

class Speedly::CLI

  include Speedly::Phantomjs

  def initialize
    opts = Slop.parse({ help: true, strict: true }) do
      banner 'Usage: speedly [--url[=<url>,=<url>]] [--advanced] ' \
             '[--version]'

      on :u=, :url=, 'Your URL(s)', as: Array, delimiter: ',', argument: true
      on :a, :advanced, 'Use advanced mode.'
      on :v, :version, 'Display the version.' do
        puts "Speedly version #{Speedly::VERSION}"
      end
    end

    if opts.url?
      opts[:url].each_with_index do |url, i|
        run(url, opts.advanced? ? 'advanced' : 'basic')
        puts "\n" unless i + 1 == opts[:url].length
      end
    elsif !opts.version? && !opts.help?
      puts opts.help
    end
  end

  def run(url, mode)
    begin
      json = mode == 'basic' ? Speedly.basic(url) : Speedly.advanced(url)
      format_output(json, mode)
    rescue Speedly::PhantomjsLoadError
      puts "[#{'FAILED'.red.reset}]      " \
           'PhantomJS not found. Please install PhantomJS.'
      exit
    rescue URI::InvalidURIError
      puts "[#{'FAILED'.red.reset}]      " \
           "'#{url.to_s.bold.reset}' is not a valid URL.\n"
    end
  end

  private

  def format_output(json, mode)
    hash = JSON.parse(json)
    puts "URL:          #{URI.decode(hash['u'])}\n"
    ms_to_sec = (hash['lt'] / 1000.0).modulo(1000).round(1)
    puts "Loading time: #{ms_to_sec} s (#{hash['lt']} ms)\n"
    if mode == 'advanced'
      puts "Requests:     #{hash['r']}\n"
      puts "Score:        #{hash['o']}/100\n"
      bytes_to_kilobytes = (hash['w'] / 1024.0).round
      puts "Size:         #{bytes_to_kilobytes} kB (#{hash['w']} B)\n"
    end
  end

end
