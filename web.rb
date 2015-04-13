#!/usr/bin/env ruby

require 'hestia'

Hestia::Server.run!(Hestia::Option.load(ARGV))
