def add(input_string = '')
  input_values = string_to_numbers(input_string)
  input_values.reduce(0) { |sum, current_value| sum + current_value }
end

def string_to_numbers(input_string, separator = ',')
  input_string.split(separator).map(&:to_i)
end
