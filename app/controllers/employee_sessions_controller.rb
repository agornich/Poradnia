class EmployeeSessionsController < ApplicationController
  def new
	  @employee = Employee.new
  end

  def create
	  if @employee = login(params[:email], params[:password])
		  redirect_back_or_to(:employees, notice: 'Zalogowano pomyślnie!')
    else
		  flash.now[:alert] = 'Logowanie nie powiodło się.'
      render action: 'new'
    end
  end

  def destroy
    logout
	redirect_to(:employees, notice: 'Wylogowano użytkownika.')
  end
	
	skip_before_action :require_login, except: [:destroy]
	
end
