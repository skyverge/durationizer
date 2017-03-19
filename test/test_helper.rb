$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'durationizer'
require 'minitest/autorun'
require 'maxitest/autorun'
require 'active_support/core_ext/numeric/time'
require 'active_model'

class DummyModel
  include Durationizer
  include ActiveModel::Dirty

  attr_reader :delay_time_in_seconds, :delay_time_unit
  define_attribute_methods :delay_time_in_seconds, :delay_time_unit

  durationize :delay_time_in_seconds, unit: :delay_time_unit

  def delay_time_in_seconds=(value)
    delay_time_in_seconds_will_change! if value != @delay_time_in_seconds
    @delay_time_in_seconds = value
  end

  def delay_time_unit=(value)
    delay_time_unit_will_change! if value != @delay_time_unit
    @delay_time_unit = value
  end

  def save
    changes_applied
  end
end

class BrokenDummyModel
  include Durationizer

  attr_accessor :delay_time_in_seconds
  durationize :delay_time_in_seconds
end
