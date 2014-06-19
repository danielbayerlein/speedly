describe Speedly::CLI do

  describe '#run' do
    it 'expect a SystemExit' do
      allow(Speedly::Phantomjs).to receive(:installed?) { false }
      cli = Speedly::CLI.allocate
      allow(cli).to receive(:puts)
      expect { cli.run('http://example.com', 'basic') }
        .to raise_error(SystemExit)
    end
  end

end
