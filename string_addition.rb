def add(input_string = "")
  input_values = string_to_numbers(input_string)
  sanitize_newlines(input_string) if has_newline?(input_string)
  input_values.reduce(0) { |sum, current_value| sum + current_value }
end

def string_to_numbers(input_string, separator = ',')
  input_string.split(separator).map(&:to_i)
end

def has_newline?(input_string)
  new_line_regex = Regexp.new("\n")
  !input_string.match(new_line_regex).nil?
end

def sanitize_newlines(input_string)
  input_string.gsub!("\n","")
end
