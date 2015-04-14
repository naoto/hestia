require 'optparse'

module Hestia
  class Option < Hash

    def self.load(options)
      option = new({})
      op = OptionParser.new
      op.on('-p','--port VAL'){ |v| option[:port] = v}
      op.parse!(options)
      option
    end

  end
end
