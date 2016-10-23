class PatientsController < ApplicationController
  
  def index
    @patients = Patient.all.order(:surname)
    puts @patients.inspect
      
    if params[:search]
      @patients = @patients.where "name || surname || pesel LIKE ?", "%#{params[:search]}%"
    end    
  end
  
  def show
    @patient = Patient.find( params[:id] )
  end
  
  def new
    @patient = Patient.new
  end
  
  def edit
    @patient = Patient.find( params[:id] )
  end

   def create
     @patient = Patient.new( params[:patient].permit! )
    puts '-----'
    puts @patient.inspect
    if @patient.save
      redirect_to patients_path
    else
      render :new
    end  
  end
  
  def update
    @patient = Patient.find( params[:id] )
    puts @patient.inspect
    if @patient.update!( params[:patient].permit! )
      
      puts @patient.inspect
      
      flash[:notice] = 'Wszystko jest ok'
      
      redirect_to patients_path
    else
      flash.now[:error] = 'Popraw!!'
      render :edit
    end
  end
  
  def destroy
    @patient = Patient.find( params[:id] )
    @patient.destroy
    flash[:notice] = "Usunieto pacjenta o ID: #{@patient.id}"
    redirect_to patients_path
  end  

end

