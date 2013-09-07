require 'spec_helper'

describe Speedly do

  %w(advanced basic).each do |method|
    describe "##{method}" do
      it 'expect a URI::InvalidURIError' do
        expect { Speedly.send(method, 'htt://example.com') }
          .to raise_error(URI::InvalidURIError)
      end

      it 'expect not a Error' do
        json = Speedly.send(method, 'http://example.com')
        expect { JSON.parse(json) }.to_not raise_error
      end

      it 'should have a key' do
        json, key = if method == 'basic'
          [Speedly.basic('http://example.com'), 'lt']
        else
          [Speedly.advanced('http://example.com'), 'r']
        end
        JSON.parse(json).should have_key(key)
      end
    end
  end

end
