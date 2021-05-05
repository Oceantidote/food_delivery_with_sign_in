class View
  def list(things)
    if things.empty?
      puts "nothing added yet"
    else
      type = things.first.class.to_s
      puts type + "s"
      things.each do |thing|
        puts "#{thing.id} - #{thing.name} - #{type == "Meal" ? thing.price : thing.address}"
      end
    end
  end

  def ask(thing)
    puts "Please enter your #{thing}"
    gets.chomp
  end

  def error
    puts "I'm afraid those credentials did not match, please try again"
  end

  def list_orders(orders)
    orders.each do |order|
      puts "#{order.id} - customer: #{order.customer.name} - meal: #{order.meal.name} - address: #{order.customer.address}"
    end
  end

  def list_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}"
    end
    puts "Enter the id of the meal you'd like"
    gets.chomp.to_i - 1
  end

  def list_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}"
    end
    puts "Enter the id of the customer you'd like"
    gets.chomp.to_i - 1
  end

  def list_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - #{employee.username}"
    end
    puts "Enter the id of the employee you'd like"
    gets.chomp.to_i - 1
  end
end

