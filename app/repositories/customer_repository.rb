require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository

  def build_element_from_row(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def fill_csv(csv)
    csv << ["id","name","address"]
    @elements.each do |element|
      csv << [element.id, element.name, element.address]
    end
  end

end




















