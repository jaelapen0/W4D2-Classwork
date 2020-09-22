require_relative "./Employee.rb"
require "byebug"
class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary)
        super
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
        employee.boss = self
    end

    def bonus(multiplier)
        total_bonus = 0
        @employees.each do |employee|
            total_bonus += employee.salary
            if employee.is_a?(Manager)
                employee.employees.each do |sub_emp|  
                    total_bonus += sub_emp.bonus(1)
                end
            end
        end
        total_bonus * multiplier
    end

end

if $PROGRAM_NAME == __FILE__
    david = Employee.new("David", "foo", 10000)
    shawna = Employee.new("Shawna", "foo", 12000)
    darren = Manager.new("Darren", "foo", 78000)
    darren.add_employee(shawna)
    darren.add_employee(david)
    ned = Manager.new("Ned", "Boss", 1000000)
    ned.add_employee(darren)
    p ned.bonus(5) # => 500_000
    p darren.bonus(4) # => 88_000
    p david.bonus(3) # => 30_000
end