SHOULD_BE_TRUE_ARRAYS = [
  [2, 3, 4, 5, 0, 1],
  [4, 5, 6, 9, 1],
  [10, 11, 6, 7, 9],
  [1, 2, 3, 4, 5],
  [5, 7, 43, 987, -9, 0],
  [1, 2, 3, 4, 1]
]

SHOULD_BE_FALSE_ARRAYS = [
  [4, 1, 2, 5],
  [8, 7, 6, 5, 4, 3],
  [6, 7, 4, 8],
  [7, 6, 5, 4, 3, 2, 1]
]

def is_circularly_sorted?( array_to_test )
  previous_value   = array_to_test.shift
  is_circular     = true
  rollover        = false
  rollover_max    = nil

  array_to_test.each do | current_value |

    if rollover
      if ( (current_value <= previous_value) || (current_value > rollover_max) )
        # In a rollover but now have a previous value greater than our current value OR current value greater than our rollover point
        # That means this is not a circularly sorted array
        is_circular = false
        break
      end

      # In a rollover, but current value is greter than previous and less than rollover point, so continue on
      previous_value = current_value
    else
      if current_value >= previous_value
        # Not in a rollover, current element is greater/equal than previous
        previous_value = current_value
      else
        # Not in a rollover, but current element is less than current value, so here is our rollover point
        rollover      = true
        rollover_max  = previous_value
        previous_value = current_value
      end
    end

  end

  is_circular
end

SHOULD_BE_FALSE_ARRAYS.each do | test_array |

  puts "Array #{test_array.inspect} circularly sorted? - #{is_circularly_sorted?( test_array )}"

end

puts "==========================================="

SHOULD_BE_TRUE_ARRAYS.each do | test_array |

  puts "Array #{test_array.inspect} circularly sorted? - #{is_circularly_sorted?( test_array )}"

end