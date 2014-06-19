describe Speedly::Phantomjs do

  describe '#run' do
    it 'expect a Speedly::PhantomjsLoadError' do
      allow(Speedly::Phantomjs).to receive(:installed?) { false }
      expect { Speedly::Phantomjs.run(nil, nil) }
        .to raise_error(Speedly::PhantomjsLoadError)
    end

    it 'expect not a Error' do
      allow(Speedly::Phantomjs).to receive(:installed?) { true }
      expect { Speedly::Phantomjs.run(nil, '--version') }
        .to_not raise_error
    end
  end

end
