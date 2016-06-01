# Create an array of the words in the sentence below
# Find how many words have a length equal to 5


string = "Tacos must not have lettuce Only meat and cheese and salsa"
arrays = string.split(" ")
puts arrays.inspect

arrays.select {|array| array.length == 5}
.each {|array| puts array.inspect}
