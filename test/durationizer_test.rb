require 'test_helper'

describe Durationizer do
  def setup
    @dummy = DummyModel.new
    @dummy.delay_time_unit = 'hours'
    @dummy.delay_time_in_seconds = 3_600
  end

  it 'has a version number' do
    refute_nil Durationizer::VERSION
  end

  context '#delay_time' do
    it 'should return an ActiveSupport::Duration object' do
      assert_kind_of ActiveSupport::Duration, @dummy.delay_time
      assert_equal 1.hour, @dummy.delay_time
    end
  end

  context '#delay_time=' do
    it 'should write the correct attribute' do
      @dummy.delay_time = 30.minutes

      assert_equal 1_800, @dummy.delay_time_in_seconds
      assert_equal 30.minutes, @dummy.delay_time
    end
  end

  context '#delay_time_in_units' do
    it 'should return number of hours' do
      assert_equal 1, @dummy.delay_time_in_units
    end

    it 'should raise when instance does not respond to given unit method' do
      broken_dummy = BrokenDummyModel.new
      broken_dummy.delay_time_in_seconds = 3600

      assert_raises NoMethodError do
        broken_dummy.delay_time_in_units
      end
    end
  end

  context '#delay_time_in_unit (singular)' do
    it 'should return number of hours' do
      assert_equal 1, @dummy.delay_time_in_unit
    end
  end
end
