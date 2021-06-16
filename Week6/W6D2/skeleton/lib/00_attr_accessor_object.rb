class AttrAccessorObject
  def self.my_attr_accessor(*names)

    names.each do |name|
      define_method(name) {instance_variable_get("@#{name}") }

      define_method("#{name}=") {|arg| instance_variable_set("@#{name}", arg) } 

    end

  end
end




# attr_accessor :name 
# itterate over all arguements

# attr_accessor :name

# attr_reader :name


# attr_writer :name
 