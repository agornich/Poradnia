class EmployeesController < ApplicationController
#  def index
#    @employees = Employee.all.order(:surname)
#    puts 'jestesmy w index'
#    puts @employees.count
#    puts @employees.inspect
#    
  def index
#    if current_user.is_admin   
        @employees = Employee.all
#    else
#      @employees = Employee.find_by(id: current_user.id)
#    end  
    if params[:search]
      @employees = @employees.where "name || surname || specialization LIKE ?", "%#{params[:search]}%"
    end
    
  end

#  end
  
  def show
    @employee = Employee.find( params[:id] )
    if current_user.is_admin || current_user.id == @employee.id
    else
      redirect_to root_path
    end
  end
  

  def new
    @employee = Employee.new
  end
  
  def edit
    @employee = Employee.find( params[:id] )
  end

   def create
     @employee = Employee.new( params[:employee].permit! )
    puts '-----'
    puts @employee.inspect
    if @employee.save
      redirect_to employees_path
    else
      render :new
    end  
  end
  
    def update
      @employee = Employee.find( params[:id] )
      respond_to do |format|
        if current_user.is_admin ? @employee.update(admin_user_params) : @employee.update(employee_params)
          format.html { redirect_to @employee, notice: 'Wszystko jest ok' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, alert: 'Popraw' }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

#  def update
#    @employee = Employee.find( params[:id] )
#    if @employee.update( params[:employee].permit! )
#      
#      flash[:notice] = 'Wszystko jest ok'
#      
#      redirect_to employees_path
#    else
#      flash.now[:error] = 'Popraw!!'
#      render :edit
#    end
#  end
  
 
  
  def destroy
    @employee = Employee.find( params[:id] )
    @employee.destroy
    flash[:notice] = "Usunieto workshop o ID: #{@employee.id}"
    redirect_to employees_path
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
  end
 
  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation, :name)
  end
 
  def admin_user_params
    params.require(:employee).permit(:email, :password, :name, :is_admin)
  end
	
#	skip_before_action :require_login, only: [:index, :new, :create]
  end

