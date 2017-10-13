class LRUCache
  def initialize(size)
    @max_size = size
    @array = []
    @lru_indxs = []
  end

  def count
    # returns number of elements currently in cache
    @array.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @array.include?(el)
    elsif @max_size > count
      @array << el
    else
      @array[lru_num] = el
    end
    update_lru(@array.index(el))
  end

  def show
    # shows the items in the cache, with the LRU item first
    @lru_indxs.each { |idx| print @array[idx]}
  end

  private
  # helper methods go here!
  def lru_num
    @lru_indxs.first
  end

  def update_lru(num)
    @lru_indxs.delete(num) { @lru_indxs }
    @lru_indxs << num
    if @lru_indxs.length > @max_size
      @max_size.shift
    end
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show #
