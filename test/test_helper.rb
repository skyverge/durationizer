$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'durationizer'
require 'maxitest/autorun'
require 'active_support/core_ext/numeric/time'

class DummyModel
  attr_accessor :hour_in_seconds, :two_years_in_seconds

  def initialize
    @hour_in_seconds = 3600
    @two_years_in_seconds = 63_072_000
  end
end
