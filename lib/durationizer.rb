require 'durationizer/version'

module Durationizer
  require 'durationizer/railtie' if defined?(Rails)

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def durationize(*columns)
      columns.each do |column|
        reader_name = column.to_s.sub(/_in_seconds$/, '')
        writer_name = "#{reader_name}="

        define_method reader_name do
          public_send(column).seconds
        end

        define_method writer_name do |duration|
          public_send("#{column}=", duration)
        end
      end
    end
  end
end
