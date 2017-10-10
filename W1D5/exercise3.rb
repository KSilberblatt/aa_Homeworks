class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value] if lookup(key) == nil
    @map.each { |arr| arr[1] = value if arr[0] == key }
  end

  def lookup(key)
    @map.each { |arr| return arr[1] if arr[0] == key }
    nil
  end

  def remove(key)
    return nil if lookup(key) == nil
    new_map = []
    @map.each { |arr| new_map << arr unless arr[0] == key }
    @map = new_map
  end
end
