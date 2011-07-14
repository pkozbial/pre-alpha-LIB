#!/usr/bin/env ruby


module PK
module DataStruct
class Arrays

# groups an array into an array of arrays
# each sequence of 'equivalent' elements form one array in the big array
# what is 'equivalent' is decided by yielding a pair of elements to compare
# the block should return true/false
def self.arrayGroupBy( array )
  len = array.length
  if len == 0
    return []
  end
  retArray = []
  subarr = [array[0]]
  (1..len-1).each do |i|
    if yield( subarr[0], array[i] )
      subarr += [array[i]]
    else
      retArray += [subarr]
      subarr = [array[i]]
    end
  end
  retArray += [subarr]
  
  return retArray
end

# groups into subarrays starting on selected elements
# the elements are selected by block (which must return true to start new subarray)
# PARAMETER 'strict' - will fail (return nil) if first element of the input array
# does not evaluate to true in the block
# (if strict==false, then the first element in array is not yielded to the block)
def self.arrayGroupByHeads( array, strict )
  len = array.length
  if len == 0
    return []
  end
  retArray = []
  if strict
    return nil unless yield array[0]
  end
  subarr = [array[0]]
  (1..len-1).each do |i|
    if yield( array[i] )
      retArray += [subarr]
      subarr = [array[i]]
    else
      subarr += [array[i]]
    end
  end
  retArray += [subarr]
  
  return retArray
end

end
end
end

