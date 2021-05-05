class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @running  = true
    @user = nil
  end

  def run
    while @running do
      @user = @sessions_controller.login
      while @user do
        if @user.delivery_guy?
          display_delivery_tasks
          choice = gets.chomp.to_i
          route_delivery_action(choice)
        else
          display_tasks
          choice = gets.chomp.to_i
          route_action(choice)
        end
      end
    end
  end

  def display_delivery_tasks
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - See all my undelivered orders"
    puts "2 - mark an order as delivered"
    puts "3 - logout"
    puts "4 - Quit"
    print "> "
  end

  def route_delivery_action(choice)
    case choice
    when 1 then puts "here are your orders"
    when 2 then puts "order delivered"
    when 3 then @user = nil
    when 4 then
      @running = false
      @user = nil
    else
      puts "try again"
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
    puts "8 - logout"
    puts "9 - Quit"
    print "> "
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then @user = nil
    when 9 then
      @running = false
      @user = nil
    else
      puts "try again"
    end
  end
end
