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







    private
    attr_reader :boss, :name, :title, :salary

end
