require 'test_helper'

describe Durationizer do
  def setup
    @dummy = DummyModel.new
    @dummy.delay_time_in_seconds = 3_600
  end

  it 'has a version number' do
    refute_nil Durationizer::VERSION
  end

  context '#hour' do
    it 'should return an ActiveSupport::Duration object' do
      assert_kind_of ActiveSupport::Duration, @dummy.delay_time
      assert_equal 1.hour, @dummy.delay_time
    end
  end

  context '#hour=' do
    it 'should write the correct attribute' do
      @dummy.delay_time = 30.minutes

      assert_equal 1_800, @dummy.delay_time_in_seconds
      assert_equal 30.minutes, @dummy.delay_time
    end
  end
end
