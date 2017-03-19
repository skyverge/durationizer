require 'durationizer/version'

module Durationizer
  require 'durationizer/railtie' if defined?(Rails)

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def durationize(column, options = {})
      reader_name = column.to_s.sub(/_in_seconds$/, '')
      writer_name = "#{reader_name}="
      unit_column = options.fetch(:unit, "#{reader_name}_unit")

      define_method reader_name do
        public_send(column).seconds
      end

      define_method writer_name do |duration|
        public_send("#{column}=", duration)
      end

      define_method "#{reader_name}_in_units" do
        unit_value = public_send(unit_column)
        public_send(reader_name) / 1.send(unit_value)
      end
      alias_method "#{reader_name}_in_unit", "#{reader_name}_in_units"

      define_method "#{reader_name}_in_units=" do |quantity_in_units|
        unit_type = public_send(unit_column)
        duration = Integer(quantity_in_units).public_send(unit_type)
        public_send(writer_name, duration)
      end
    end
  end
end
