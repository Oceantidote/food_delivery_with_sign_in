require_relative '../views/view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repo)
    @meals_repo = meals_repo
    @view = View.new
  end

  def list
    meals = @meals_repo.all
    @view.list(meals)
  end

  def add
    name = @view.ask("name")
    price = @view.ask("price").to_i
    new_meal = Meal.new(name: name, price: price)
    @meals_repo.create(new_meal)
  end
end
