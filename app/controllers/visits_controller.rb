class VisitsController < ApplicationController  
 def index
   @visits = Visit.all.order(:start_at)
    puts 'jestesmy w index'
    puts @visits.count
    puts @visits.inspect
  end
  
  def show
  end
  
  def new
    @visit = Visit.new
  end
  
  def create
    puts "jestem w create"
    # "workshop"=>{"name"=>""}
    @visit = Visit.new( params[:visit].permit! )
    puts '-----'
    puts @visit.inspect
    if @visit.save
      redirect_to visits_path
    else
      render :new
    end  
  end
  
  def edit
    @visit = Visit.find( params[:id] )
  end
  
  def update
    @visit = Visit.find( params[:id] )
    if @visit.update( params[:visit].permit! )
      
      flash[:notice] = 'Wszystko jest ok'
      
      redirect_to visits_path
    else
      flash.now[:error] = 'Popraw!!'
      render :edit
    end
  end
  
  def destroy
    @visit = Visit.find( params[:id] )
    @visit.destroy
    flash[:notice] = "Usunieto wizytę o ID: #{@visit.id}"
    redirect_to visits_path
  end
  
end
