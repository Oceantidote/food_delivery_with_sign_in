require_relative '../views/view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = View.new
  end

  def login
    # ask for username
    username = @view.ask("username")
    # ask for password
    password = @view.ask("password")
    # find employee by username
    user = @employee_repository.find_by_username(username)
    # check if employee password matches entered password
    if password == user&.password
      # if yes then return the user
      return user
    else
      # if no then give error feedback and retry
      @view.error
      login
    end
  end
end
