class Router
  def initialize(meals_controller, customers_controller)
    @customers_controller = customers_controller
    @meals_controller = meals_controller
    @running  = true
  end

  def run
    while @running do
      display_tasks
      choice = gets.chomp.to_i
      route_action(choice)
    end
  end

  def display_tasks
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - add a new meal"
    puts "3 - List all customers"
    puts "4 - add a new customer"
    puts "9 - Quit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    else
      puts "try again"
    end
  end
end
