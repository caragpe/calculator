def add(input_string = "")
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
  new_line = "\n"
  new_delimiter_regex = Regexp.new("//")
  match_result = input_string.match(new_delimiter_regex)
  match_result.nil? ? nil : input_string.split(new_line)[0].gsub("//","")
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
