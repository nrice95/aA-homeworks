def sluggish(arr)
  longest = arr.first
  arr.each_with_index do |fish1,i|
    other_fish = arr[0...i] + arr[i+1..-1]
    if other_fish.none? {|fish2| fish2.length > fish1.length}
      longest = fish1
    end
  end
  longest
end

def dominant(arr)
  merge_sort(arr).last
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length/2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left,right)
end

def merge(left,right)
  prc = Proc.new {|fish1,fish2| fish1.length <=> fish2.length }

  return right if left.length == 0
  return left if right.length == 0

  if prc.call(left.first,right.first) < 1
    [left.first] + merge(left[1..-1],right)
  else
    [right.first] + merge(left,right[1..-1])
  end
end

def clever(arr)
  arr.reduce do |acc,fish|
    if fish.length > acc.length
      fish
    else
      acc
    end
  end
end

def slow_dance(direction,arr)
  arr.each_with_index {|tile,i| return i if tile == direction}
end

def constant_dance(direction,hash)
  hash[direction]
end
