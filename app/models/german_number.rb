require 'ziffern'

class GermanNumber
  attr_reader :number, :converter

  EmptyNumber = Struct.new(:number, :text)

  def self.from_string(string)
    string = string.to_s.strip
    if not string.empty?
      new(string)
    else
      EmptyNumber.new(string, 'Bitte geben Sie eine Zahl ein') if string.empty?
    end
  end

  def initialize(number, converter = Ziffern.new)
    @number, @converter = number, converter
  end

  def text
    converter.to_german(sanitized_input)
  rescue Ziffern::TooLargeNumberError
    'zu groß'
  rescue Ziffern::InvalidNumberError
    'ungültig'
  end

  private
  def sanitized_input
    number.gsub(/\s+/, '').gsub(/,/, '.')
  end
end
