# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "router"

meal_repository = MealRepository.new(File.join(__dir__,"data/meals.csv"))
meals_controller = MealsController.new(meal_repository)
customer_repository = CustomerRepository.new(File.join(__dir__,"data/customers.csv"))
customers_controller = CustomersController.new(customer_repository)


Router.new(meals_controller, customers_controller).run
