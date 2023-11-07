require_relative "employee"

require "byebug"

class Manager < Employee

    attr_reader :subordinates

    def self.sum_all_sub_salaries(manager)
        sum = manager.subordinates.map {|subord| subord.salary }.sum

        return sum if manager.subordinates.none? { |employee| employee.is_a?(Manager) }

        manager.subordinates.each do |subord|
            subord.is_a?(Manager) ? sum += Manager.sum_all_sub_salaries(subord) : sum += subord.salary
        end
        sum
    end

    def initialize(name, salary, boss = nil)
        super
        @subordinates = []
    end

    def bonus(multiplier)
        Manager.sum_all_sub_salaries(self) * multiplier
    end

    def add_subordinate(employee)
        @subordinates << employee
    end
end