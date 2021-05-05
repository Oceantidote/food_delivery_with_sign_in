class Employee
  attr_reader :password, :username, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
