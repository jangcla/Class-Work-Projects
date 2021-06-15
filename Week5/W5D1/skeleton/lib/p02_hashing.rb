class Integer
  # Integer#hash already implemented for you
end

class Array

  def hash1
    return self.object_id if self.length < 2
    key = (self.length * 534)
    hashed = []
    self.flatten.each do |ele|
      hashed << (ele.object_id * key).to_s.split.take(2)
    end
    p hash
    p this = hashed.take(6)
    p this.join("").to_i
  end

end



class String
  def hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
