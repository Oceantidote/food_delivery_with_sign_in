require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def find_by_min_price(price)
    @elements.select do |meal|
      meal.price > price
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id","name","price"]
      @elements.each do |element|
        csv << [element.id, element.name, element.price]
      end
    end
  end
end




















