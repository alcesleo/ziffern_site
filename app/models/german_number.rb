require 'ziffern'

class GermanNumber
  attr_reader :input, :converter

  EmptyNumber = Struct.new(:input, :output)

  def self.from_string(string)
    return EmptyNumber.new(string.to_s, 'Bitte geben Sie eine Zahl ein') if string.to_s.empty?
    new(string)
  end

  def initialize(input, converter = Ziffern.new)
    @input, @converter = input, converter
  end

  def output
    @output ||= converter.to_german(sanitized_input)
  end

  private
  def sanitized_input
    input.gsub(/\s+/, '').to_f
  end
end
