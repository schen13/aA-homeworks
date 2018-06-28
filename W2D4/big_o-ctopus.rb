def sluggish_octopus(fish_arr)
  fish_arr.each_index do |idx|
    longest = true
    (idx + 1...fish_arr.length).each do |idx2|
      next if idx == self.length - 1
      longest = false if fish_arr[idx2].length > fish_arr[idx].length
    end
    return fish_arr[idx] if longest
  end
end

class Array
  def merge_sort(&prc)
    prc ||= proc { |x, y| x <=> y }
    return self if count <= 1
    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        sorted << left.shift
      when 0
        sorted << left.shift
      when 1
        sorted << right.shift
      end
    end
    sorted + left + right
  end
end

def dominant_octopus(fish_arr)
  fish_arr.merge_sort(&prc).last
end

def clever_octopus(fish_arr)
  longest = fish_arr.first
  fish_arr.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == dir
  end
end

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
