require 'csv'
require_relative '../models/order'
require_relative 'base_repository'

class OrderRepository < BaseRepository

  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @elements = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def build_element_from_row(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == "true"
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    Order.new(row)
  end

  def fill_csv(csv)
    csv << ["id","meal_id","customer_id","employee_id","delivered"]
    @elements.each do |element|
      csv << [element.id, element.meal.id, element.customer.id, element.employee.id, element.delivered?]
    end
  end

  def undelivered_orders
    @elements.select { |order| !order.delivered? }
  end

  def mark_delivered(id)
    find(id).deliver!
    save_csv
  end

  def my_undelivered_orders(id)
    @elements.select { |order| !order.delivered? && order.employee.id == id }
  end

end
