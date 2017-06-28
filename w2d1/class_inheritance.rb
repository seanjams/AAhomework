class Employee
  attr_reader :name, :title, :salary, :boss

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
    boss.employees << self
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total = @employees.reduce(0) { |sum, emp| sum + emp.salary }
    total * multiplier
  end

  def boss=(boss)
    super
    boss.employees += self.employees
  end

end

david = Employee.new("David", "TA", 10000)
shawna = Employee.new("Shawna", "TA", 12000)
darren = Manager.new("Darren", "TA Manager", 78000)
david.boss = darren
shawna.boss = darren
ned = Manager.new("Ned", "Founder", 1000000)
darren.boss = ned

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
