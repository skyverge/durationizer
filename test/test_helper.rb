$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'durationizer'
require 'maxitest/autorun'
require 'active_support/core_ext/numeric/time'

class DummyModel
  include Durationizer

  attr_accessor :delay_time_in_seconds, :delay_time_unit

  durationize :delay_time_in_seconds, unit: :delay_time_unit
end
