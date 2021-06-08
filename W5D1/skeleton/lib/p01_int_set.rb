class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max 
    @store = Array.new(@max, false)
  
  end

  def insert(num)

    raise "Out of bounds" unless is_valid?(num)
    validate!(num)

  end


  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
    @store[num] = true 
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].any?(num)
  end

  private

  def [](num)
    ind = num % num_buckets
    @store[ind]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    # @num_buckets = num_buckets
  end

  def insert(num)
    resize! if @count == num_buckets
    unless include?(num)
      super(num)
      @count += 1
    end
  end
  
  def remove(num)
    if include?(num)
      super(num)
      @count -= 1 
    end
  end
  
  def include?(num)
    super(num)
  end
  
  private
  
  def [](num)
    ind = num % num_buckets
    @store[ind]
    # optional but useful; return the bucket corresponding to `num`
  end
  
  def num_buckets
    @store.length
  
  end
  
  def resize!
    list = []

    @store.each do |sub|
      sub.each {|int| list << int}
    end

    
    @store = Array.new((num_buckets * 2)) {Array.new}

    list.each {|int| self[int] << int }
  end

end
