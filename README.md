# StringAddition

StringAddition is a simple string calculator based in Ruby.

## Features

  1. Support alphanumeric string as input.
  1. Returns integer value as output, or RuntimeError.
  1. Uses the character "," (comma) as default number delimiter
  1. Supports newline characters as part of the string without impacting the calculation.
  1. Supports custom delimiter using the format:
```
//[custom_delimiter]\n1[custom_delimiter]2[custom_delimiter]3
```
  1. Supports multiple custom delimiters using the format:
```
//[custom_delimiter_1],[custom_delimiter_2]\n1[custom_delimiter_1]2[custom_delimiter_2]3
```
  1. Delimiters can be arbitrary length. I.e.: @@@@ , **, $$$

## Restrictions

 1. Numbers larger than 1000 are not supported
 1. Negative numbers are not supported
    1. Calling add with a negative number should throw an exception: “Negatives not allowed”. The exception should list the number(s) that caused the exception

## Installation

StringAddition has been developed using Ruby 2.4.

Tests require Rspec to run. Current developed version uses Rspec 3.8.

For troubleshooting purposes, byebug was added as a development dependency.

To install required gems:

```ruby
$ bundle install
```

## Running tests

Change directory to the main application folder of StringAddition and run the following:

```ruby
$ rspec
```

Also:

```ruby
$ bundle exec rspec
```

## Usage

Please visit _main.rb_ and modify existing examples as desired:

```ruby
require './string_addition'

myStringNumberAddition = StringAddition.new()

# Edit the following array to include desired cases
string_array = [
  "",
  "1,2",
  "1\n,2,3",
  "//@@\n2@@2@@1",
  "//$$$,**,^\n1$$$2**3^5**6"
]

# For output purposes on the terminal
string_array.each do |string|
  puts "Input string: #{string}"
  puts "Return value: #{myStringNumberAddition.add(string)}"
  puts "Return value type is: #{myStringNumberAddition.add(string).class}"
  puts "---------"
end
```

## ToDo

`string_to_array(input_string)` method may return an array with zeros at the beginning of the array *equal to the number of custom delimiters used*. It does not affect the calculation. This is *not happening with custom delimiter*. Refactor is needed to remove those non-existent 0s in the array.

Investigate if `to_i` can cause any server error depending on user input. As of now, `to_i` successfully removes any \n character from the string array.
