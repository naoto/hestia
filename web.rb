#!/usr/bin/env ruby

require './lib/hestia'

Hestia::Server.run!(Hestia::Option.load(ARGV))
