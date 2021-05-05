require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end

  def all
    @employees
  end

  def create(employee)
    employee.id = @next_id
    @employees << employee
    @next_id += 1
    save_csv
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id","username","password","role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end
end




















