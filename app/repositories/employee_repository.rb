require 'csv'
require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def build_element_from_row(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def delivery_guys
    @elements.select { |employee| employee.delivery_guy? }
  end

  def fill_csv(csv)
    csv << ["id","username","password","role"]
    @elements.each do |element|
      csv << [element.id, element.username, element.password, element.role]
    end
  end
end




















