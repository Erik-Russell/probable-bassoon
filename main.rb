# frozen_string_literal: true

require_relative 'lib/hash_map'

puts 'This is a test of the custom'
puts 'HashMap class.'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('carrot', 'purple')

puts "The length should be 12 => acutal:#{test.length}"
