require_relative "employee.rb"
class Manager < Employee

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        #total salary of all subemployees * multiplier
        self.total_salary * multiplier
    end

    def total_salary
        sum = 0
        @employees.each do |employee|
            sum += employee.salary 
        end
        sum
    end

    def add_employee(worker)
      @employees << worker
    end

    private
    attr_reader :salary, :employees
end