require 'rails'

module Durationizer
  class Railtie < Rails::Railtie
    initializer 'durationizer.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Durationizer
      end
    end
  end
end
