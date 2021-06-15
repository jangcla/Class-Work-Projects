    def prac_hash(num)
      str = num.to_s
      chars = str.split("")
      out = []
      chars.each { |char| out << (char.to_i * 302).to_s }
      out.join.to_i
    end