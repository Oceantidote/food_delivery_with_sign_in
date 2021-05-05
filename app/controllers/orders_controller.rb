require_relative "../views/view"
require_relative "../models/order"
class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meal_repository = meal_repository
    @order_repository = order_repository
    @view = View.new
  end

  def list_undelivered
    orders = @order_repository.undelivered_orders
    # 1. get the orders from the order
    @view.list_orders(orders)
    # 2. display them in the view
  end

  def list_my_undelivered_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee.id)
    @view.list_orders(orders)
  end

  def mark_delivered(employee)
    list_my_undelivered_orders(employee)
    id = gets.chomp.to_i
    @order_repository.mark_delivered(id)
  end

  def add
    # 1. display meals
    meals = @meal_repository.all
    meal = meals[@view.list_meals(meals)]

    # 2. ask for the meal choice
    # 1. display customerss
    employees = @employee_repository.delivery_guys
    employee = employees[@view.list_employees(employees)]
    # 2. ask for the customers choice
    # 1. display employees
    customers = @customer_repository.all
    customer = customers[@view.list_customers(customers)]
    # 2. ask for the employee choice
    #  create new order from choices
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # add order to repo
    @order_repository.create(order)
  end
end
