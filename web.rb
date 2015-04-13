require 'bundler'
require 'hestia'

Hestia::Server.run!(Hestia::Option.load(ARGV))
