require 'rails'

module Durationizer
  class Railtie < Rails::Railtie
    initializer 'durationizer.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Durationizer
      end
      I18n.load_path << File.expand_path(File.dirname(__FILE__) + '/../../config/locales/en.yml')
    end
  end
end
