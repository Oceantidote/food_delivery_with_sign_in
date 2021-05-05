require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  def find_by_min_price(price)
    @elements.select do |meal|
      meal.price > price
    end
  end

  def build_element_from_row(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def fill_csv(csv)
    csv << ["id","name","price"]
    @elements.each do |element|
      csv << [element.id, element.name, element.price]
    end
  end
end




















