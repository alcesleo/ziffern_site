require 'ziffern'

class GermanNumber
  attr_reader :input, :converter

  EmptyNumber = Struct.new(:input, :output)

  def self.from_string(string)
    string = string.to_s.strip
    return EmptyNumber.new(string, 'Bitte geben Sie eine Zahl ein') if string.empty?
    new(string)
  end

  def initialize(input, converter = Ziffern.new)
    @input, @converter = input, converter
  end

  def output
    @output ||= converter.to_german(sanitized_input) rescue 'zu groß'
  end

  private
  def sanitized_input
    input.gsub(/\s+/, '')
  end
end
