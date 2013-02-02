require 'spec_helper'

describe Speedly::Phantomjs do

  describe '#run' do
    it 'expect a Speedly::PhantomjsLoadError' do
      Speedly::Phantomjs.stub(:installed?).and_return false
      expect { Speedly::Phantomjs.run(nil, nil) }
        .to raise_error(Speedly::PhantomjsLoadError)
    end

    it 'expect not a Speedly::PhantomjsLoadError' do
      Speedly::Phantomjs.stub(:installed?).and_return true
      expect { Speedly::Phantomjs.run(nil, '--version') }
        .to_not raise_error(Speedly::PhantomjsLoadError)
    end
  end

end
