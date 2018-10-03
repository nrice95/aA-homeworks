require_relative "big_octopus.rb"

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

puts sluggish(arr) == "fiiiissshhhhhh"
puts dominant(arr) == "fiiiissshhhhhh"
puts clever(arr) == "fiiiissshhhhhh"

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

puts slow_dance("up", tiles_array) == 0
puts slow_dance("right-down", tiles_array) == 3

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

puts constant_dance("up", tiles_hash) == 0
puts constant_dance("right-down", tiles_hash) == 3
