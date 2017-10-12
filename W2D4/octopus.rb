class Octopus
  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
          'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].freeze
  def sluggish
    my_arr = FISH.dup
    longest = my_arr[0]
    my_arr.each do |el|
      my_arr.each do |el2|
        if longest.length < el.length || longest.length < el2.length
          el.length > el2.length ? longest = el : longest = el2
        end
      end
    end
    longest
  end

  def dominant
    my_arr = FISH.dup
    my_arr.sort_by!(&:length)
    my_arr.last
  end

  def clever
    my_arr = FISH.dup
    longest = my_arr[0]
    (1...my_arr.length).each do |el|
      longest = my_arr[el] if longest.length < my_arr[el].length
    end
    longest
  end
end

class Dancing_Octopus

  def slow_dance(tile_str, tile_arr)
    tile_arr.each_with_index {|tile, i| return i if tile_str == tile}
  end

  def constant_dance(tile_str, tile_hash)
    tile_hash[tile_str]
  end
end

o = Octopus.new
p o.sluggish == 'fiiiissshhhhhh'
p o.dominant == 'fiiiissshhhhhh'
p o.clever == 'fiiiissshhhhhh'
d = Dancing_Octopus.new
TILES = ["up", "right-up", "right", "right-down",
        "down", "left-down", "left", "left-up" ].freeze
TILES_HASH = {
  "up" => 0,
"right-up" => 1,
"right"=> 2,
"right-down" => 3,
"down" => 4,
"left-down" => 5,
"left" => 6,
"left-up" => 7
}

p d.slow_dance("up", TILES)

p d.constant_dance("right-down", TILES_HASH)
