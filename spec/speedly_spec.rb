require 'spec_helper'

describe Speedly do

  %w(advanced basic).each do |method|
    describe "##{method}" do
      it 'expect a URI::InvalidURIError' do
        expect { Speedly.send(method, 'htt://example.com') }
          .to raise_error(URI::InvalidURIError)
      end

      it 'expect not a JSON::ParserError' do
        json = Speedly.send(method, 'http://example.com')
        expect { JSON.parse(json) }.to_not raise_error(JSON::ParserError)
      end

      it 'should have a key' do
        if method == 'basic'
          json = Speedly.basic('http://example.com')
          JSON.parse(json).should have_key('lt')
        else
          json = Speedly.advanced('http://example.com')
          JSON.parse(json).should have_key('r')
        end
      end
    end
  end

end
