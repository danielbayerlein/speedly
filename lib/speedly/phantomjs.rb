module Speedly

  class PhantomjsLoadError < LoadError
  end

  module Phantomjs
    extend self

    def run(script, *args)
      if installed?
        `phantomjs #{script} #{args.join(' ')}`
      else
        raise PhantomjsLoadError
      end
    end

    private

    def installed?
      `which phantomjs`
      $?.success?
    end
  end

end
