class Employee
    attr_reader :name

    def initialize(name, title, salary)
        @name = name
        @title = title
        @salary = salary
        @boss = nil
    end 


    def bonus(multiplier)
        @salary * multiplier
    end

    protected
    attr_reader :salary
    attr_writer :boss
end