class Employee

    attr_reader :name, :salary, :boss

    def initialize(name, salary, boss = nil)
        @name = name
        @salary = salary
        @boss = boss
        boss.add_subordinate(self) if !!boss
    end

    def bonus(multiplier)
        salary * multiplier
    end
end