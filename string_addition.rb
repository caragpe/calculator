require 'byebug'

def add(input_string = "")
  # byebug
  separator = custom_delimiter(input_string) || ","
  input_values = string_to_array(input_string, separator)
  return if error_when_negative_value(input_values)
  sanitize_newlines(input_string) if has_newline?(input_string)
  input_values.reduce(0) { |sum, current_value| sum + sanitize_values_larger_than_1000(current_value)}
end

def string_to_array(input_string, separator)
  input_string.split(separator).map(&:to_i)
end

def has_newline?(input_string)
  new_line_regex = Regexp.new("\n")
  input_string.match(new_line_regex).nil? ? false : true
end

def sanitize_newlines(input_string)
  input_string.gsub!("\n","")
end

def custom_delimiter(input_string)
  delimiter_control_characters = Regexp.new("//")
  match_result = input_string.match(delimiter_control_characters)
  match_result.nil? ? nil : extract_delimiter_characters(input_string)
end

def extract_delimiter_characters(input_string)
  delimiter_candidate = input_string.split("\n")[0].gsub("//","").split(",")
  regex_delimiter(delimiter_candidate)
end

def regex_delimiter(delimiters_array)
  escaped_delimiter_array = delimiters_array.map { |delimiter| Regexp.escape(delimiter) }
  escaped_delimiter_string = escaped_delimiter_array.join("|")
  Regexp.new(escaped_delimiter_string)
end

def error_when_negative_value(values_array)
  negative_values = []
  values_array.map{ |value| negative_values << value if is_negative?(value) }
  raise "Negatives not allowed: #{negative_values.inspect}" if negative_values.size > 0
  false
end

def sanitize_values_larger_than_1000(value)
  value <= 1000 ? value : 0
end

def is_negative?(x)
  x < 0
end
