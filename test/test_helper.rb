$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'durationizer'
require 'minitest/autorun'
require 'maxitest/autorun'
require 'active_support/core_ext/numeric/time'
require 'active_model'

class DummyModel
  include Durationizer
  include ActiveModel::Validations

  attr_accessor :delay_time_in_seconds, :delay_time_unit

  durationize :delay_time_in_seconds, unit: :delay_time_unit
end

class BrokenDummyModel
  include Durationizer
  include ActiveModel::Validations

  attr_accessor :delay_time_in_seconds
  durationize :delay_time_in_seconds
end

class DummyModelWithoutValidations
  include Durationizer
  include ActiveModel::Validations

  attr_accessor :delay_time_in_seconds, :delay_time_unit

  durationize :delay_time_in_seconds, unit: :delay_time_unit, with_validations: false
end
