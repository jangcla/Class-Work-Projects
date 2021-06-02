require_relative "manager.rb"
class Employee

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title   
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    def boss=(boss)
      @boss = boss
      @boss.add_employee(self)
    end

    attr_reader :name, :title, :salary
    # attr_accessor :boss

end
