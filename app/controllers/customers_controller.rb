require_relative '../views/view'
require_relative '../models/customer'

class CustomersController
  def initialize(customers_repo)
    @customers_repo = customers_repo
    @view = View.new
  end

  def list
    customers = @customers_repo.all
    @view.list(customers)
  end

  def add
    name = @view.ask("name")
    address = @view.ask("address")
    new_customer = Customer.new(name: name, address: address)
    @customers_repo.create(new_customer)
  end
end

