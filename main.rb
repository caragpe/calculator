require './string_addition'

myStringNumberAddition = StringAddition.new()

string_array = [
  "",
  "1,2",
  "1\n,2,3",
  "//@@\n2@@2@@1",
  "//$$$,**,^\n1$$$2**3^5**6"
]

string_array.each do |string|
  puts "Input string: #{string}"
  puts "Return value: #{myStringNumberAddition.add(string)}"
  puts "Return value type is: #{myStringNumberAddition.add(string).class}"
  puts "---------"
end
