require 'spec_helper'

describe Speedly::CLI do

  describe '#run' do
    it 'expect a SystemExit' do
      Speedly::Phantomjs.stub(:installed?).and_return false
      cli = Speedly::CLI.allocate
      cli.stub!(:puts)
      expect { cli.run('http://example.com', 'basic') }
        .to raise_error(SystemExit)
    end
  end

end
